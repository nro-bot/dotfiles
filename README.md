
# Quickstart 
Run 
```
cd ./scripts
bash ./RUNME.sh
```

# Fork by nouyang

Original source:
https://github.com/victoriadrake/dotfiles/

What I added: 
Set up a ssh key
Terminal Timer (for pomodoros), with sound effect (.wav)
Removed a lot of visual studio stuff



## To add script

Put in root dir
```
$ dotfiles/myscript.sh
```
Edit `scripts/symlink.sh` to link it to ~
Edit ~/.bashrc to give it a short alias

## Useful

```
gsettings list-recursively
```

# Dotfiles and scripts that behave in much the same way that manual configurations don't

My personal set-up scripts. I wrote about these in this [accompanying article](https://victoria.dev/verbose/how-to-set-up-a-fresh-ubuntu-desktop-using-only-dotfiles-and-bash-scripts/).

## `scripts/`

* `symlink.sh` sets up symlinks in `$HOME`
* `aptinstall.sh` is for Ubuntu repository installs
* `programs.sh` is for other software
* `desktop.sh` is for GNOME desktop settings
* `setup.sh` runs all the scripts and an `apt upgrade`

## TODO

+ fix cat rsa pub
+ fix vimrc (update to new with ,s)
- fix not middle click copying out of vim
- fix mouse focus gsettings
+ add gedit font scale shortcut
- change gnome-terminal to more pleasing scheme (not purple background vs light blue)
+ edit bashprompt to show there are git changes
+ add in gTile somehow
- change to quite alert sound

notes: get used to ll, gcmm


# Note for updating

Change ./git/config to git@github.com:nouyang/dotfiles.git


# Notes 

also see 

https://github.com/victoriadrake/dotfiles

Where `SETTINGS_BACKUP` is wherever you backed up/want to back up your settings (aptly named, isn't it?), load settings.dconf with:

```
dconf load /org/gnome/ < $(SETTINGS_BACKUP)/.config/dconf/settings.dconf
```

Back up new settings with:

```
dconf dump /org/gnome/ > $(SETTINGS_BACKUP)/.config/dconf/settings.dconf
```

Run `man dconf` on your machine for more.
