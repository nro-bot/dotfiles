# Quickstart

```
cd ./scripts
sh ./setup.sh
```

## To add script

Put in root dir
```
$ dotfiles/myscript.sh
```
Edit `scripts/symlink.sh`


# Dotfiles and scripts that behave in much the same way that manual configurations don't

My personal set-up scripts. I wrote about these in this [accompanying article](https://victoria.dev/verbose/how-to-set-up-a-fresh-ubuntu-desktop-using-only-dotfiles-and-bash-scripts/).

## `scripts/`

* `symlink.sh` sets up symlinks in `$HOME`
* `aptinstall.sh` is for Ubuntu repository installs
* `programs.sh` is for other software
* `desktop.sh` is for GNOME desktop settings
* `setup.sh` runs all the scripts and an `apt upgrade`

## TODO

/ fix cat rsa pub
/ fix vimrc (update to new with ,s)
- fix not middle click copying out of vim
- fix mouse focus gsettings
- add font scale shortcut
- change gnome-terminal to more pleasing scheme (not purple background vs light blue)
- edit bashprompt to show there are git changes
- add in gTile somehow
- change to quite alert sound

notes: get used to ll, gcmm
