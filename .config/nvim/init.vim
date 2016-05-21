set shell=/bin/bash
set rtp+=~/.vim
syntax on

set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2

set relativenumber
set number
set numberwidth=4

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

set rtp+=~/.vim/bundle/Vundle.vim
filetype off
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'kien/ctrlp.vim'
  Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    let g:airline_theme='powerlineish'
    let g:airline_powerline_fonts=1
  Plugin 'scrooloose/syntastic'
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_always_populate_loc_list=1
    let g:syntastic_auto_loc_list=1
    let g:syntastic_check_on_open=1
    let g:syntastic_check_on_wq=0
    map <leader>s :SyntasticToggleMode<cr>
call vundle#end()
filetype plugin indent on

set rtp+=~/.vim/colors
colorscheme jellybeans
