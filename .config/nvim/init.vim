set encoding=UTF-8
set expandtab
set number
set shiftwidth=2
set smarttab
set tabstop=2
call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-syntastic/syntastic'

Plug 'rust-lang/rust.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ryanoasis/vim-devicons'

Plug 'adelarsq/vim-emoji-icon-theme'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'Yggdroot/indentLine'

Plug 'puremourning/vimspector'

Plug 'mattn/emmet-vim'

Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

Plug 'airblade/vim-gitgutter'

Plug 'joshdick/onedark.vim'

Plug 'sheerun/vim-polyglot'

Plug 'neovim/nvim-lspconfig'

call plug#end()

syntax on
colorscheme onedark
let g:airline_theme='onedark'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:vimspector_enable_mappings = 'VISUAL_STUDIO'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:coc_global_extensions = ['coc-pyright', 'coc-rust-analyzer', 'coc-css', 'coc-html-css-support', 'coc-html', 'coc-htmldjango', 'coc-sh', 'coc-prettier', 'coc-eslint', 'coc-marketplace', 'coc-emmet']

set number relativenumber
set termguicolors
set list lcs=tab:\|\ 

