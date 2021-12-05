  ######################################################
  ######################################################
  ###                                                ###
  ###     ███████╗███████╗██╗  ██╗██████╗  ██████╗   ###
  ###     ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝   ###
  ###       ███╔╝ ███████╗███████║██████╔╝██║        ###
  ###      ███╔╝  ╚════██║██╔══██║██╔══██╗██║        ###
  ###  ██╗███████╗███████║██║  ██║██║  ██║╚██████╗   ###
  ###  ╚═╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝   ###
  ######################################################
  ######################################################

 ###            ###
 ##  Keep this   ##
 ##  at the top  ##
 ###            ###

source ~/.znap/zsh-snap/znap.zsh

eval "$(dircolors)"
znap prompt romkatv/powerlevel10k

# P10K Instant Prompt. Stays at the top of .zshrc, but below anything requiring i/o.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi



 ###         ###
 ##  Exports  ##
 ###         ###

export TERMINAL="kitty -1"
export EDITOR="nvim"
export MANPAGER="nvim -R -c 'set ft=man' -"
export BAT_THEME="Dracula"
export XCURSOR_SIZE=28
export GTK_THEME=Layan-dark
export GIT_ASKPASS='/usr/bin/ksshaskpass'

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

source ~/.secret/.secretsrc  # Holds API keys and other private stuff.

# TTY Color Scheme (Rose Pine)
if [ "$TERM" = "linux" ]; then
  /bin/echo -e "
  \e]P0000000
  \e]P1ea6f91
  \e]P29bced7
  \e]P3f1ca93
  \e]P434738e
  \e]P5c3a5e6
  \e]P6eabbb9
  \e]P7faebd7
  \e]P86f6e85
  \e]P9ea6f91
  \e]PA9bced7
  \e]PBf1ca93
  \e]PC34738e
  \e]PDc3a5e6
  \e]PEeabbb9
  \e]PFffffff
  "
  # get rid of artifacts
  clear
fi



 ###              ###
 ##  Zsh Settings  ##
 ###              ###
 
HISTFILE=~/.zsh_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
ZLE_RPROMPT_INDENT=0
POWERLEVEL9K_LEGACY_ICON_SPACING=true
setopt autocd
bindkey -e
zstyle :compinstall filename '~/.zshrc'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' file-list all
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format "$fg[yellow]%B--- %d%b"
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format "$fg[red]No matches for:$reset_color %d"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''
autoload -Uz compinit
autoload edit-command-line
zle -N edit-command-line



 ###          ###
 ##  Keybinds  ##
 ###          ###

my-backward-kill-word () {  # Make Ctrl-Backspace not nuke a whole line
    local WORDCHARS=${WORDCHARS/\/}
    zle backward-kill-word
}
zle -N my-backward-kill-word

bindkey '^H' my-backward-kill-word            # Ctrl-Backspace
bindkey '^[[3;5~' kill-word                   # Ctrl-Delete
bindkey '^[[3~' delete-char                   # Delete
bindkey '^[[H' beginning-of-line              # Home
bindkey '^[[F' end-of-line                    # End
bindkey '^[[1;5D' backward-word               # Ctrl-Left
bindkey '^[[1;5C' forward-word                # Ctrl-Right
bindkey '^[[A' history-substring-search-up    # Up key to search history
bindkey '^[[B' history-substring-search-down  # Down key to search history
bindkey '^X^e' edit-command-line              # Ctrl-X-E for edit



 ###         ###
 ##  Aliases  ##
 ###         ###

source ~/.aliasrc



 ###                ###
 ##  Plugin Manager  ##
 ###                ###

znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-history-substring-search
znap source lilithium-hydride/history-search-multi-word  # Must go after zsh-history-substring-search
znap source lilithium-hydride/fast-syntax-highlighting
znap source zpm-zsh/clipboard

source ~/.zsh/fzfspell/fzfspell.sh



 ###            ###
 ##  Keep this   ##
 ##  at the end  ##
 ###            ###
 
eval "$(zoxide init zsh)"
#eval "$(starship init zsh)"
xsetroot -xcf /usr/share/icons/Bibata_Ghost/cursors/left_ptr 28
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
