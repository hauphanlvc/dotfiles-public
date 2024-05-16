" Vim options
set clipboard=unnamedplus " allows Vim to access the system clipboard
set completeopt=menuone,noselect " mostly just for completion
set conceallevel=0 " so that `` is visible in markdown files
set fileencoding=utf-8 " the encoding written to a file
set hlsearch " highlight all matches on previous search pattern
set ignorecase " ignore case in search patterns
set mouse=a " allow the mouse to be used in Vim
set pumheight=10 " pop up menu height
set showtabline=0 " always show tabs
set smartcase " smart case
set smartindent " make indenting smarter again
set splitbelow " force all horizontal splits to go below current window
set splitright " force all vertical splits to go to the right of current window
set noswapfile " do not create a swapfile
set termguicolors " set term gui colors (most terminals support this)
set timeoutlen=1000 " time to wait for a mapped sequence to complete (in milliseconds)
set undofile " enable persistent undo
set updatetime=300 " faster completion (4000ms default)
set nowritebackup " do not write backup files
set expandtab " convert tabs to spaces
set shiftwidth=4 " the number of spaces inserted for each indentation
set tabstop=4 " insert 4 spaces for a tab
set softtabstop=4 " insert 4 spaces for a tab
set cursorline " highlight the current line
set relativenumber " show relative line numbers
set number " set numbered lines
set laststatus=3 " only the last window will always have a status line
set numberwidth=2 " minimal number of columns to use for the line number {default 4}
set signcolumn=yes " always show the sign column, otherwise it would shift the text each time
set nowrap " display lines as one long line
set scrolloff=8 " minimal number of screen lines to keep above and below the cursor
set sidescrolloff=8 " minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
set fillchars=eob:\ " show empty lines at the end of a buffer as ` ` {default `~`}
set linebreak " wrap long lines at a character in 'breakat'

" Restore cursor position
augroup restore_cursor_position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Turn off paste mode when leaving insert
augroup paste_toggle
  autocmd!
  autocmd InsertLeave * set nopaste
augroup END

" Key mappings
nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards
" nnoremap dw vb"_d

" Select all
nnoremap <C-a> gg<S-v>G

" Save with root permission (not working for now)
" command! W execute 'w !sudo tee > /dev/null %'

" Jumplist
nnoremap <C-m> <C-i>

" Navigate buffers
nnoremap <S-l> :bnext<CR>
nnoremap <S-h> :bprevious<CR>

" Clear highlights
nnoremap <leader>h :nohlsearch<CR>

" Close buffers
nnoremap <S-w> :bdelete<CR>

" Better paste
vnoremap p "_dP

" New tab
nnoremap te :tabedit<CR>

" Split window
nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize window
nnoremap <C-w><left> <C-w><
nnoremap <C-w><right> <C-w>>
nnoremap <C-w><up> <C-w>+
nnoremap <C-w><down> <C-w>-

