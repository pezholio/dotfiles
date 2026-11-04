![CI](https://github.com/pezholio/dotfiles/workflows/CI/badge.svg)

# My Dotfiles

Contains my personal dotfiles and configuration for various tools and applications to give me a nice and consistent 
development environment across all my machines. It is designed to be used on macOS, but most of the configuration 
should (probably!) work on Linux as well.

Includes configuration for:

- Oh My Zsh
- Ruby (via rbenv)
- Node.js (via nodenv)
- Python (via pyenv)
- Go (via goenv)
- Various command-line tools and utilities
- A gitprompt theme for a better git experience in the terminal

It also contains my Karabiner configuration for remapping keys on macOS (hello media keys and custom shortcuts!), as 
well as a setting the wallpaper programmatically on macOS (via [desktoppr](https://github.com/scriptingosx/desktoppr)).

## Homebrew

The setup script will install Homebrew if it is not already installed, and then use the Brewfile to install all the 
necessary packages and applications. Additionally, it will also add anything installed via Homebrew to the Brewfile and
push the changes to this repository, so that the Brewfile is always up to date!

## Setup

I decided not to use a framework for now, so setting up is as simple as cloning
the repo in your home directory like so:

```bash
git clone https://github.com/pezholio/dotfiles.git ~/.dotfiles
```

And then run the setup script to install the dependencies and set everything up:

```bash
script/bootstrap
```
