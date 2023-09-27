-- nvim-lspconfig
local lspconfig = require('lspconfig')
lspconfig.gopls.setup {}

-- rust-tools
local rt = require("rust-tools")
rt.setup({
	server = {
	on_attach = function(_, bufnr)
		-- Hover actions
		vim.keymap.set("n", "<C-s>", rt.hover_actions.hover_actions, { buffer = bufnr })
		-- Code action groups
		vim.keymap.set("n", "<C-a>", rt.code_action_group.code_action_group, { buffer = bufnr })
	end,
	},
})

-- go
local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		require('go.format').goimport()
	end,
	group = format_sync_grp,
})

-- Mason LSP Package Manager
require("mason").setup()

-- pest-vim
require('pest-vim').setup {}

-- Neotree default config
-- lua require("neo-tree").paste_default_config()
