set shell=/bin/bash
set nocompatible
filetype off

syntax on

set exrc
set secure

"let base16colorspace=256
"colorscheme base16-default
"set background=dark
hi Normal ctermbg=NONE
let g:rehash = 1
set t_Co=256

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set number
set numberwidth=4

set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'chriskempson/base16-vim'

Plugin 'Valloric/YouCompleteMe'
	let g:ycm_global_ycm_extra_conf="~/.vim/.ycm_extra_conf.py"
	set omnifunc=syntaxcomplete#Complete

	let g:ycm_key_invoke_completion = '<C-h>'
	let g:ycm_key_list_select_completion = ['<Tab>']
	let g:ycm_key_list_select_previous_completion = ['<S-Tab>']

Plugin 'SirVer/ultisnips'
	Plugin 'honza/vim-snippets'
	let g:UltiSnipsExpandTrigger="c-j"
	let g:UltiSnipsJumpForwardTrigger="c-j"
	let g:UltiSnipsJumpBackwardTrigger="c-k"

Plugin 'LaTeX-Box-Team/LaTeX-Box'
	filetype plugin on

Plugin 'scrooloose/syntastic'
	let g:syntastic_disabled_filetypes=['tex']

Plugin 'powerline/powerline'
	set laststatus=2

Plugin 'lilydjwg/colorizer'

call vundle#end()

filetype plugin indent on
