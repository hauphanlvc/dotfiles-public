# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

if [ -f /etc/bash_completion ]; then
	source /etc/bash_completion
fi
# https://askubuntu.com/questions/339546/how-do-i-see-the-history-of-the-commands-i-have-run-in-tmux
# avoid duplicates..
export HISTCONTROL=ignoredups:erasedups

# append history entries..
shopt -s histappend

# After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export FZF_DEFAULT_COMMAND='rg --hidden --files' export FZF_DEFAULT_OPTS="--layout=reverse --border --height=60%"
# Print tree structure in the preview window
export FZF_ALT_C_COMMAND="ls -a"
export FZF_ALT_C_OPTS="--preview 'tree -C -a {}'"
# source /usr/share/fzf/completion.bash
# source /usr/share/fzf/key-bindings.bash
test -s ~/.alias && . ~/.alias || true
alias vim="nvim"
if [[ -z "$TMUX" ]]; then
	if tmux ls &>/dev/null; then
		tmux attach
		echo "There are active tmux sessions."
	else
		session_name="$(date +%s)"
		tmux new
		echo "There are no active tmux sessions. Creating a new session: $session_name"
	fi
fi
parse_git_branch() {
	git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[$(tput setaf 39)\]\u\[$(tput setaf 45)\]@\[$(tput setaf 51)\]\h \[$(tput setaf 195)\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
# https://stackoverflow.com/questions/12247777/share-history-between-panes-windows

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# check if function exists and define empty one if doesn't
if [[ $(type -t "__vte_prompt_command") != function ]]; then
	function __vte_prompt_command() {
		return 0
	}
fi
