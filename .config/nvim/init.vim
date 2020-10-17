" -----------------------------------------------------------------------------
" Name:         init.vim
" Author:       willcclark <https://github.com/willcclark>
" Website:
" https://github.com/willcclark
" Vim-Plug: {{{
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" install plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim '
"
" Colorschemes
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/edge'
Plug 'sainnhe/gruvbox-material'
Plug 'rakr/vim-one'
Plug 'sainnhe/forest-night'

" Initialize plugin system
call plug#end()
" }}}

" Colorscheme: {{{
" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set t_Co=256

" set background=light " for the light version
set background=dark " for the dark version
colorscheme gruvbox-material
"  hi! Normal ctermbg=NONE guibg=NONE 
"  hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 
"  hi! Normal ctermbg=NONE guibg=NONE 
"  hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE 

" Interface: {{{
set mouse=a
set clipboard+=unnamedplus
set hlsearch
set incsearch
set number relativenumber " turn hybrid line numbers on
set cursorline
let g:airline_powerline_fonts = 1 " Powerline symbols in AirLine
set tabstop=4
" }}}

"  __        ______ 
"  \ \      / / ___|
"   \ \ /\ / / |    
"    \ V  V /| |___ 
"     \_/\_/  \____|
" 
"  Will Clark - https://github.com/willcclark
