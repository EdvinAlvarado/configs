" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'frazrepo/vim-rainbow'
Plug 'astoff/digestif'
" Initialize plugin system
call plug#end()


" Vim with all enhancements
source $VIMRUNTIME/vimrc_example.vim
" TODO add archlinux.vim


"vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

"frazrepo/vim-rainbow
let g:rainbow_active = 1

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
nnoremap <c-_> :noh<ESC> 
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
