# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/aukkonen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
zstyle ':completion:*' menu yes select

eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
eval "$(oh-my-posh init zsh --config ~/peru-shell.omp.json)"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if whence -w ll | grep "alias"; then
    unalias ll
fi

if whence -w la | grep "alias"; then
    unalias la
fi
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

function ll
{
if [ $# -lt 1 ]
  then
    eza -lh -B --icons --no-user --group-directories-first  --time-style long-iso
    return
fi

eza $1 -lh -B --icons --no-user --group-directories-first  --time-style long-iso
}

function la
{
if [ $# -lt 1 ]
  then
    eza -lha -B --icons --no-user --group-directories-first  --time-style long-iso
    return
fi
eza $1 -lha -B --icons --no-user --group-directories-first  --time-style long-iso
}

function mdmore
{
markdown  $1 | lynx -stdin
}

alias dir='eza --icons --group-directories-first'
alias cls="printf '\033[2J\033[3J\033[H'"
alias cursorblink="printf '\x1b[1 q'"


alias nano="$(brew --prefix)/bin/nano"
