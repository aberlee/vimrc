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
"               基础设置                        "
"-----------------------------------------------"
set modelines=0                          " 禁用模式行（安全措施）
syntax on                                " 语法高亮
filetype on                              " 开启文件类型检测
filetype plugin indent on

"colors desert
colors ron                               " 颜色设置

set encoding=utf-8                       " 编码设置
set number                               " 显示行号
"set relativenumber                       " 显示相对行号
set smartindent                          " 智能缩进
set autoindent                           " 自动对齐

set smarttab
set tabstop=4                            " tab缩进
set shiftwidth=4                         " 设定自动缩进为4个字符
set expandtab                            " 用space替代tab的输入
"set splitright                           " 设置左右分割窗口时，新窗口出现在右侧
"set splitbelow                           " 设置水平分割窗口时，新窗口出现在底部

set nobackup                             " 不需要备份
"set noswapfile                           " 禁止生成临时文件
set autoread                             " 文件自动检测外部更改
set clipboard=unnamed                    " 共享剪切板

set nocompatible                         " 去除vi一致性
set ambiwidth=double                     " 解决中文标点显示的问题
"set nowrap                               " 不自动折行
"set mouse=a                              " 使用鼠标
set mousehide                            " 输入时隐藏光标
set sidescroll=10                        " 移动到看不见的字符时，自动向右滚动是个字符

set sm!                                  " 高亮显示匹配括号
set hlsearch                             " 高亮查找匹配
set cursorline                           " 高亮显示当前行
"set termguicolors                        " 启用终端真色

set showmatch                            " 显示匹配
set ruler                                " 显示标尺，在右下角显示光标位置
set novisualbell                         " 不要闪烁
set showcmd                              " 显示输入的命令

set laststatus=2                         " always show statusline
"set showtabline=2                        " always show tabline
set vb t_vb=

set history=1000
"set autochdir
set pastetoggle=<F9>

" 设置代码折叠---------------------------------
"  set nofoldenable             " 启动 vim 时关闭折叠代码
"  set foldmethod=indent        " 设置语法折叠
"  setlocal foldlevel=99        " 设置折叠层数
"  nnoremap <space> za          " 用空格键来开关折叠

" 设置光标样式-------------------------------
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set completeopt=longest,menu             " 自动补全配置让Vim补全菜单行为跟IDE一致
set backspace=indent,eol,start           " 允许用退格键删除字符

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

" 设置状态行-----------------------------------
" 设置状态行显示常用信息
" %F 完整文件路径名
" %m 当前缓冲被修改标记
" %m 当前缓冲只读标记
" %h 帮助缓冲标记
" %w 预览缓冲标记
" %Y 文件类型
" %b ASCII值
" %B 十六进制值
" %l 行数
" %v 列数
" %p 当前行数占总行数的的百分比
" %L 总行数
" %{...} 评估表达式的值，并用值代替
" %{"[fenc=".(&fenc==""?&enc:&fenc).((exists("+bomb") && &bomb)?"+":"")."]"} 显示文件编码
" %{&ff} 显示文件类型
"set statusline=%1*%F%m%r%h%w%=\
"set statusline+=%2*\ %Y\ \|\
"set statusline+=%3*%{\"\".(\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"\"}\
"set statusline+=%4*[%l:%v]\
"set statusline+=%5*%p%%\ \|\
"set statusline+=%6*%LL\
" ctags & cscope

set tags=tags;
set cscopetag                    " 使用cscope作为tags命令
"set cscopeprg=gtags-cscope       " 使用gtags-cscope代替cscope

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
