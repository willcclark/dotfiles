" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

" install plugins
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
" Colorschemes
Plug 'sainnhe/edge'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/forest-night'

" Initialize plugin system
call plug#end()

" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set t_Co=256

" the configuration options should be placed before `colorscheme sonokai`
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
colorscheme sonokai

" Usability
set mouse=a
set clipboard+=unnamedplus
set hlsearch
set incsearch
syntax on
set nu
set cursorline
