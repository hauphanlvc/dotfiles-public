-- Put this at the top of 'init.lua'
local path_package = vim.fn.stdpath("data") .. "/site"
local mini_path = path_package .. "/pack/deps/start/mini.nvim"
if not vim.loop.fs_stat(mini_path) then
	vim.cmd('echo "Installing `mini.nvim`" | redraw')
	local clone_cmd = {
		"git",
		"clone",
		"--filter=blob:none",
		-- Uncomment next line to use 'stable' branch
		-- '--branch', 'stable',
		"https://github.com/echasnovski/mini.nvim",
		mini_path,
	}
	vim.fn.system(clone_cmd)
	vim.cmd("packadd mini.nvim | helptags ALL")
end
-- Set up 'mini.deps' (customize to your liking)
require('mini.deps').setup({ path = { package = path_package } })

-- Use 'mini.deps'. `now()` and `later()` are helpers for a safe two-stage
-- startup and are optional.
local add, now, later = MiniDeps.add, MiniDeps.now, MiniDeps.later

-- Add nightfox theme 
later(function()
    add({
        source = 'EdenEast/nightfox.nvim',
    }
    )
    require("nightfox").setup({
        options = {
            transparent = true,
        }
    })
    vim.cmd('colorscheme nightfox')
end)

-- Add mini comment 
later(function()
    add('echasnovski/mini.comment')
    require('mini.comment').setup()
end)

-- Add mini completion
later(function()
    add('echasnovski/mini.completion')
    require('mini.completion').setup({
        lsp_completion = {
        -- `source_func` should be one of 'completefunc' or 'omnifunc'.
        source_func = 'completefunc',

        -- `auto_setup` should be boolean indicating if LSP completion is set up
        -- on every `BufEnter` event.
        auto_setup = true,

          },

    })
end)
-- Add mini fuzzy 
later(function()
    add('echasnovski/mini.fuzzy')
    require('mini.fuzzy').setup()
end)
-- Add mini pairs 
later(function()
    add('echasnovski/mini.pairs')
    require('mini.pairs').setup()
end)

-- Add mini tabline 
later(function()
    add('echasnovski/mini.tabline')
    require('mini.tabline').setup()
end)

later(function()
    add({
        source = 'ibhagwan/fzf-lua'
    })
    require('fzf-lua').setup({})

    vim.api.nvim_set_keymap("n", "<C-\\>", [[<Cmd>lua require"fzf-lua".buffers()<CR>]], {})
    vim.api.nvim_set_keymap("n", "<C-k>", [[<Cmd>lua require"fzf-lua".builtin()<CR>]], {})
    vim.api.nvim_set_keymap("n", "<C-p>", [[<Cmd>lua require"fzf-lua".files()<CR>]], {})
    vim.api.nvim_set_keymap("n", "<C-l>", [[<Cmd>lua require"fzf-lua".live_grep_glob()<CR>]], {})
    vim.api.nvim_set_keymap("n", "<C-g>", [[<Cmd>lua require"fzf-lua".grep_project()<CR>]], {})
    vim.api.nvim_set_keymap("n", "<F1>", [[<Cmd>lua require"fzf-lua".help_tags()<CR>]], {})

end)

later(function()
    add({
        source = 'neovim/nvim-lspconfig',
        depends = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim'
        }
    })
    require('mason').setup()
    require('mason-lspconfig').setup()

    require('lspconfig').ruff.setup {}
    require('lspconfig').ruff_lsp.setup {}
    require('lspconfig').cssls.setup {}
    require('lspconfig').bashls.setup {}
    require('lspconfig').lua_ls.setup {
        settings = {
            Lua = {
                diagnostics = {
                    disable = { "lowercase-global", "undefined-global" }
                },
            }
        }
    }
    require('lspconfig').yamlls.setup {}
end)

later(function()
    add({
        source = 'nvim-treesitter/nvim-treesitter'
    })
    require('nvim-treesitter.configs').setup({
        ensure_installed = { 'lua', 'yaml' },
        auto_install = true,
        highlight = { enable = true, disable = { 'ini' } },
        indent = { enable = true }
    })
end)

