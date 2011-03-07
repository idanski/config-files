setopt extended_glob
setopt correct
setopt numeric_glob_sort
setopt rc_expand_param
setopt complete_in_word

# pushd options
setopt auto_pushd
setopt pushd_silent
setopt pushd_to_home
setopt pushd_ignore_dups

# history options
HISTFILE=~/.history
SAVEHIST=10000
HISTSIZE=10000

setopt append_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_no_store
setopt extended_history
setopt hist_save_no_dups
setopt hist_expire_dups_first
setopt hist_find_no_dups

bindkey -e

autoload -Uz compinit promptinit edit-command-line zmv
zmodload zsh/deltochar
compinit
promptinit; prompt gentoo

zle -N edit-command-line
bindkey '' edit-command-line

bindkey ';3D' emacs-backward-word
bindkey ';5D' emacs-backward-word
bindkey ';3C' emacs-forward-word
bindkey ';5C' emacs-forward-word

bindkey '[5~' history-beginning-search-backward
bindkey '[6~' history-beginning-search-forward

bindkey '[H' beginning-of-line
bindkey '[F' end-of-line
bindkey '[3~' delete-char

bindkey 'z' delete-to-char

# Meta-u to chdir to the parent directory
bindkey -s '\eu' '^Ucd ..; ls^M'
# Meta-p pops the dir stack
bindkey -s '\ep' '^Upopd; dirs -v^M'
# Meta-l to pipe the current command through less
bindkey -s '\el' ' |& less^M'
# Meta-s to insert sudo in the beginning of the line
bindkey -s '\es' '^Asudo ^M'

bindkey ' ' magic-space

#zstyle :compinstall filename '/home/spatz/.zshrc'

[[ -f /etc/DIR_COLORS ]] && eval $(dircolors -b /etc/DIR_COLORS)

alias -g G='| grep'

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -Iv'
alias ls='pwd; ls --color=auto --group-directories-first -lhX'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'

alias g='git'
gg() {
	local dir="$1" ; shift
	( cd "$dir" && git "$@" )
}

overlays() {
	local o
	for o in "${OVERLAYS[@]}"; do
		$o-overlay "$@"
	done
}
