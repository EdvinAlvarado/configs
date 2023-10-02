-- supress undefined-gloval vim while woring on init.lua
-- vim = vim

--vim.cmd('source $HOME/.config/nvim/config.vim')

-- System Settings
-- system clipboard
vim.opt.clipboard = 'unnamedplus' --vim.cmd('set clipboard+=unnamedplus')
-- mouse support
vim.opt.mouse = 'a'
-- syntax on
vim.opt.number = true -- line numbering
vim.opt.autochdir = true -- vim directory same as where open from
vim.opt.foldmethod = 'syntax' -- folding will be based on syntax. TODO find solution for python
--set autoindent noexpandtab tabstop=4 shiftwidth=4
vim.opt.autoindent = true
vim.cmd[[set noexpandtab]]
--vim.opt.noexpandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4


-- Global Variables
-- Example using a list of specs with the default options
vim.g.mapleader = "\\" -- Make sure to set `mapleader` before lazy so your mappings are correct
-- rust.vim ftplugin
vim.g.rust_recommended_style = 0
-- coc-texlab
-- vim.g.tex_flavor = "latex"


-- Mappings
-- closing paranthesis
vim.keymap.set('i', '"', '""<left>')
vim.keymap.set('i', "'", "''<left>")
vim.keymap.set('i', '(', '()<left>')
vim.keymap.set('i', '[', '[]<left>')
vim.keymap.set('i', '{', '{}<left>')
-- Find and Replace
--local find = vim.ui.input({prompt = "find: "}, function (input)
--	return input
--end)
--local replace = vim.ui.input({prompt = "replace: "}, function (input)
--	return input
--end)
--vim.keymap.set('v', '<c-h>', "<cmd>s/" .. function()return find end .. '/' .. function()return find end.. "/g<cr>", { expr = true })
vim.cmd('vnoremap <expr> <c-h> ":s/" . input("find: ") . "/" . input("replace: ") . "/g<cr>"')

-- " eliminate current search highlight
if vim.fn.has('unix') then
	vim.keymap.set('n', '<c-_>', '<cmd>noh<cr>', {silent = true})
else
	vim.keymap.set('n', '<c-/>', '<cmd>noh<cr>', {silent = true})
end


-- Autocommands
-- c
vim.api.nvim_create_autocmd("FileType", { pattern = 'c', callback = function () vim.keymap.set('n', '<c-b>', '<cmd>make<cr>') end })
vim.api.nvim_create_autocmd("FileType", { pattern = 'c', callback = function () vim.keymap.set('n', '<c-c>', 'I// <esc>') end })
vim.api.nvim_create_autocmd("FileType", { pattern = 'c', callback = function () vim.keymap.set('n', '<c-x>', '<home>xxx') end })
-- python
vim.api.nvim_create_autocmd("FileType", { pattern = 'python', callback = function () vim.keymap.set('n', '<c-c>', 'I# <esc>') end })
vim.api.nvim_create_autocmd("FileType", { pattern = 'python', callback = function () vim.keymap.set('n', '<c-x>', '<home>xx') end })
vim.api.nvim_create_autocmd("FileType", { pattern = 'python', callback = function () vim.keymap.set('v', '<c-c>', 'I# <esc>') end })
-- rust
vim.api.nvim_create_autocmd("FileType", { pattern = 'rust', callback = function () vim.keymap.set('n', '<c-b>', '<cmd>w<cr>'..'<cmd>!cargo build<cr>') end })
vim.api.nvim_create_autocmd("FileType", { pattern = 'rust', callback = function () vim.keymap.set('n', '<c-r>', '<cmd>w<cr>'..'<cmd>!cargo run<cr>') end })
vim.api.nvim_create_autocmd("FileType", { pattern = 'rust', callback = function () vim.keymap.set('n', '<c-t>', '<cmd>w<cr>'..'<cmd>!cargo test<cr>') end })
vim.api.nvim_create_autocmd("FileType", { pattern = 'rust', callback = function () vim.keymap.set('n', '<c-c>', 'I// <esc>') end })
vim.api.nvim_create_autocmd("FileType", { pattern = 'rust', callback = function () vim.keymap.set('n', '<c-x>', '<home>xxx') end })
-- apl
-- autocmd FileType apl	nnoremap <expr> <c-b> ":w<CR>" . ":!apl -q -f % --OFF<CR>"
vim.api.nvim_create_autocmd("FileType", { pattern = 'apl', callback = function () vim.keymap.set('n', '<c-r>', '<cmd>w<cr>'..'<cmd>!dyalog -script DYALOG_LINEEDITOR_MODE=1 %<cr>') end })
-- haskell
vim.api.nvim_create_autocmd("FileType", { pattern = 'haskell', callback = function () vim.keymap.set('n', '<c-r>', '<cmd>w<cr>'..'<cmd>!cghc -dynamic %<cr>') end })






-- Automatically install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- referred in nvim-lspconfig and mason.
Lsps = { "rust_analyzer", "pyright", "gopls", "lua_ls", "texlab", "taplo", "yamlls", "clangd", "jsonls", "html", "pest_ls" }

-- plugins is a table that has tables which are plugin specs
require("lazy").setup({
{
-- colorscheme
	"folke/tokyonight.nvim",
	lazy = false, -- loads at startup
	priority = 1000, -- load before all other start plugins
	config = function()
		vim.cmd.colorscheme[[tokyonight-night]]
	end,
},
{
	'nvim-lualine/lualine.nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional
	config = function()
		require('lualine').setup()
	end,
},
{
-- folder tree
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
	      "nvim-lua/plenary.nvim",
	      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
	      "MunifTanjim/nui.nvim",
	    },
	cmd = "Neotree",
	keys = {{ '<C-f>', '<cmd>Neotree toggle<cr>', desc='NeoTree'}}
},
{
-- Colored brackets
	'frazrepo/vim-rainbow',
	config = function()
		vim.g.rainbow_active = 1
	end,
},
{
-- Provides advanced highlighting
-- System Packages
		-- tree-sitter
		-- tree-sitter-cli
		-- neovim-nvim-treesitter?
-- Use TSInstall <language> to install parser
	'nvim-treesitter/nvim-treesitter',
	build = ":TSUpdate", -- verifies parsers are updated so it doesn't break.
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			-- list of parsers to ensure are installed
			ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'html', 'rust', 'go', 'python', 'toml', 'cmake', 'make', 'csv', 'json', 'latex'},
			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,
			-- Automatically install missing parsers when entering buffer
			-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
},
{
-- fuzzy finder
	'nvim-telescope/telescope.nvim',
	branch = '0.1.x',
	dependecies = {
			'nvim-lua/plenary.nvim',
			'BurntSushi/ripgrep',
			'nvim-telescope/telescope-fzf-native.nvim',
	      	'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
	},
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, {desc = 'fuzzy finder files'})
		vim.keymap.set('n', '<leader>fg', builtin.live_grep, {desc = 'fuzzy finder lines'})
		vim.keymap.set('n', '<leader>fb', builtin.buffers, {desc = 'fuzzy finder buffers'})
		vim.keymap.set('n', '<leader>fh', builtin.help_tags, {desc = 'fuzzy finder help'})
		vim.keymap.set('n', '<leader>ft', builtin.treesitter, {desc = 'fuzzy finder tresitter'})
		vim.keymap.set('n', '<leader>fc', builtin.commands, {desc = 'fuzzy finder commands'})
	end,
},
{
-- Vscode like extensions
-- Use CocInstall coc-<language> to isntall extensions.
-- Depends on nodejs
	'neoclide/coc.nvim',
	branch = 'release',
},
{
-- Mason LSP Package Manager
-- Package manager for LSPs, DAPs, linters, and formatters
-- used for 
-- 	pest-language-server
	"williamboman/mason.nvim",
	dependencies = { 'williamboman/mason-lspconfig.nvim' },
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup {
			ensure_installed = Lsps,
			automatic_installation = true,
		}
	end,
},
{
-- Official configs for LSPs
-- Add lua config per language
	'neovim/nvim-lspconfig',
	dependencies = {
			'williamboman/mason-lspconfig.nvim',
			'hrsh7th/nvim-cmp',
	},
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
	lazy = true,
	keys = {
		{'<space>e', vim.diagnostic.open_float, desc="diagnostics"},
		{'[d', vim.diagnostic.goto_prev, desc="diagnostics goto prev"},
		{']d', vim.diagnostic.goto_next, desc="diagnostics goto next"},
		{'<space>d', vim.diagnostic.setloclist, desc="diagnostics list"},
	},
	config = function()
		local lspconfig = require('lspconfig')
		-- lspconfig.rust_analyzer.setup {}
		-- lspconfig.pyright.setup {}
		-- lspconfig.gopls.setup {}
		-- lspconfig.lua_ls.setup {}
		-- lspconfig.texlab.setup {}
		-- lspconfig.taplo.setup {}
		-- lspconfig.yamlls.setup {}
		-- lspconfig.clangd.setup {}
		-- lspconfig.jsonls.setup {}
		-- lspconfig.html.setup {}
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		for _,lsp in pairs(Lsps) do
			lspconfig[lsp].setup {
				capabilities = capabilities
			}
		end
	end,
},
{
	"L3MON4D3/LuaSnip",
	dependencies = {'saadparwaiz1/cmp_luasnip'},
	-- follow latest release.
	version = "2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp"
},
{
	'hrsh7th/nvim-cmp',
	dependencies = {
		'neovim/nvim-lspconfig',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'saadparwaiz1/cmp_luasnip',
		'L3MON4D3/LuaSnip',
	},
	config = function()
		local cmp = require('cmp')
		cmp.setup {
			sources = {
					{name = 'nvim_lsp'},
					{name = 'buffer'},
					{name = 'path'},
					{name = 'luasnip'},
			},
			snippet = {
				-- REQUIRED snippet engine
				expand = function (args)
					require'luasnip'.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
		}
		cmp.setup.cmdline('/', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {{name = 'buffer'}}
		})
	end,
},
{
-- Cargo crate versions and features
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
	tag = 'v0.3.0',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('crates').setup()
    end,
},
{
-- pest parser LSP and syntax highlighting
-- Prerequisite for LSP features
-- 	cargo install pest-language-server
-- 		Requires openssl
	'pest-parser/pest.vim',
	event = {"BufRead *.pest"},
	dependencies = { 'williamboman/mason.nvim' },
	config = function()
		require('pest-vim').setup {}
		require('mason-lspconfig').setup_handlers {
		['pest_ls'] = function ()
			require('pest-vim').setup {}
		end
		}
	end,
},
{
-- Rust Support
	'simrat39/rust-tools.nvim',
	event = {"BufRead *.rs"},
	dependencies = {
		'neovim/nvim-lspconfig',
		'nvim-lua/plenary.nvim', --Debugging
		-- 'mfussenegger/nvim-dap',
	},
	config = function()
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
	end,
},
{
--{
-- Adds go language support: e.g.
		-- :GoBuild
		-- :GoTest
		-- :GoInstall
		-- :GoRun
-- Requires gopls
--	'fatih/vim-go',
--	build = ':GoUpdateBinaries',
--	event = {"BufRead *.go"},
--	config = function()
--		vim.g.go_def_mode = 'gopls'
--		vim.g.go_info_mode = 'gopls'
--		vim.g.go_gopls_enabled = 0
--	end,
--},
{
	"ray-x/go.nvim",
	dependencies = {	-- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		require("go").setup()
		require("go.format").goimport()  -- goimport + gofmt

		-- Run gofmt + goimport on save
		local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
		  pattern = "*.go",
		  callback = function()
		   require('go.format').goimport()
		  end,
		  group = format_sync_grp,
		})
	end,
	event = {"CmdlineEnter"},
	ft = {"go", 'gomod'},
	build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
},

{
	'neovimhaskell/haskell-vim',
	event = {"BufRead *.hs"},
	config = function()
		vim.g.haskell_enable_quantification = 1   -- to enable highlighting of `forall`
		vim.g.haskell_enable_recursivedo = 1      -- to enable highlighting of `mdo` and `rec`
		vim.g.haskell_enable_arrowsyntax = 1      -- to enable highlighting of `proc`
		vim.g.haskell_enable_pattern_synonyms = 1 -- to enable highlighting of `pattern`
		vim.g.haskell_enable_typeroles = 1        -- to enable highlighting of type roles
		vim.g.haskell_enable_static_pointers = 1  -- to enable highlighting of `static`
		vim.g.haskell_backpack = 1                -- to enable highlighting of backpack keywords
	end,
},
{
-- fixes global vim missing from neovim init.lua by the lua_ls
	"folke/neodev.nvim",
	event = {"BufRead *.lua"},
	dependencies = { 'hrsh7th/nvim-cmp' },
	opts = {},
	config = function ()
		require('neodev').setup()
	end
},
-- Add gutter with git status
	'airblade/vim-gitgutter',
-- git commandsm :Git
	'tpope/vim-fugitive',

})
