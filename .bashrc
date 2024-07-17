# avoid duplicates..
function avoid_duplicates() {

	export HISTCONTROL=ignoreboth:erasedups

	# append history entries..
	shopt -s histappend

	# After each command, save and reload history
	# export PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"
	export PROMPT_COMMAND="history -a; history -n;"

}

function load_alias() {
	# alias
	test -s ~/.alias && . ~/.alias || true
	alias l='ls -alFh --color=auto'
	alias la='ls -lah --color=auto'
	alias ll='ls -alFh --color=auto'
	alias ls='ls -h --color=auto'
	alias ls-l='ls -lh --color=auto'
	alias vim='nvim'
}
function load_fzf_config() {

	[ -f ~/.fzf.bash ] && source ~/.fzf.bash

	export FZF_DEFAULT_COMMAND='rg --hidden --files'
	export FZF_DEFAULT_OPTS="--layout=reverse --border --height=60%"
	# Print tree structure in the preview window
	export FZF_ALT_C_COMMAND="ls -a"
	export FZF_ALT_C_OPTS="--preview 'tree -C -a {}'"

}
parse_git_branch() {
	git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

if [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
fi
# Set neovim is default editor
EDITOR=nvim
export PS1="\[\033[39m\]\u\[\033[34m\]@\[\033[36m\]\h \[\033[33m\]\w\[\033[0m\]\$(parse_git_branch)\[\033[0m\] $ "
avoid_duplicates
load_alias
load_fzf_config
export PATH="~/bin/:$PATH"
