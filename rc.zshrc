echo "Loading..."

echo "Loading prompts..."
setopt PROMPT_SUBST
NEWLINE=$'\n'
PROMPT="%F{242}[%*]%f %F{39}%n%f%F{242}@%m%f %F{81}%~%f\${NEWLINE}%F{75}❯%f "

echo "Setting up history..."
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY          
setopt HIST_IGNORE_ALL_DUPS   
setopt HIST_REDUCE_BLANKS     

echo "Setting up auto-completion..."
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 
zstyle ':completion:*' menu select                      
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"       

echo "Setting up key binds..."
if [[ -n "${terminfo[kdch1]}" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char
else
  # Fallback to the standard fallback escape sequence for Delete
  bindkey "^[[3~" delete-char
fi

echo "Setting up PATH..."
export PATH="$HOME/node_modules/.bin:$PATH"

echo "Setting up folder colors..."
if [ "$(uname)" = "Darwin" ]; then
    echo "Running MacOS, using MacOS folder colors."
    alias ls='ls -G' 
else
    echo "Running other OS, likely Linux, using other folder colors."
    alias ls='ls --color=auto' 
fi

echo "Setting up aliases..."
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias grep='grep --color=auto'
alias reload='clear && source ~/.zshrc'
alias android="adb devices && adb shell"
alias barefetch="fastfetch -c none"
alias cv="clear && fastfetch"
alias charge="echo Now charging "
alias allfetch="fastfetch --config none --structure Title:Separator:OS:Host:Kernel:Uptime:Packages:Shell:Display:DE:WM:WMTheme:Theme:Icons:Font:Cursor:Terminal:TerminalFont:CPU:GPU:Memory:Swap:Disk:Battery:PowerAdapter:Locale:Vulkan:OpenGL:OpenCL:Users:Bluetooth:Sound:Camera:Gamepads:Weather:NetIO:DiskIO:PhysicalDisk:PhysicalMemory:Version:Break"
alias mpcmake="cd ~/Projects && cd win81 && ls -la && surge . mpcsim.surge.sh & surge . mpcplay.surge.sh & surge . desktopviewerprofessional26.surge.sh" 
alias mpcmergemake="cd ~/Projects && cd win81 && ls -la && ./deploy.sh"
echo "Done! Type 'cv' to clear verbose."

fastfetch
