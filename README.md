# Minimal Go Snap

I really like the idea of [Ubuntu Core](https://ubuntu.com/core) and snaps. Although [the documentation](https://forum.snapcraft.io/t/the-dump-plugin/8007) is at times scattered, I am happily using snaps on my Raspberry Pi because of the sandboxing and automatic OS updates it provides.

But cross-compiling Go from Intel macOS to arm64 Linux wasn't easily possible ([PR from 2017, no longer works](https://github.com/snapcore/snapcraft/pull/1338) – [forum thread, no help either](https://forum.snapcraft.io/t/cross-compile-support-for-go-plugin/389/10) – [change from 2022, also didn't work](https://github.com/snapcore/snapcraft/pull/3712)).

As a work-around for these issues, I wrote this minimal sample project that **cross-compiles** and builds a arm64 go-lang web-server snap for Raspberry Pi **without any snapcraft tooling, without opaque YAML files, and without virtual machines**.

The only build requirements are:

 1. [go compiler](https://go.dev)
 2. [make](https://www.gnu.org/software/make/manual/html_node/index.html)
 3. [squashfs-tools](https://github.com/plougher/squashfs-tools)

You probably have all 3 already installed.

## Usage

To run locally during development:

`make run`

To build a snap:

`make build`


## License 

MIT:

Copyright 2023 remove.codes contributors

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
