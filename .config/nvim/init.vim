"Vim-plug plugin loader"
call plug#begin('~/.config/nvim/plugged')
Plug 'NLKNguyen/papercolor-theme'
Plug 'morhetz/gruvbox'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'rust-lang/rust.vim' 
Plug 'vim-scripts/AutoComplPop'
call plug#end()

"Basic settings"
set guicursor=
syntax on
set noerrorbells
set noswapfile
set smartindent
set nowrap
set smartcase
set laststatus=2
set number
set backspace=indent,eol,start
set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

"Color scheme settings"
set background=dark
colorscheme PaperColor

hi Normal ctermbg=NONE guibg=NONE
hi LineNr ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
