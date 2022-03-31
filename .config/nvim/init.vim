set encoding=UTF-8
set expandtab
set number
set shiftwidth=4
set smarttab
set tabstop=4
call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-syntastic/syntastic'

Plug 'rust-lang/rust.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'ryanoasis/vim-devicons'

Plug 'wadackel/vim-dogrun'

Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'Yggdroot/indentLine'

Plug 'chriskempson/base16-vim'

Plug 'puremourning/vimspector'

Plug 'mattn/emmet-vim'

Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}

Plug 'flazz/vim-colorschemes'

Plug 'ziglang/zig.vim'

call plug#end()

colorscheme dogrun
let g:airline_theme='fairyfloss'

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
set list lcs=tab:\|\ 
