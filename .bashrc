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
export PS1="$(tput setaf 39)\u@$(tput setaf 51)\h $(tput setaf 2)$(date) $(tput setaf 62)\w$(tput setaf 11)\$(parse_git_branch) $(tput sgr0)$ "
avoid_duplicates
load_alias
load_fzf_config
export PATH="~/bin/:$PATH"
export PATH="~/.local/share/apache-maven-3.9.8/bin/:$PATH"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
