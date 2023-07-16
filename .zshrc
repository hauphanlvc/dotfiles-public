## Config fzf 

export FZF_DEFAULT_COMMAND='rg --hidden --files' export FZF_DEFAULT_OPTS="--layout=reverse --border --height=60%" 
# Print tree structure in the preview window
export FZF_ALT_C_COMMAND="ls -a"
export FZF_ALT_C_OPTS="--preview 'tree -C -a {}'"
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# Remove duplicate zsh history
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP
ZSH_THEME="robbyrussell"
if [[ -z "$TMUX" ]]; then
  if tmux ls &> /dev/null; then
    tmux attach  
    echo "There are active tmux sessions."
  else
    session_name="mysession_$(date +%s)"
    tmux new-session -s "$session_name"
    echo "There are no active tmux sessions. Creating a new session: $session_name"
  fi
fi
alias vim='nvim'
# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

plugins=(git zsh-fzf-history-search zsh-syntax-highlighting)
# https://github.com/joshskidmore/zsh-fzf-history-search 
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source $ZSH/oh-my-zsh.sh


