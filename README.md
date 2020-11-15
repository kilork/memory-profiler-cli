# memory-profiler-cli - A memory profiler for Linux

This is dockerized version of <https://github.com/koute/memory-profiler.git>.

## License

This project is dual-licensed under Apache 2.0 and MIT.

## Usage

You need to copy or mount you data to `/data`. To collect data you need to use memory-profiler itself. This is only analysis tool.

Example for `ripgrep`:

```bash
$ docker run -v "$(pwd)":/data -it --rm kil0rk/memory-profiler
# cargo install ripgrep
# cd /data
# memory-profile rg set /etc
# exit
$ docker run -p 8080:8080 -v "$(pwd)":/data -it --rm kil0rk/memory-profiler-cli
```

Now you can visit `http://localhost:8080` and check memory allocation and leak report.

## Changelog

### v1.0.0

- initial revision
