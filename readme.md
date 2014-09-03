# Introduction

sinoma is a simple command line tool that forwards messages from a named pipe to your android device
using the ruby-notify-my-android gem. Sending a notification was never easier.

# Why would you use it?

With sinoma you need only file handling to send notifications instead of linking an http library.

# Usage

~~~ bash
$ mkfifo a_named_pipe
$ sinoma -k your_nma_api_key ./a_named_pipe
$ echo "this is a test message" > ./a_named_pipe
~~~

