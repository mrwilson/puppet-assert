## puppet-assert

 [![Build Status](https://travis-ci.org/mrwilson/puppet-assert.png?branch=master)](https://travis-ci.org/mrwilson/puppet-assert)

A bash utils library for assertions against the current state of the system according to puppet - will return exit code 0 for success and anything else is a failure.

puppet-assert requires [jq](https://stedolan.github.io/jq/).

## Loading
```bash
git clone https://github.com/mrwilson/puppet-assert
source puppet-assert/puppet-assert.sh
```

## Example use
```bash
assertFile "/etc/init.d" hasMode 755 # 0 if true, 1 otherwise
```

## What problem does this solve?

puppet-assert aims to provide a clean assertion DSL (with minimal dependencies) to test whether a machine has been provisioned correctly.
