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

"-----------------------------------------------"
"               ��������                        "
"-----------------------------------------------"
set modelines=0                          " ����ģʽ�У���ȫ��ʩ��
syntax on                                " �﷨����
filetype on                              " �����ļ����ͼ��
filetype plugin indent on

"colors desert
colors ron                               " ��ɫ����

set encoding=utf-8                       " ��������
set number                               " ��ʾ�к�
"set relativenumber                       " ��ʾ����к�
set smartindent                          " ��������
set autoindent                           " �Զ�����

set smarttab
set tabstop=4                            " tab����
set shiftwidth=4                         " �趨�Զ�����Ϊ4���ַ�
set expandtab                            " ��space���tab������
"set splitright                           " �������ҷָ��ʱ���´��ڳ������Ҳ�
"set splitbelow                           " ����ˮƽ�ָ��ʱ���´��ڳ����ڵײ�

set nobackup                             " ����Ҫ����
"set noswapfile                           " ��ֹ������ʱ�ļ�
set autoread                             " �ļ��Զ�����ⲿ����
set clipboard=unnamed                    " ������а�

set nocompatible                         " ȥ��viһ����
set ambiwidth=double                     " ������ı����ʾ������
"set nowrap                               " ���Զ�����
"set mouse=a                              " ʹ�����
set mousehide                            " ����ʱ���ع��
set sidescroll=10                        " �ƶ������������ַ�ʱ���Զ����ҹ����Ǹ��ַ�

set sm!                                  " ������ʾƥ������
set hlsearch                             " ��������ƥ��
set cursorline                           " ������ʾ��ǰ��
"set termguicolors                        " �����ն���ɫ

set showmatch                            " ��ʾƥ��
set ruler                                " ��ʾ��ߣ������½���ʾ���λ��
set novisualbell                         " ��Ҫ��˸
set showcmd                              " ��ʾ���������

set laststatus=2                         " always show statusline
"set showtabline=2                        " always show tabline
set vb t_vb=

set history=1000
"set autochdir
set pastetoggle=<F9>

" ���ô����۵�---------------------------------
"  set nofoldenable             " ���� vim ʱ�ر��۵�����
"  set foldmethod=indent        " �����﷨�۵�
"  setlocal foldlevel=99        " �����۵�����
"  nnoremap <space> za          " �ÿո���������۵�

" ���ù����ʽ-------------------------------
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set completeopt=longest,menu             " �Զ���ȫ������Vim��ȫ�˵���Ϊ��IDEһ��
set backspace=indent,eol,start           " �������˸��ɾ���ַ�

"let mapleader = ','             " change map leader
"set wrapscan                    " wrap around when searching ?
"set ch=2                        " make command-line two lines high
"set scrolloff=4                 " keep the cursor four lines off the edge
"set foldmethod=marker           " use markers for folds
"set hl+=sr                      " invert status bar
"set hl+=Sr                      " invert other status bars

"set hidden                      " enable hidden buffers
"set noshowmode                  " don't show the mode in insert, visual, etc.
"set backup                      " save backup files
"set backupdir=~/.backup         " save them in the backup folder
"set incsearch                   " set incremental search

" ����״̬��-----------------------------------
" ����״̬����ʾ������Ϣ
" %F �����ļ�·����
" %m ��ǰ���屻�޸ı��
" %m ��ǰ����ֻ�����
" %h ����������
" %w Ԥ��������
" %Y �ļ�����
" %b ASCIIֵ
" %B ʮ������ֵ
" %l ����
" %v ����
" %p ��ǰ����ռ�������ĵİٷֱ�
" %L ������
" %{...} �������ʽ��ֵ������ֵ����
" %{"[fenc=".(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?"+":"")."]"} ��ʾ�ļ�����
" %{&ff} ��ʾ�ļ�����
"set statusline=%1*%F%m%r%h%w%=\
"set statusline+=%2*\ %Y\ \|\
"set statusline+=%3*%{\"\".(\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"\"}\
"set statusline+=%4*[%l:%v]\
"set statusline+=%5*%p%%\ \|\
"set statusline+=%6*%LL\
" ctags & cscope

set tags=tags;
set cscopetag                    " ʹ��cscope��Ϊtags����
"set cscopeprg=gtags-cscope       " ʹ��gtags-cscope����cscope

" gtags
"let GtagsCscope_Auto_Load=1
"let CtagsCscope_Auto_Map=1
"let GtagsCscope_Quiet=1

"nmap <silent> <Leader>cd :lcd %:h<cr>
"nmap <silent> <Leader>md :!mkdir -p %:p:h<cr>
"nmap <silent> <Leader>u yyp :s/./-/g<cr>
"nmap <silent> <Leader>t :call Tag()<cr>

"function! Tag()
"    ! ctags -R .
"endfunction

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

    au filetype dts setlocal expandtab!
    au filetype dtsi setlocal expandtab!
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
