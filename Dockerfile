FROM ekidd/rust-musl-builder:1.47.0 AS builder

USER root

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt update && apt install -y yarn=1.22.5-1

USER rust

RUN git clone https://github.com/koute/memory-profiler.git . && \
    git checkout b3ae0113e0e4e145d97b6e767fc99f134ca80ac2

RUN cargo build --release -p memory-profiler-cli 

FROM alpine:3.12

COPY --from=builder \
    /home/rust/src/target/x86_64-unknown-linux-musl/release/memory-profiler-cli \
    /usr/local/bin/

EXPOSE 8080

VOLUME [ "/data" ]

CMD /usr/local/bin/memory-profiler-cli server -i 0.0.0.0 /data/*.dat
