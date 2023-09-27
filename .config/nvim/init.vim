" The default plugin directory
" - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
call plug#begin()
" Theme
Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'folke/tokyonight.nvim'
	Plug 'morhetz/gruvbox'
" folder tree
Plug 'nvim-neo-tree/neo-tree.nvim', {'on': 'Neotree'}
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-tree/nvim-web-devicons'
	Plug 'MunifTanjim/nui.nvim'
" fuzzy finder
" depends on fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'
" Add gutter with git status
Plug 'airblade/vim-gitgutter'
" git commandsm :Git
Plug 'tpope/vim-fugitive'
" Vscode like extensions
" Use CocInstall coc-<language> to isntall extensions.
" Depends on nodejs
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Colored brackets
Plug 'frazrepo/vim-rainbow'
" highlight colors in css
Plug 'ap/vim-css-color'
Plug 'neovimhaskell/haskell-vim' 
" Official configs for LSPs
" Add lua config per language
Plug 'neovim/nvim-lspconfig'
" Requires neovim-nvim-treesitter package
" TSUpdate berifies parsers are updated so it doesn't break.
" Use TSInstall <language> to install parser
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Rust Support
Plug 'simrat39/rust-tools.nvim'
" Go lang support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" pest parser LSP and syntax highlighting
" Prerequisite for LSP features
" 	cargo install pest-language-server
" 		Requires openssl
" Config - lua
" 	require('pest-vim').setup {}
Plug 'pest-parser/pest.vim'
" Package manager for LSPs, DAPs, linters, and formatters
Plug 'williamboman/mason.nvim'
" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
" - Sets runtimepath.
call plug#end()
lua require('config')


"" User settings
set mouse=a
set clipboard+=unnamedplus
"syntax on
set autoindent noexpandtab tabstop=4 shiftwidth=4
set number " line numbering
set autochdir " vim directory same as where open from
set foldmethod=syntax " folding will be based on syntax. TODO find solution for python


"" Theme Settings
let g:gruvbox_italic=1
"colorscheme gruvbox
"let g:airline_theme='gruvbox'
colorscheme tokyonight-night
let g:airline_powerline_fonts=1

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


"" Plugin Specific Settings
"neovimhaskell/haskell-vim
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" fatih/vim-go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

"frazrepo/vim-rainbow
let g:rainbow_active = 1

"rust.vim ftplugin
let g:rust_recommended_style = 0

"coc-texlab
let g:tex_flavor = "latex"

" Neotree
nnoremap <c-f> :Neotree<CR>

" fzf
nnoremap <M-f> :FZF<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>l :Lines<CR>
nnoremap <leader>w :Windows<CR>

"" Shortcuts
" eliminate current search highlight
if has('unix')
	nnoremap <c-_> :noh<ESC> 
else
	nnoremap <c-/> :noh<ESC> 
endif
" closing paranthesis
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
" Find and Replace
vnoremap <expr> <c-h> ":s/\\%V" . input("find: ") . "/" . input("replace: ") . "/g\<ESC>"
" File Type remaps
autocmd FileType cpp	nnoremap <expr> <c-b> ":make<CR>"
autocmd FileType cpp	nnoremap <expr> <c-c> "I// <ESC>"
autocmd FileType cpp	nnoremap <expr> <c-x> <HOME><Del><Del><Del><ESC>
autocmd FileType cpp	vnoremap <expr> <c-c>  "<c-V>" . "I// <ESC>"
autocmd FileType cpp	vnoremap <expr> <c-x>  "<c-V>" . "I<Del><Del><Del><ESC>"
autocmd FileType python	nnoremap <expr> <c-c> "I# <ESC>"
autocmd FileType python	nnoremap <expr> <c-x> "I<Del><Del><ESC>"
autocmd FileType python	vnoremap <expr> <c-c>  "<c-V>" . "<HOME>I# <ESC>"
autocmd FileType python	vnoremap <expr> <c-x>  "<c-V>" . "<HOME>I<Del><Del><ESC>"
autocmd FileType python	nnoremap <expr> <c-b>  ":w<CR>" . ":!python %<CR>"
autocmd FileType rust	nnoremap <expr> <c-b> ":w<CR>" .":!cargo run<ESC>"
autocmd FileType rust	nnoremap <expr> <c-c> "I// <ESC>"
autocmd FileType rust	nnoremap <expr> <c-x> <HOME><Del><Del><Del><ESC>
autocmd FileType rust 	vnoremap <expr> <c-c>  "<c-V>" . "I// <ESC>"
autocmd FileType rust 	vnoremap <expr> <c-x>  "<c-V>" . "I<Del><Del><Del><ESC>"
autocmd FileType nroff	nnoremap <expr> <c-b> ":w<CR>" . ":make<CR><CR><CR>"
"autocmd FileType apl	nnoremap <expr> <c-b> ":w<CR>" . ":!apl -q -f % --OFF<CR>"
autocmd FileType apl	nnoremap <expr> <c-b> ":w<CR>" . ":!dyalog -script DYALOG_LINEEDITOR_MODE=1 %<CR>"
autocmd FileType haskell nnoremap <expr> <c-b> ":w<CR>" . "!ghc -dynamic %<CR>" 
