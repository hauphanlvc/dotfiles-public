local keymap = vim.keymap
-- set nohlsearch
vim.keymap.set('n', '<leader>k', ':nohlsearch<CR>')
keymap.set('n', 'x', '"_x')
-- Paste replace visual selection without copying it
keymap.set('v', 'p', '"_dP')
-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')
-- Easy insertion of a trailing ; or , from insert mode
vim.keymap.set('i', ';;', '<Esc>A;<Esc>')
vim.keymap.set('i', ',,', '<Esc>A,<Esc>')
-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')
-- Maintain the cursor position when yanking a visual selection
-- http://ddrscott.github.io/blog/2016/yank-without-jank/
-- vim.keymap.set('v', 'y', 'myy`y')
-- vim.keymap.set('v', 'Y', 'myY`y')
