export EDITOR="vim"

if [ -n "$BASH_VERSION" ]; then
  shopt -s histappend
  HISTCONTROL=ignoredups:erasedups
  HISTSIZE=10000
  HISTFILESIZE=20000
elif [ -n "$ZSH_VERSION" ]; then
  setopt hist_ignore_dups
  setopt hist_find_no_dups
  HISTSIZE=10000
  SAVEHIST=20000
  HISTFILE=~/.zsh_history
fi

export TERM="xterm-256color"

if [ -n "$BASH_VERSION" ]; then
  export PS1='[\u@\h \W]\$ '
elif [ -n "$ZSH_VERSION" ]; then
  export PROMPT='%n@%m %1~ %# '
fi

if [ -f "$HOME/.bashrc" ]; then
  source "$HOME/.bashrc"
fi

if [ -f "$HOME/.zshrc" ]; then
  source "$HOME/.zshrc"
fi

if [ -n "$BASH_VERSION" ]; then
  export LS_COLORS="di=34:ln=36:so=35:pi=33:ex=32:*.tar=31"
elif [ -n "$ZSH_VERSION" ]; then
  export LS_COLORS="di=34:ln=36:so=35:pi=33:ex=32:*.tar=31"
fi
