# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


#-------------------------------------------------------
#-----------------MY STUFF------------------------------
#-------------------------------------------------------

export SCRIPTS="$HOME/Scripts"
export winDW="/mnt/c/Users/User/Downloads"

bind 'set bell-style none'

# alias repos='cd /mnt/c/B111/Repos/' #TEMP

repos () {
    cd "/mnt/c/B111/Repos/$(ls '/mnt/c/B111/Repos/' | fzf -e --border=sharp --no-unicode)"
}

alias cls='clear' #TEMP
alias getTime="$SCRIPTS/Time/time.bash" #prints time, when has internet connection
alias delHaskObjs="rm *.o *.hi *.dyn_o *.dyn_hi"
alias startClock="$SCRIPTS/Time/startClock.bash" #startClock

alias cpBuf="$SCRIPTS/Buffer/cpBuf.sh"
alias mvBuf="$SCRIPTS/Buffer/mvBuf.sh"
alias updBuf="$SCRIPTS/Buffer/updBuf.sh"
alias emptyBuf="$SCRIPTS/Buffer/emptyBuf.sh"

alias cmd="/mnt/c/Windows/System32/cmd.exe"

alias slock='cmatrix -asB -u 4 -C cyan'

alias rm="rm -i"

winBuf="/mnt/c/B111/WSLBuffer"
wslBuf="$HOME/.winBuffer"
todos="$HOME/ToDos"

alias hoogle="$SCRIPTS/Hoogle/hoogle"
alias addMusic="$SCRIPTS/AddMusic/addMusic.sh"

alias winb111="cd /mnt/c/B111/"
alias dtop="cd /mnt/c/Users/User/Desktop"

LS_COLORS='rs=0:di=4;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=4;34:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.axa=00;36:*.oga=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

#PS1='\e[37;1m\u@\e[35m\W\e[0m\$'


#toilet -t --gay  " | ^  Willkommen  ^ |"

export EDITOR=vim

alias td="todo +children"

buy () {
	buyName="$*"
	tda --database "$HOME/.todos/BuyList/.todo" $buyName
}

home () {
	businessName="$*"
	tda --database "$HOME/.todos/HomeStuff/.todo" $businessName
}

alias adbStart='cmd /c C:\\B111\\Tools\\platform-tools-Android\\adb.exe devices'
alias pip='pip3'
alias python='python3'
alias pyCheck='python3 -m py_compile'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

ps1Short () {
    dontDoPowerLine="Yes"
	PS1='>'
}

ps1Norm () {
    dontDoPowerLine="Yes"
    PS1='\!|[#\[\e[38;5;123m\]\u\[\e[0m\]#]@\[\e[38;5;123m\]\h:\[\e[95m\]\W\[\e[36m\]\$\[\e[0m\] '
}

ps1Power () {
    dontDoPowerLine=""
}

reloadBash () {
    source "$HOME/.bashrc"
}

exp () {
    [ -z "$1" ] || explorer.exe $1 && explorer.exe . 
}

lls () {
    (ls -A | fzf) >> /dev/null
}

ccd () {
    cd $(find . -maxdepth 1 -type d | sed "s/^..//" | fzf)
}

function _update_ps1() {
    [ -z "$dontDoPowerLine" ] && PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

personal_database_path="$HOME/.local/personal_database/"
working_directory_file_container_name="working_dir"
file_buffer_dir_name="file_buffer"

wdSet () {
    echo "$PWD" > "$personal_database_path/$working_directory_file_container_name"
    echo "Working directory is successfully set as '$PWD'"
    wd="$PWD"
}

wdGo () {
    cd $(cat "$personal_database_path/$working_directory_file_container_name")
}

# wdCheck() to see where it will point to?
wd () {
    [ -z "$wd" ] && wd=$(cat "$personal_database_path/$working_directory_file_container_name") && echo $wd || echo $wd
}

bufClr () {
    rm -rf "$personal_database_path/$file_buffer_dir_name"
    mkdir "$personal_database_path/$file_buffer_dir_name"
}

bufPush () {
    buf_destination="$personal_database_path/$file_buffer_dir_name"
    # if adding a directory, then copy all its contents
    # else, copy just that file

    for arg
    do
        [ -d "$arg" ] && cp -r "$arg" "$buf_destination" || cp "$arg" "$buf_destination"
    done
}

bufPaste () {
    [ -z "$1" ] && dest="." || dest="$1"

    src="$personal_database_path/$file_buffer_dir_name/"

    cp -rT "$src" "$dest"
    cp -rT "$src" "$dest"

    echo "Buffer is pasted!"

}

bufCheck () {

    buf="$personal_database_path/$file_buffer_dir_name"

    [ "$(ls -A $buf)" ] && echo "Buffer is NOT empty!" || echo "Buffer is EMPTY!"

}

bufGo () {
    
    buf="$personal_database_path/$file_buffer_dir_name"

    pushd .

    cd "$buf"

}

alias config='/usr/bin/git --git-dir=/home/b111/.cfg/ --work-tree=/home/b111'

alias vim='nvim'

