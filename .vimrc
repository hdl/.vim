set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" Plugin 'jiangmiao/auto-pairs'
" Plugin 'klen/python-mode'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdcommenter'
Plugin 'taglist.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'tpope/vim-fugitive'
" Plugin 'Mark'
" Plugin 'terryma/vim-multiple-cursors'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"-------------------------------------------------------
"general configuration
"------------------------------------------------------
set nocompatible
" set ts=4
" set sw=4
"set list
"set lcs=tab:\|\ ,nbsp:%,trail:-
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

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
set guifont=Monaco:h14

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
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

"minbuf
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1


" Override go-to.definition key shortcut to Ctrl-]
" let g:pymode_rope_goto_definition_bind = "<C-]>"
"
" " Override run current python file key shortcut to Ctrl-Shift-e
" let g:pymode_run_bind = "<C-S-e>"
"
" " Override view python doc key shortcut to Ctrl-Shift-d
" let g:pymode_doc_bind = "<C-S-d>"
