set encoding=UTF-8
set expandtab
set number
set shiftwidth=4
set smarttab
set tabstop=4
call plug#begin(stdpath('data') . '/plugged')

Plug 'vim-syntastic/syntastic'

Plug 'davidhalter/jedi-vim'

Plug 'rust-lang/rust.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'preservim/nerdtree'

Plug 'ryanoasis/vim-devicons'

Plug 'wadackel/vim-dogrun'

Plug 'airblade/vim-gitgutter'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'Yggdroot/indentLine'

call plug#end()

colorscheme dogrun
let g:airline_theme='fairyfloss'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set list lcs=tab:\|\ 
