# dotfiles

My environment configuration files.

Install scripts are defined in `script/`.

## Quick Start

On a MacOS, run the setup script to install everything and set up symlinks for
corresponding config:

```bash
./setup
```
Linux support will probably come eventually.

## Installed Packages

Below are all the things these dotfiles install/configure.

### Homebrew

[Link](https://brew.sh/)

My preferred manager on MacOS.

There is also a Brewfile which installs all the apps & dependencies that are
configured by this repo.

### Neovim

[Link](https://neovim.io/)

My preferred code editor.

Neovim is installed via Homebrew, as are it's dependencies. All are the nightly
(`--HEAD`) versions to provide bleeding edge features.

Neovim plugins are managed with [Packer](https://github.com/wbthomason/packer.nvim)
and, configuration for the most of these plugins is found in `./neovim/plugins/`.

### Kitty

[Link](https://sw.kovidgoyal.net/kitty/)

My preferred terminal emulator.

Kitty is installed via Homebrew, and configured via the file in `./kitty/kitty.conf`.

I like to use the [themes kitten](https://sw.kovidgoyal.net/kitty/kittens/themes/)
for working with colors.

### Fish

[Link](https://fishshell.com)

My preferred shell.

Fish is installed with Homebrew and plugins are managed with
[OMF](https://github.com/oh-my-fish/oh-my-fish).

Relevant config for fish and associated plugins are located in `./fish`.

### Hammerspoon

A neat MacOS scripting tool, which I like to use for window management.

Hammerspoon is installed via Homebrew, and my script lives in
`./hammerspoon/init.lua`. Give that lua script a read for more info on my window
management keyboard shortcuts.

### And more!

There are a few more tools these dotfiles install and configure, like
[bat](https://github.com/sharkdp/bat) and [tmux](https://github.com/tmux/tmux).
I tend to experiment a lot with removing/adding tools like those so I won't list
them out in detail.

That way if I change anything, this README doesn't have to be updated ;)

## Caveats

These dots are primarily used to manage my _existing_ MacOS machine (an M1
Macbook Air, specifically). I haven't had to run `./setup` this on a clean
install in a while, and I wouldn't expect it to work well out of the box.

It is also purely written for MacOS, so while the script will run on other Unix
platforms, it _will break_.

All that said, I don't want these caveats to scare anyone off. I think these
dotfiles could serve as a useful starting point for someone looking to
automating their dev setup, so long as they're willing to read thru a bit of
code.
