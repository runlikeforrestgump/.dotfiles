# Initialization
autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -U compinit && compinit

export EDITOR="vim"
bindkey -e  # emacs mode

# Keep 10000 lines of history within the shell and save it to ~/.zsh_history:
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Keybindings
bindkey "\e[1~" beginning-of-line 
bindkey "\e[4~" end-of-line 
bindkey "\ep" history-beginning-search-backward
bindkey "\en" history-beginning-search-forward
bindkey "\e[3~" delete-char 
bindkey "\e[2~" quoted-insert 
bindkey "\e[5C" forward-word 
bindkey "\e[5D" backward-word 
bindkey "\e[1;5C" forward-word 
bindkey "\e[1;5D" backward-word 
bindkey "\e[8~" end-of-line 
bindkey "\eOc" forward-word 
bindkey "\eOd" backward-word 
bindkey "\eOH" beginning-of-line 
bindkey "\eOF" end-of-line 
bindkey "\e[H" beginning-of-line 
bindkey "\e[F" end-of-line

bindkey '^R' history-incremental-search-backward

# Annoying beeps
unsetopt beep
unsetopt hist_beep
unsetopt list_beep

# Terminal Prompt
precmd() {
    print -Pn "\e]0;%~\a"
}
PROMPT="%{$fg[green]%}[%n@%m]%#%{$reset_color%} "
RPROMPT="%{$fg_bold[blue]%}%~%{$reset_color%}"

# Aliases
alias ack='ack --nohtml --noxml --ignore-dir=test-output --ignore-dir=target'
alias df='df -h -x none'
alias gitblame='git blame -c --date=short'
alias gittags='git log --date-order --tags --simplify-by-decoration --pretty=format:"%an %n %ai %h %d %n"'
alias ls='ls -hl --color=auto --time-style=long-iso'
alias lsb='/bin/ls -bl --color=auto --time-style=long-iso'
alias lsblk='lsblk -p -o NAME,TRAN,VENDOR,MODEL,FSTYPE,MOUNTPOINT,LABEL,SIZE'
alias perlcscope='ack -f --perl | cscope -b -q -i -'

# gpg-agent
GPG_TTY=$(tty)
export GPG_TTY

# ssh-agent
ssh-add -l >/dev/null 2>&1
if [ $? = 2 ]; then
    eval $(ssh-agent)
    ssh-add
fi

# Grep stuffs
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

# Coloured man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}

# Auto complete rules
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'j

PERL_MB_OPT="--install_base \"/home/USER/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/USER/perl5"; export PERL_MM_OPT;
