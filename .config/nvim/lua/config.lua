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


-- Mason LSP Package Manager
require("mason").setup()

-- pest-vim
require('pest-vim').setup {}

-- Neotree default config
-- lua require("neo-tree").paste_default_config()
