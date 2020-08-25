" -----------------------------------------------------------------------------
" Name:         init.vim
" Author:       willcclark <https://github.com/willcclark>
" Website:
" https://github.com/willcclark/dotfiles/blob/master/.config/nvim/init.vim

" Vim-Plug: {{{
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
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/edge'
Plug 'sainnhe/sonokai'
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


"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
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


set background=dark " for the dark version
" set background=light " for the light version
let g:one_allow_italics = 1 " I love italic for comments
colorscheme one

" the configuration options should be placed before `colorscheme sonokai`
" let g:sonokai_style = 'andromeda'
" let g:sonokai_enable_italic = 1
" let g:sonokai_disable_italic_comment = 1
" colorscheme sonokai
" }}}

" Interface: {{{
set mouse=a
set clipboard+=unnamedplus
set hlsearch
set incsearch
set number relativenumber " turn hybrid line numbers on
set cursorline
" }}}
