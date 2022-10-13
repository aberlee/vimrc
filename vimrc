"      ___  ______ ___________ _      _____ _____ 
"     / _ \ | ___ \  ___| ___ \ |    |  ___|  ___|
"    / /_\ \| |_/ / |__ | |_/ / |    | |__ | |__  
"    |  _  || ___ \  __||    /| |    |  __||  __| 
"    | | | || |_/ / |___| |\ \| |____| |___| |___ 
"    \_| |_/\____/\____/\_| \_\_____/\____/\____/
"
"  (title created with http://patorjk.com/software/taag)
"


" ------------------------------------------------------------------------------
"                                 Basic Settings                                
" ------------------------------------------------------------------------------
autocmd!

" restore history position
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

set nocompatible                " no need to remain compatible
let mapleader = ','             " change map leader
set wrapscan                    " wrap around when searching ?
set ch=2                        " make command-line two lines high
set nu                          " show line numbers
set mousehide                   " hide the mouse
set scrolloff=4                 " keep the cursor four lines off the edge
set foldmethod=marker           " use markers for folds
set hlsearch                    " highlight searches
set hl+=sr                      " invert status bar
set hl+=Sr                      " invert other status bars
set backspace=indent,eol,start  " backspace over everything in insert mode
set tabstop=4                   " tab width
set shiftwidth=4                " when shifting
set hidden                      " enable hidden buffers
set laststatus=2                " always have a status line
set showcmd                     " show current command
set noshowmode                  " don't show the mode in insert, visual, etc.
"set backup                      " save backup files
"set backupdir=~/.backup         " save them in the backup folder
"set incsearch                   " set incremental search
set tags+=./tags                " include local tags

set history=1000
"set cindent
set smarttab
"set ruler
set expandtab

set pastetoggle=<F9>
set tags=tags;
"set autochdir
set cscopetag

colors desert

" status line
" set stl=%f\ (%Y)\ Line\ %l/%L\ -\ Column\ %c\ %w%h%r

set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=gb2312
set termencoding=utf-8

filetype on                      " filetype plugin
filetype plugin indent on        " switch it on
syntax on                        " turn on syntax highlighting

nmap <silent> <Leader>cd :lcd %:h<cr>
nmap <silent> <Leader>md :!mkdir -p %:p:h<cr>
nmap <silent> <Leader>u yyp :s/./-/g<cr>
nmap <silent> <Leader>t :call Tag()<cr>

function! Tag()
    ! ctags -R .
endfunction

" ------------------------------------------------------------------------------
"                            vimdiff color
" ------------------------------------------------------------------------------

if &diff
"    colors darkblue
    colors pablo
    highlight DiffChange term=bold ctermbg=4 ctermfg=8
endif

" ------------------------------------------------------------------------------
"                             Windoze Compatability                            
" ------------------------------------------------------------------------------

if has('win32')
    let $HOME = $USERPROFILE
    let $SETTINGS = $HOME.'\vimfiles'
    nmap <silent> <C-CR> :silent !start cmd.exe<cr>
    " make sure we don't start in C:\WINDOWS\system32
    if getcwd() == $SYSTEMROOT.'\system32'
        cd $HOME
    endif
else
    " default settings path
    let $SETTINGS = $HOME.'/.vim'
    nmap <silent> <C-CR> :silent !gnome-terminal --geometry=114x32+200+200 &<cr>
endif

" ------------------------------------------------------------------------------
"                              Quick-edit Commands                              
" ------------------------------------------------------------------------------

" Edit/source vimrc's
nmap <silent> <Leader>ev :e $MYVIMRC<cr>
nmap <silent> <Leader>sv :so $MYVIMRC<cr>
nmap <silent> <Leader>eg :e $MYGVIMRC<cr>
nmap <silent> <Leader>sg :so $MYGVIMRC<cr>

" Edit filetype file (when the hell was the last time I used this?)
nmap <silent> <Leader>et :let $filetype=&filetype<cr>:e $SETTINGS/ftplugin/$filetype.vim<cr>

" Edit/source .in.vim (hidden source script)
nmap <silent> <Leader>ei :e .in.vim<cr>
nmap <silent> <Leader>si :so .in.vim<cr>

" Switching to/from header files (a.vim)
nmap <silent> <Leader>a :A<cr>

" Default build/clean shortcuts
nmap <F11> :make!<cr>
nmap <S-F11> :make! clean<cr>
if has("autocmd")
    au QuickFixCmdPost * botright 8cw
endif


" ------------------------------------------------------------------------------
"                                Window Mappings                                
" ------------------------------------------------------------------------------

" Close windows and delete/move between buffers
nmap <silent> <C-c> :close<cr>
nmap <silent> <C-PageDown> :bn<cr>
nmap <silent> <C-PageUp> :bp<cr>

" Move between windows
nmap <silent> <C-j> <C-w>j
nmap <silent> <C-k> <C-w>k
nmap <silent> <C-h> <C-w>h
nmap <silent> <C-l> <C-w>l

" List buffers
nnoremap <F5> :ls<cr>:buffer<space>

" Let semicolon be good enough to start commands
nmap <silent> ; :

" ------------------------------------------------------------------------------
"                             Environment Variables                            
" ------------------------------------------------------------------------------
"   Nothing here right now

" ------------------------------------------------------------------------------
"                                 Plugin Options                                
" ------------------------------------------------------------------------------

nmap <silent> <F7> :NERDTreeToggle<cr>
let NERDTreeIgnore = ['\.o$', '\.h$', '\.class$', '\.hi$']

nmap <silent> <F8> :TagbarToggle<cr>

" ------------------------------------------------------------------------------
"                                Filetype Options                                
" ------------------------------------------------------------------------------
if has("autocmd")
    au filetype c set tags+=~/.vim/tags/c.tags
	au filetype c setlocal cindent
	au filetype h setlocal cindent

	au filetype py setlocal autoindent
	au filetype py setlocal expandtab

	au filetype java setlocal autoindent
	au filetype java setlocal expandtab

	au filetype xml setlocal autoindent
	au filetype xml setlocal expandtab
endif

" ------------------------------------------------------------------------------
"                                 create Headers                                
" ------------------------------------------------------------------------------

function! s:GetHeaderSpaceCount(str, n)
    return (a:n - len(a:str)) / 2
endfunction

function! s:RoundSpaces(str)
    if (len(a:str) % 2) == 1
        return a:str.' '
    endif
    return a:str
endfunction

function! GetHeader(str)
    let header_width = 80
    if &filetype =~ 'vim'
        let sep = '" '.repeat('-', header_width-2)
        let blank = repeat(' ', s:GetHeaderSpaceCount(a:str, header_width-2))
        let title = '" '.blank.a:str.s:RoundSpaces(blank)
        return sep."\n".title."\n".sep
    elseif &filetype =~ 'haskell'
        let sep = '{-'.repeat('-', header_width-4).'-}'
        let blank = repeat(' ', s:GetHeaderSpaceCount(a:str, header_width-4))
        let title = '{-'.blank.a:str.s:RoundSpaces(blank).'-}'
        return sep."\n".title."\n".sep
    else
        return 'Unrecognized filetype.'
    endif
endfunction

" ------------------------------------------------------------------------------
"                                 GVim Settings                                
" ------------------------------------------------------------------------------

if has("gui_running")
    colorscheme darkblue
    set guioptions-=T
    set guioptions-=L
	set guifont=Cascadia\ Code:h10
	set lines=40 columns=120
"    if has("gui_gtk2")
"        set guifont=Droid\ Sans\ Mono\ 8
"    else
"        set guifont=ProggyCleanTT:h12
"    endif
endif

"------------------------------------------------------------------------------
"                           Multi Type
"------------------------------------------------------------------------------
if has("multi_byte")
	set fileencodings=utf-8,ucs-bom,cp936,cp1250,big5,euc-jp,euc-kr,latin1
else
	echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif

