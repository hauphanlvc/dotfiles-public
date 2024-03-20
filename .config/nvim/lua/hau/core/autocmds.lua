-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = "set nopaste",
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
-- vim.api.nvim_create_autocmd("FileType", {
-- 	pattern = { "json", "jsonc", "markdown" },
-- 	callback = function()
-- 		vim.opt.conceallevel = 0
-- 	end,
-- })
---- Fix conceallevel for json & help files
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "json", "jsonc" },
	callback = function()
		vim.wo.spell = false
		vim.wo.conceallevel = 0
	end,
})

vim.filetype.add({
	extension = {
		overlay = "dts",
		keymap = "dts",
		conf = "dosini",
	},
})

vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		local commentstrings = {
			dts = "// %s",
		}
		local ft = vim.bo.filetype
		if commentstrings[ft] then
			vim.bo.commentstring = commentstrings[ft]
		end
	end,
})
