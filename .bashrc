# History control
# don't use duplicate lines or lines starting with space
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
# append to the history file instead of overwrite
shopt -s histappend

# Aliases
alias cp='cp -rv'
alias ls='ls --color=auto --group-directories-first'
alias ll='ls --color=auto -alh --group-directories-first'
alias grep='grep --color=auto'
alias mkdir='mkdir -pv'
alias mv='mv -v'
alias wget='wget -c'

alias ga='git add'
alias gr='git rm'
alias gaa='git add .'
alias gcm='git commit'
alias gcmm='git commit --message'
alias gp='git push'
alias gpl='git pull'
alias gs='git status'

alias mkenv='python3 -m venv env'
alias senv = 'source ~/v3/bin/activate'
alias startenv ='source env/bin/activate && which python3'
alias stopenv='deactivate'

# Use programs without a root-equivalent group
# alias npm='sudo npm'

# Show contents of dir after action
function cd () {
    builtin cd "$1"
    ls 
}

# Add GitLab remote to cwd git
function glab () {
    git remote set-url origin --add git@gitlab.com:victoriadrake/"${PWD##*/}".git
    git remote -v
}

# Vim for life
export EDITOR=/usr/bin/vim

# Bash completion
source ~/.git-completion.bash

# Color prompt
export TERM=xterm-256color

# Colours have names too. Stolen from @tomnomnom who stole it from Arch wiki
txtblk='\[\e[0;30m\]' # Black - Regular
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;93m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;96m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
bldblk='\[\e[1;30m\]' # Black - Bold
bldred='\[\e[1;31m\]' # Red
bldgrn='\[\e[1;32m\]' # Green
bldylw='\[\e[1;33m\]' # Yellow
bldblu='\[\e[1;34m\]' # Blue
bldpur='\[\e[1;35m\]' # Purple
bldcyn='\[\e[1;36m\]' # Cyan
bldwht='\[\e[1;37m\]' # White
unkblk='\[\e[4;30m\]' # Black - Underline
undred='\[\e[4;31m\]' # Red
undgrn='\[\e[4;32m\]' # Green
undylw='\[\e[4;33m\]' # Yellow
undblu='\[\e[4;34m\]' # Blue
undpur='\[\e[4;35m\]' # Purple
undcyn='\[\e[4;36m\]' # Cyan
undwht='\[\e[4;37m\]' # White
bakblk='\[\e[40m\]'   # Black - Background
bakred='\[\e[41m\]'   # Red
badgrn='\[\e[42m\]'   # Green
bakylw='\[\e[43m\]'   # Yellow
bakblu='\[\e[44m\]'   # Blue
bakpur='\[\e[45m\]'   # Purple
bakcyn='\[\e[46m\]'   # Cyan
bakwht='\[\e[47m\]'   # White
txtrst='\[\e[0m\]'    # Text Reset

# Prompt colours
atC="${txtpur}"
nameC="${txtblu}"
hostC="${txtpur}"
pathC="${txtcyn}"
gitC="${txtpur}"
pointerC="${txtwht}"
normalC="${txtrst}"

# Red pointer for root
if [ "${UID}" -eq "0" ]; then
    pointerC="${txtred}"
fi

gitBranch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="${pathC}\w ${gitC}\$(gitBranch) ${pointerC}\$${normalC} "

# Eddie
#python3 ~/src/ghub/eddie-terminal/randline.py ~/src/ghub/eddie-terminal/greetings.txt Victoria

# oh-my-git prompt
#source ~/.oh-my-git/prompt.sh

#VIRTUAL_ENV_DISABLE_PROMPT=true
#function omg_prompt_callback() {
#    if [ -n "${VIRTUAL_ENV}" ]; then
#        echo "\e[0;31m(`basename ${VIRTUAL_ENV}`)\e[0m "
#    fi
#}


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

alias tt='~/terminalTimer.sh'