#/bin/bash env
which nvim
if [[ $? -eq 0 ]]; then 
    git config --global core.editor "nvim"
    git config --global diff.tool nvimdiff
    git config --global difftool.nvimdiff.cmd "nvim -d \$LOCAL \$REMOTE"
fi
