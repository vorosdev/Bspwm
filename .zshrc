#+----------------------------------------------+
#|   ███████╗███████╗██╗  ██╗██████╗  ██████╗   |
#|  ╚══ ███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝   |
#|     ███╔╝ ███████╗███████║██████╔╝██║        |
#|    ███╔╝  ╚════██║██╔══██║██╔══██╗██║        |
#|   ███████╗███████║██║  ██║██║  ██║╚██████╗   |
#|   ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   |
#+----------------------------------------------+

# Fix the Java problem 
export _JAVA_AWT_WM_NONREPARENTING=1

# Code editor
export EDITOR=nvim

# Terminal default
export TERM="xterm-kitty"

# Language
export LANG=en_US.UTF-8

# Export PATH$
export PATH=$HOME/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:$HOME/.cargo/env:$HOME/.cargo/bin:$PATH

# Save type history for completion and easier life
HISTFILE=$HOME/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt histignorealldups sharehistory


# -----------------------------------------------
#                  Custom Aliases
# -----------------------------------------------

# grep
alias grep='grep --color=auto'
alias grep='grep --color=auto'
alias grep='grep --color=auto'

# cat
alias cat='bat'
alias catn='bat --style=plain'
alias catnp='bat --style=plain --paging=never'

# ls
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'

# cd 
alias cd..='cd ..'

# neovim
alias vim='nvim'

# kitty
alias icat='kitten icat'

# git
alias ga='git add'
alias gb='git branch'
alias gc='git clone'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log --oneline'
alias gm='git merge'
alias gr='git restore'
alias gs='git status'
alias gco='git checkout'
alias grb='git rebase'
alias grm='git remote'
alias grs='git reset'
alias gst='git stash'
alias gsw='git switch'
alias gcm='git commit -m'
alias gcma='git commit -a -m'
alias gpll='git pull'
alias gpsh='git push'

# System
alias shutdown='systemctl poweroff -i'
alias ch='> $HOME/.zsh_history && history -c && exit'


# -----------------------------------------------
#                     Plugins
# -----------------------------------------------

# Auto completion / suggestion
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# Syntax highlighting
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Esc-sudo 
if [ -f /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh ]; then
  source /usr/share/zsh/plugins/zsh-sudo/sudo.plugin.zsh
fi

# Powerlevel10k 
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source $HOME/.powerlevel10k/powerlevel10k.zsh-theme

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# -----------------------------------------------
#                    Functions
# -----------------------------------------------

settarget(){
  ip_address=$1
  machine_name=$2
  echo "$ip_address $machine_name" > $HOME/.config/bin/Polybar/target
}

cleartarget(){
	echo '' > $HOME/.config/bin/Polybar/target
}

rmk(){
  scrub -p dod $1
  shred -zun 10 -v $1
}

mkt(){
    mkdir {nmap,content,exploits,scripts}
}

hex-encode(){
  echo "$@" | xxd -p
}

hex-decode(){
  echo "$@" | xxd -p -r
}

rot13(){
  echo "$@" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
}

# Workspaces
wk() {
  read path
  cd /opt/workspace/$path
}

# Extract nmap information
extractPorts(){
    ports="$(cat $1 | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')"
    ip_address="$(cat $1 | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u | head -n 1)"
    echo -e "\n[*] Extracting information...\n" > extractPorts.tmp
    echo -e "\t[*] IP Address: $ip_address"  >> extractPorts.tmp
    echo -e "\t[*] Open ports: $ports\n"  >> extractPorts.tmp
    echo $ports | tr -d '\n' | xclip -sel clip
    echo -e "[*] Ports copied to clipboard\n"  >> extractPorts.tmp
    cat extractPorts.tmp; rm extractPorts.tmp
}

# -----------------------------------------------
#             completion system
# -----------------------------------------------

autoload -Uz compinit && compinit

zstyle ':completion:*:*:apt' package-names
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
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
