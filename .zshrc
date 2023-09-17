source ~/.config/shell/profile
source ~/.config/shell/aliasrc

bindkey -e

# History
HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/history"
HISTSIZE=1000
SAVEHIST=1000

# Tweaks
setopt autocd
setopt interactive_comments
stty stop undef

# Colors
autoload -U colors && colors
PS1="[%{$fg[cyan]%}%n%{$fg[white]%}@%{$fg[white]%}%M %{$fg[cyan]%}%1~%{$fg[white]%}]%{$reset_color%}$ "

# Autocomplete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Syntax Highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

# Launch Xorg
[ "$(tty)" = "/dev/tty1" ] && ! pidof -s Xorg >/dev/null 2>&1 && exec startx "$XINITRC"
