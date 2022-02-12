# History control
# don't use duplicate lines or lines starting with space
#HISTSIZE=1000
#HISTFILESIZE=2000

# ------- CUSTOM BELOW ---------

# ------- CUSTOM BELOW ---------
# Save all commands (negative = no limit)
HISTSIZE=-1
HISTFILESIZE=-1
# https://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows
# Avoid duplicates
HISTCONTROL=ignoredups:erasedups
# When the shell exits, append to the history file instead of overwriting it
shopt -s histappend
# After each command, append to the history file and reread it
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
EXECIGNORE=$(which signal-desktop):/snap/bin/signal-desktop

# ----------------------
# Aliases
# ----------------------
# -- Bash
alias pip3='python3 -m pip'
alias pp='python3'
alias ipp='ipython'
alias ipp='ipython'
alias cp='cp -rv'
alias ls='ls --color=auto --group-directories-first'
alias ll='ls --color=auto -alh --group-directories-first'
alias grep='grep --color=auto'
alias mkdir='mkdir -pv'
alias mv='mv -v'
alias wget='wget -c'

alias findport='sudo lsof -t -i:'  # e.g. -i:9001
alias killport='sudo fuser -n tcp -k ' #eg -k 9001

# -- Python
alias mkenv='python3 -m venv env && startenv && pip3 install --upgrade pip && pip3 install wheel && echo done'
alias installsci='source ./env/bin/activate && which python && pip3 install numpy scipy matplotlib jupyterlab pandas seaborn && deactivate && echo done'
alias installml='source ./env/bin/activate && which python && pip3 install pillow opencv-contrib-python torch keras tensorflow gym && echo done'
alias senv='source ~/v3/bin/activate'
alias startenv='source ./env/bin/activate && which python3'
alias stopenv='deactivate'

alias jlab='jupyter lab'

# --- Git
alias ga='git add'
alias gr='git rm'
alias gaa='git add .'
alias gcl='git clone'
alias gcmm='git commit'
alias gcm='git commit --message'
alias gp='git push'
alias gpl='git pull'
alias gs='git status'
alias gco='git checkout'


# Use programs without a root-equivalent group
# alias npm='sudo npm'

# Show contents of dir after action
function cd () {
    builtin cd "$1"
    ls
}

# Add GitLab remote to cwd git
function glab () {
    git remote set-url origin --add git@gitlab.com:nouyang/"${PWD##*/}".git
    git remote -v
}

# Vim for life
export EDITOR=/usr/bin/vim

# Bash completion (for git colors0
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Color prompt
export TERM=xterm-256color


# --
# Notes on bash colors
#txtred='\[\e[0;31m\]' # Red
#txtgrn='\[\e[0;32m\]' # Green
#txtylw='\[\e[0;93m\]' # Yellow
#txtblu='\[\e[0;34m\]' # Blue

# ---
# Git prompt
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWCOLORHINTS=1

# green, blue, red:
#export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
# yellow time, green username, blue location, red git branch:
export PS1='\[\033[93m\]\t \[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
# export PROMPT_COMMAND=date

# ---
# Color python error output
# ---
# see http://orangenarwhals.com/hexblog/2019/12/27/coloring-python-debug-output/
norm="$(printf '\033[0m')" #returns to "normal"
bold="$(printf '\033[0;1m')" #set bold
red="$(printf '\033[0;31m')" #set red
boldyellowonblue="$(printf '\033[0;1;33;44m')" #set blue bkgrd, bold yellow text
boldyellow="$(printf '\033[0;1;33m')" #set gold yellow text
boldred="$(printf '\033[0;1;31m')" #set bold red

# Color error messages from python, use as "copython test.py" instead of "python test.py"
# WARNING: Takes time to run (small but noticeable)
# May also interfer with print to console (for long running programs) 

copython() {
    python $@ 2>&1 | sed -e "s/Traceback/${boldyellowonblue}&${norm}/g" \
        -e "s/File \".*\.py\".*$/${bold}&${norm}/g" \
        -re "s/\, line [0-9]\+/${boldred}&${norm}/g" \
        -re "s/ {4}(.*)$/${boldyellow}&${norm}/g" \ 
        -e "s/.*Error:.*$/${boldred}&${norm}/g" 
    }
 
    # -r: extended, not need escape parens: https://stackoverflow.com/a/2778096
    # Note: sed does not have \d shorthand; use [0-9] or [[:digit:]]
    
#  File "error.py", line 2  <-- Match all line including File, then match anything containing digits onward
#    asdf  <- match anything after four spaces, including spaces
#    ^
# IndentationError: unexpected indent <-- Match anything including "Error" in the line

# -----
# Custom functions
# -----
source /usr/share/autojump/autojump.bash
alias tt='~/terminalTimer.sh'
alias now='~/nowWeather.sh'

alias scalef='gsettings set org.gnome.desktop.interface text-scaling-factor'

# Add an "alert" alias for long running commands.  Use like so $ sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

export TODO=~/.todo
#touch $TODO
function todo() { if [ $# == "0" ]; then cat $TODO; else echo "• $@" >> $TODO; fi }
#function todone() { sed -i -e "/$*/d" $TODO; }

# version with numbers
#function todo() { if [ $# == "0" ]; then cat $TODO; else n=$(($(tail -1 $TODO | cut -d ' ' -f 1)+1)); echo "$n ⇾ $@" >> $TODO; fi }
function todone() { sed -i -e "/$*/d" $TODO; }


# Persist agents
#if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  #eval `ssh-agent`
  #ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
#fi
#export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
#ssh-add -l > /dev/null || ssh-add


BTMAC=00:00:00:00:89:97
BTMAC2=00:00:00:00:E6:13

SUPEREQ1MAC=00:23:03:00:B1:A7

alias con='<<< "connect $SUPEREQ1MAC" bluetoothctl'
alias dcon='<<< "disconnect $SUPEREQ1MAC" bluetoothctl'

function audioss() {
    sinks=($(pacmd list-sinks | grep index | \
        awk '{ if ($1 == "*") print "1",$3; else print "0",$2 }'));
    inputs=($(pacmd list-sink-inputs | grep index | awk '{print $2}'));

    [[ ${sinks[0]} = 0 ]] && swap=${sinks[1]} || swap=${sinks[3]};

    pacmd set-default-sink $swap &> /dev/null;
}

#alias audios= # switch
#alias con2='<<< "connect $BTMAC2" bluetoothctl'

#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/jade/Documents/projects/ATC3DGTracker/lib

# Install Ruby Gems to ~/gems
#export GEM_HOME="$HOME/gems"
#export PATH="$HOME/gems/bin:$PATH"
export PATH=${PATH}:${HOME}/.local/bin
#export PATH='$HOME/.local/bin:$PATH'
