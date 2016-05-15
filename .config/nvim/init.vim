set shell=/bin/bash
syntax on

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4

set relativenumber
set number
set numberwidth=4

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

hi Normal ctermbg=NONE

set rtp+=~/.vim/bundle/Vundle.vim
filetype off
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'

Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    let g:airline_theme='powerlineish'
    let g:airline_powerline_fonts=1

call vundle#end()
filetype plugin indent on
