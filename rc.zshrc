echo "Loading..."

setopt PROMPT_SUBST
NEWLINE=$'\n'
PROMPT="%F{242}[%*]%f %F{39}%n%f%F{242}@%m%f %F{81}%~%f\${NEWLINE}%F{75}❯%f "

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY          
setopt HIST_IGNORE_ALL_DUPS   
setopt HIST_REDUCE_BLANKS     

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 
zstyle ':completion:*' menu select                      
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"       

if [ "$(uname)" = "Darwin" ]; then
    alias ls='ls -G' 
else
    alias ls='ls --color=auto' 
fi

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
alias reload='source ~/.zshrc'

echo "Done!"
clear
fastfetch
