Toy Robot
=========

[![Dependency Status](https://www.versioneye.com/user/projects/5545adbc5d4f9a0b990000d2/badge.svg?style=flat)](https://www.versioneye.com/user/projects/5545adbc5d4f9a0b990000d2)

Toy Robot is a minimalistic toy robot ruby implementation conforming to the specifications from the [problem description](PROBLEM.md).

Testing
-------

Tests are supplied as rspec tests and a set of example input files.

To run rspec tests:

```
bundle
bundle exec rspec -f d
```

Running
-------

To run the toy robot against an input file:

```
ruby toyrobot.rb examples/example1.txt
```

A small change
