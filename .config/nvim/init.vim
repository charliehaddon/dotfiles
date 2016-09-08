set shell=/bin/bash
set rtp+=~/.vim
syntax on

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set relativenumber
set number
set numberwidth=4

set textwidth=80

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

set splitbelow
set splitright

nnoremap <leader>l :noh<cr>

set rtp+=~/.vim/bundle/Vundle.vim
filetype off
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'kien/ctrlp.vim'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
        let g:airline_theme='powerlineish'
        let g:airline_powerline_fonts=1
        set laststatus=2
    Plugin 'scrooloose/syntastic'
        set statusline+=%#warningmsg#
        set statusline+=%{SyntasticStatuslineFlag()}
        set statusline+=%*
        let g:syntastic_always_populate_loc_list=1
        let g:syntastic_auto_loc_list=1
        let g:syntastic_check_on_open=1
        let g:syntastic_check_on_wq=0
        map <leader>s :SyntasticToggleMode<cr>
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-repeat'
    Plugin 'sheerun/vim-polyglot'
    Plugin 'godlygeek/tabular'
    Plugin 'plasticboy/vim-markdown'
        let g:vim_markdown_math=1
    Plugin 'SirVer/ultisnips'
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<c-b>"
        let g:UltiSnipsJumpBackwardTrigger="<c-z>"
call vundle#end()
filetype plugin indent on

colorscheme jellybeans
hi Normal ctermbg=none
hi LineNr ctermbg=none ctermfg=grey
hi NonText ctermbg=none

match ErrorMsg '\%>81v.\+'
