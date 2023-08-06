
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Fix the Java problem 
export _JAVA_AWT_WM_NONREPARENTING=1

# Code editor
export EDITOR=nvim

# Terminal default
export TERM="xterm-kitty"

# Prompt
PROMPT="%F{red}┌[%f%F{cyan}%m%f%F{red}]─[%f%F{yellow}%D{%H:%M-%d/%m}%f%F{red}]─[%f%F{magenta}%d%f%F{red}]%f"$'\n'"%F{red}└╼%f%F{green}$USER%f%F{yellow}$%f"
# Export PATH$
export PATH=~/.local/bin:/snap/bin:/usr/sandbox/:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/share/games:/usr/local/sbin:/usr/sbin:/sbin:$PATH


function hex-encode()
{
  echo "$@" | xxd -p
}

function hex-decode()
{
  echo "$@" | xxd -p -r
}

function rot13()
{
  echo "$@" | tr 'A-Za-z' 'N-ZA-Mn-za-m'
}

# alias
alias ls='ls -lh --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Custom Aliases
# -----------------------------------------------
# bat
alias cat='bat'
alias catn='bat --style=plain'
alias catnp='bat --style=plain --paging=never'

# neovim
alias vim='nvim'

# ls
alias ll='lsd -lh --group-dirs=first'
alias la='lsd -a --group-dirs=first'
alias l='lsd --group-dirs=first'
alias lla='lsd -lha --group-dirs=first'
alias ls='lsd --group-dirs=first'

# system 
alias pacman='sudo pacman'
alias update='yay -Syu --nocleanmenu --nodiffmenu --noeditmenu --removemake --noconfirm'
alias cd..='cd ..'

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


#####################################################
# Auto completion / suggestion
# Mixing zsh-autocomplete and zsh-autosuggestions
# Requires: zsh-autocomplete (custom packaging by Parrot Team)
# Jobs: suggest files / foldername / histsory bellow the prompt
# Requires: zsh-autosuggestions (packaging by Debian Team)
# Jobs: Fish-like suggestion for command history
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

##################################################
# Fish like syntax highlighting
# Requires "zsh-syntax-highlighting" from apt
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# zsh-sudo 
if [ -f /usr/share/zsh-sudo/sudo.plugin.zsh ]; then
  source /usr/share/zsh-sudo/sudo.plugin.zsh
fi

function settarget(){
  ip_address=$1
  machine_name=$2
  echo "$ip_address $machine_name" > ~/.config/bin/Polybar/target
}

function cleartarget(){
	echo '' > ~/.config/bin/Polybar/target
}

# Use modern completion system
autoload -Uz compinit
compinit

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

# Save type history for completion and easier life
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt histignorealldups sharehistory

# Useful alias for benchmarking programs
# require install package "time" sudo apt install time
# alias time="/usr/bin/time -f '\t%E real,\t%U user,\t%S sys,\t%K amem,\t%M mmem'"
# Display last command interminal
echo -en "\e]2;kitty\a"
preexec () { print -Pn "\e]0;$1 - kitty\a" }
source /home/v1ceof/.powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


export LS_COLORS="rs=0:di=34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:.tar=01;31:.tgz=31:.arc=01;31:.arj=01;31:.taz=01;31:.lha=01;31:.lz4=01;31:.lzh=01;31:.lzma=01;31:.tlz=01;31:.txz=01;31:.tzo=01;31:.t7z=01;31:.zip=01;31:.z=01;31:.dz=01;31:.gz=31:.lrz=01;31:.lz=01;31:.lzo=01;31:.xz=01;31:.zst=01;31:.tzst=01;31:.bz2=01;31:.bz=01;31:.tbz=01;31:.tbz2=01;31:.tz=01;31:.deb=31:.rpm=01;31:.jar=01;31:.war=01;31:.ear=01;31:.sar=01;31:.rar=01;31:.alz=01;31:.ace=01;31:.zoo=01;31:.cpio=01;31:.7z=01;31:.rz=01;31:.cab=01;31:.wim=01;31:.swm=01;31:.dwm=01;31:.esd=01;31:.jpg=01;35:.jpeg=01;35:.mjpg=01;35:.mjpeg=01;35:.gif=01;35:.bmp=01;35:.pbm=01;35:.pgm=01;35:.ppm=01;35:.tga=01;35:.xbm=01;35:.xpm=01;35:.tif=01;35:.tiff=01;35:.png=01;35:.svg=01;35:.svgz=01;35:.mng=01;35:.pcx=01;35:.mov=01;35:.mpg=01;35:.mpeg=01;35:.m2v=01;35:.mkv=01;35:.webm=01;35:.webp=01;35:.ogm=01;35:.mp4=01;35:.m4v=01;35:.mp4v=01;35:.vob=01;35:.qt=01;35:.nuv=01;35:.wmv=01;35:.asf=01;35:.rm=01;35:.rmvb=01;35:.flc=01;35:.avi=01;35:.fli=01;35:.flv=01;35:.gl=01;35:.dl=01;35:.xcf=01;35:.xwd=01;35:.yuv=01;35:.cgm=01;35:.emf=01;35:.ogv=01;35:.ogx=01;35:.aac=00;36:.au=00;36:.flac=00;36:.m4a=00;36:.mid=00;36:.midi=00;36:.mka=00;36:.mp3=00;36:.mpc=00;36:.ogg=00;36:.ra=00;36:.wav=00;36:.oga=00;36:.opus=00;36:.spx=00;36:.xspf=00;36:"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
