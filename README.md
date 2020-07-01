# My Dotfiles

It's about time I started doing this properly

## Setup

I decided not to use a framework for now, so setting up is as simple as cloning
the repo in your home directory like so:

```bash
git clone https://github.com/pezholio/dotfiles.git ~/.dotfiles
```

Running the setup script:

```bash
script/bootstrap
```

And then adding the following to your `.zshrc`

```bash
. ~/.dotfiles/.bash_profile
```

This will probably evolve as time goes on though.
