export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

autoload -Uz compinit
compinit

zstyle ':completion:*' menu yes select

alias nano='/opt/homebrew/bin/nano'
alias cls="printf '\033[2J\033[3J\033[H'"
alias ls="ls -G"
PS1='$ '
# eval "$(oh-my-posh --config "~/default.omp.json" init zsh)"
# eval "$(oh-my-posh --config "~/pixelrobots.omp.json" init zsh)"
# eval "$(oh-my-posh --config "~/multiverse-neon.omp.json" init zsh)"
eval "$(oh-my-posh --config "~/peru-shell.omp.json" init zsh)"
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/jonnychipz.omp.json)"
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/kushal.omp.json)"
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/zash.omp.json)"
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/lightgreen.omp.json)"
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/lambdageneration.omp.json)"
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/multiverse-neon.omp.json)"
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/powerlevel10k_classic.omp.json)"
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/powerlevel10k_rainbow.omp.json)"
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/quick-term.omp.json)"
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/space.omp.json)"
# eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/tokyo.omp.json)"

function mdmore
{
markdown $1 | lynx -stdin
}

function ll
{
if [ $# -lt 1 ]
  then
    eza -lh -B --icons --group-directories-first  --time-style long-iso
    return
fi

eza $1 -lh -B --icons --group-directories-first  --time-style long-iso
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
alias dir='eza --icons --group-directories-first'

