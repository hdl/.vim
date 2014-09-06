set nocompatible
filetype off                    " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"let Vundle manage Vundle
Bundle 'gmarik/vundle'
"my Bundle here:
"
" original repos on github
Bundle 'jiangmiao/auto-pairs'
Bundle 'klen/python-mode'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdcommenter'
"..................................
" vim-scripts repos
Bundle 'taglist.vim'
Bundle 'hougo/neocomplcache.vim'
"..................................
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
"......................................
filetype plugin indent on


"-------------------------------------------------------
"general configuration
"------------------------------------------------------
set nocompatible
"set list
"set lcs=tab:\|\ ,nbsp:%,trail:-
set backspace=indent,eol,start "help bs
set ww=b,s,h,l,<,>,[,]  "help ww
set hlsearch
set showmatch       " auto match ()
filetype on "detect file type
filetype plugin on 
syntax enable
syntax on
set number "line number
set mouse=a

"taglist
nnoremap <silent> TL :TlistToggle<CR><CR>
let Tlist_Show_One_File=0
let Tlist_Exit_OnlyWindow=1                  
let Tlist_Use_Right_Window=0                 
let Tlist_File_Fold_Auto_Close=1 

"cscope
cs add cscope.out
if has("cscope")
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
       " else add database pointed to by environment
    elseif $CSCOPE_DB!=""
       cs add $CSCOPE_DB
    endif
    set csverb
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

endif
"nerd_commenter
let NERDSpaceDelims=1 " 让注释符与语句之间留一个空格
vmap <A-2> \cs  " cs block comment; cc line comment; cu uncomment

"neocomplcache
let g:neocomplcache_enable_at_startup = 1

"powerline
set laststatus=2
set encoding=utf-8 



