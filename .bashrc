# History control
# don't use duplicate lines or lines starting with space
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# ------- CUSTOM BELOW ---------

# append to the history file instead of overwrite
shopt -s histappend

# ----------------------
# Aliases
# ----------------------
# -- Bash
alias cp='cp -rv'
alias ls='ls --color=auto --group-directories-first'
alias ll='ls --color=auto -alh --group-directories-first'
alias grep='grep --color=auto'
alias mkdir='mkdir -pv'
alias mv='mv -v'
alias wget='wget -c'

# -- Python
alias mkenv='python3 -m venv env'
alias senv='source ~/v3/bin/activate'
alias startenv='source env/bin/activate && which python3'
alias stopenv='deactivate'

# --- Git
alias ga='git add'
alias gr='git rm'
alias gaa='git add .'
alias gcm='git commit'
alias gcmm='git commit --message'
alias gp='git push'
alias gpl='git pull'
alias gs='git status'

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


# Git prompt
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

# ---
# Color python error output
# ---
# see http://orangenarwhals.com/hexblog/2019/12/27/coloring-python-debug-output/
norm="$(printf '\033[0m')" #returns to "normal"
bold="$(printf '\033[0;1m')" #set bold
red="$(printf '\033[0;31m')" #set red
boldyellowonblue="$(printf '\033[0;1;33;44m')" #set bold, and set red.
boldyellow="$(printf '\033[0;1;33m')" #set bold, and set red.
boldred="$(printf '\033[0;1;31m')" #set bold, and set red.

copython() {
    python $@ 2>&1 | sed -e "s/Traceback/${boldyellowonblue}&${norm}/g"  # will color any occurence of someregexp in Bold red
}



# -----
# Custom functions
# -----
source /usr/share/autojump/autojump.bash
alias tt='~/terminalTimer.sh'
# Add an "alert" alias for long running commands.  Use like so $ sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
