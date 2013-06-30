# Fish Shell Module for Boxen

Installs the [fish shell](http://fishshell.com/), configures it as a valid
shell for the OS, and optionally sets it as your default shell.

[![Build Status](https://travis-ci.org/boxen/puppet-fish.png?branch=master)](https://travis-ci.org/boxen/puppet-fish)

## Usage

```puppet
# Install fish
include fish

# Install fish, but don't set it as your default shell
class { 'fish':
  chsh => false,
}
```

## Required Puppet Modules

* `boxen`
* `homebrew`
* `osx`
* `stdlib`

## Development

Set `GITHUB_API_TOKEN` in your shell with a [Github oAuth Token](https://help.github.com/articles/creating-an-oauth-token-for-command-line-use) to raise your API rate limit. You can get some work done without it, but you're less likely to encounter errors like `Unable to find module 'boxen/puppet-boxen' on https://github.com`.

Then write some code. Run `script/cibuild` to test it. Check the `script`
directory for other useful tools.

## Credits

This module is heavily inspired by the [zsh module](http://github.com/boxen/puppet-zsh).
