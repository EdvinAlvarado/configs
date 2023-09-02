" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'frazrepo/vim-rainbow'
Plug 'astoff/digestif'
Plug 'ap/vim-css-color'
Plug 'PyGamer0/vim-apl'
Plug 'neovimhaskell/haskell-vim' 
Plug 'nvie/vim-flake8'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Initialize plugin system
call plug#end()


" Vim with all enhancements
if has ('nvim')
	"boo
else
	source $VIMRUNTIME/vimrc_example.vim
endif
" TODO add archlinux.vim


"vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

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

" NERDTree mapping
nnoremap <c-f> :NERDTreeToggle<CR>

" Theme Settings
let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty
let g:airline_theme='monokai_tasty'


" User setting
syntax on
set autoindent noexpandtab tabstop=4 shiftwidth=4
set number " line numbering
set autochdir " vim directory same as where open from
set foldmethod=syntax " folding will be based on syntax. TODO find solution for python
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
filetype on
autocmd FileType cpp nnoremap <expr> <c-b> ":make<CR>"
autocmd FileType cpp nnoremap <expr> <c-c> "I// <ESC>"
autocmd FileType cpp nnoremap <expr> <c-x> <HOME><Del><Del><Del><ESC>
autocmd FileType cpp vnoremap <expr> <c-c>  "<c-V>" . "I// <ESC>"
autocmd FileType cpp vnoremap <expr> <c-x>  "<c-V>" . "I<Del><Del><Del><ESC>"
autocmd FileType python nnoremap <expr> <c-c> "I# <ESC>"
autocmd FileType python nnoremap <expr> <c-x> "I<Del><Del><ESC>"
autocmd FileType python vnoremap <expr> <c-c>  "<c-V>" . "<HOME>I# <ESC>"
autocmd FileType python vnoremap <expr> <c-x>  "<c-V>" . "<HOME>I<Del><Del><ESC>"
autocmd FileType python nnoremap <expr> <c-b>  ":w<CR>" . ":!python %<CR>"
autocmd FileType rust	nnoremap <expr> <c-b> ":w<CR>" .":!cargo run<ESC>"
autocmd FileType rust nnoremap <expr> <c-c> "I// <ESC>"
autocmd FileType rust nnoremap <expr> <c-x> <HOME><Del><Del><Del><ESC>
autocmd FileType rust vnoremap <expr> <c-c>  "<c-V>" . "I// <ESC>"
autocmd FileType rust vnoremap <expr> <c-x>  "<c-V>" . "I<Del><Del><Del><ESC>"
autocmd FileType nroff nnoremap <expr> <c-b> ":w<CR>" . ":make<CR><CR><CR>"
"autocmd FileType apl nnoremap <expr> <c-b> ":w<CR>" . ":!apl -q -f % --OFF<CR>"
autocmd FileType apl nnoremap <expr> <c-b> ":w<CR>" . ":!dyalog -script DYALOG_LINEEDITOR_MODE=1 %<CR>"
autocmd FileType haskell nnoremap <expr> <c-b> ":w<CR>" . "!ghc -dynamic %<CR>" 
autocmd FileType go	nnoremap <expr> <c-b> ":w<CR>" .":GoRun<CR>"
