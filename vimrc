set nocompatible
filetype off "required

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'

"Plugin for git
Plug 'tpope/vim-fugitive'

if !has('nvim')
  set pyxversion=3
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
let $NVIM_PYTHON_LOG_FILE="/tmp/nvim_log"
let $NVIM_PYTHON_LOG_LEVEL="DEBUG"

Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

Plug 'chromium/vim-codesearch'

Plug 'tikhomirov/vim-glsl'

" All of your Plugins must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

"Some basic settings"
set guifont=Monaco:h18
"Do not use tab in vim editting"
set expandtab
set tabstop=2
set shiftwidth=2
set backspace=2
set cindent
set smartindent
set number
set showmatch
set ruler
set incsearch
set autoindent
set mouse=a
set hlsearch
set nowrapscan
set hidden
set list
set listchars=tab:\|\ 
set cursorline
set background=dark
set t_Co=256
set encoding=utf-8
set fenc=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
colorscheme molokai
 
syntax enable               
syntax on                    
filetype indent on           
filetype plugin on           
filetype plugin indent on
 
"Auto match"
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
:inoremap ` ``<ESC>i
:inoremap <c-v> <shift-insert>

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : "\<TAB>"
inoremap <silent><expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<S-TAB>"

 
"find the closest pair in the same line"
function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf
 
" TxtBrowser         
au BufRead,BufNewFile *.txt setlocal ft=txt
 
"Insert author name to the source file"
let g:vimrc_author='Yuchen Wang'
let g:vimrc_email='wyc8094@gmail.com'
let g:vimrc_homepage='aaron19960821.github.io'
 
" nt                 
map <C-l> :NERDTree<CR>
 
" tl                 
map tl :Tlist<CR><c-l>

autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.swift,*.cs,*.py,*.rs exec ":call SetTitle()"

func SetTitle()
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
        call append(line("."), "")
    elseif &filetype == 'python'
        call setline(1, "\# Copyright @yucwang ".strftime("%Y"))
        call append(line("."), "")
    else
        call setline(1, "// Copyright @yucwang ".strftime("%Y"))
        call append(line("."), "")
    endif
    if &filetype == 'cpp' || &filetype == 'cc'
        call append(line(".")+1, "#include<iostream>")
        call append(line(".")+2, "using namespace std;")
        call append(line(".")+3, "")
    endif
    if &filetype == 'c'
        call append(line(".")+1, "#include<stdio.h>")
        call append(line(".")+2, "")
    endif
    autocmd BufNewFile * normal G
endfunc

autocmd FileType python set omnifunc=pythoncomplete#Complete  
autocmd FileType javascrīpt set omnifunc=javascrīptcomplete#CompleteJS  
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags  
autocmd FileType css set omnifunc=csscomplete#CompleteCSS  
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags  
autocmd FileType php set omnifunc=phpcomplete#CompletePHP  
autocmd FileType c set omnifunc=ccomplete#Complete 

autocmd BufEnter *tex set sw =2
