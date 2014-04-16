# My dotfiles

Actually, they're mostly my workplace dotfiles: as they are shared with my
colleagues on the servers, I don't put too much customisation in it (like
unbinding arrows in Vim). At least not anything that would change to much the
default behavior of a program, I almost got beaten to death for that and it's
definitely not cool.

## How to install?

Use `make vim` to install vim config, `make mutt` for mutt, etc. The Makefile
proceeds like this:
* it takes the original config file, and put it *in place* of the one in the
  dotfiles directory ;
* it then replaces it with a symlink in the dotfiles dir.

It also keeps a backup of your original config file in the `backup/` directory,
just in case, but this way you get to keep all config file like they were
before. Then, you get to `make diff`, which is just calling `git difftool`, and
you're good to merge your local changes with the repo.

It's a pretty cool enhancement over most Makefiles found in *dotfiles* repos
around, as they often don't take care of existing files. Of course for your own
computer you don't care, but when taking over a few hundred servers, you may
get your head on a pike for erasing somebody's config with a script (I, at
least, would get yours).

