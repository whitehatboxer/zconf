set nocompatible              " required

" vim-plug 插件
call plug#begin()
" use PluginInstall to install
Plug 'gmarik/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'maksimr/vim-jsbeautify' " js format
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/syntastic'
Plug 'davidhalter/jedi-vim' " python 定义跳转
Plug 'vim-airline/vim-airline'
Plug 'rakr/vim-one'  " 状态栏 
Plug 'mattn/webapi-vim'  " 天气
Plug 'Wildog/airline-weather.vim' " 天气
Plug 'vim-airline/vim-airline-themes'
Plug 'fatih/vim-go' " golang
call plug#end()            " required

" vim go
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
" let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1


" 函数查找 ctrlp-funky keymap
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']


" js beautify
" 应用于所有类型
map <S-f> :call JsBeautify()<cr>
" or
autocmd FileType javascript noremap <buffer>  <S-f> :call JsBeautify()<cr>
" for json
autocmd FileType json noremap <buffer> <S-f> :call JsonBeautify()<cr>
" for jsx
autocmd FileType jsx noremap <buffer> <S-f> :call JsxBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> <S-f> :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> <S-f> :call CSSBeautify()<cr>


" nerdtree 配置
" 忽略文件显示
let NERDTreeIgnore=['\.pyc','\.swp']
" open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
" open a NERDTree automatically when vim starts up if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" map F2 to open NERDTree
 map <F2> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" weather in vim
let g:weather#area = 'hangzhou,china'
let g:weather#unit = 'metric'
let g:weather#appid = '7bae8c987d231fc078cfe7a122d4c8a8'
" let g:weather#appid = '2de143494c0b295cca9337e1e96b00e0'
let g:weather#cache_file = '~/.cache/.weather'
let g:weather#cache_ttl = '3600'
let g:weather#format = '%s %.0f'
let g:weather#status_map = {
\ "01d": "☀",
\ "02d": "☁",
\ "03d": "☁",
\ "04d": "☁",
\ "09d": "☂",
\ "10d": "☂",
\ "11d": "☈",
\ "13d": "❅",
\ "50d": "≡",
\ "01n": "☽",
\ "02n": "☁",
\ "03n": "☁",
\ "04n": "☁",
\ "09n": "☂",
\ "10n": "☂",
\ "11n": "☈",
\ "13n": "❅",
\ "50n": "≡",
\}


" vim-airline and theme
let g:airline_theme='molokai'
" let g:airline_theme='solarized'
" let g:airline_theme='one'

" colorscheme gruvbox 
" colorscheme solarized 
" colorscheme one
" set background=dark
colorscheme solarized

if &term =~ '^screen'
    sil! exe "set <xUp>=\e[1;*A"
    sil! exe "set <xDown>=\e[1;*B"
    sil! exe "set <xRight>=\e[1;*C"
    sil! exe "set <xLeft>=\e[1;*D"
endif

" ========= vim 自身配置 ==========
set nu
set colorcolumn=121


" 标签页切换
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>


" 代码折叠设置
set foldmethod=manual
" set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za

" hi String ctermfg = black
" 解决插入模式下delete/backspce键失效问题
set backspace=2

set showmatch
set autoindent

syntax enable
syntax on

set t_Co=256

"设置Tab宽度
set tabstop=4

"设置自动对齐空格数
set shiftwidth=4 " 设置自动缩进长度为4空格
set softtabstop=4
set smarttab
"将Tab键自动转换成空格 真正需要Tab键时使用[Ctrl + V + Tab]
set expandtab

" encodings
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

" 光标停留在上次退出的位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" 将ESC键映射为两次j键                                      
inoremap jj <Esc>

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set fileformat=unix

" 高亮光标所在的行列
set cursorline
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

syn match cFunt  "[a-zA-Z_][a-zA-Z_0-9]\+\s*(\{1}"ms=s,me=e-1
hi link cFunt Function
"syn match CCommentDesc "--[^-/*]\+$"    containedin=cComment contained
"syn match CCommentArg "@\w\+"    containedin=cComment contained
"hi CCommentDesc  gui=italic guifg=green
"hi CCommentArg  gui=italic guifg=grey

" 设置相对行号
" set relativenumber

set mouse=a


"" YouCompleteMe
"" Python Semantic Completion
"let g:ycm_python_binary_path = '/usr/bin/python3'
"" C family Completion Path
"let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
"" 跳转快捷键
"nnoremap <c-k> :YcmCompleter GoToDeclaration<CR>|
"nnoremap <c-h> :YcmCompleter GoToDefinition<CR>|
"nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>|
"" 停止提示是否载入本地ycm_extra_conf文件
"let g:ycm_confirm_extra_conf = 0
"" 语法关键字补全
"let g:ycm_seed_identifiers_with_syntax = 1
"" 开启 YCM 基于标签引擎
"let g:ycm_collect_identifiers_from_tags_files = 1
"" 从第2个键入字符就开始罗列匹配项
"let g:ycm_min_num_of_chars_for_completion=2
"" 在注释输入中也能补全
"let g:ycm_complete_in_comments = 1
"" 在字符串输入中也能补全
"let g:ycm_complete_in_strings = 1
"" 注释和字符串中的文字也会被收入补全
"let g:ycm_collect_identifiers_from_comments_and_strings = 1
"" 弹出列表时选择第1项的快捷键(默认为<TAB>和<Down>)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"" 弹出列表时选择前1项的快捷键(默认为<S-TAB>和<UP>)
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"" 主动补全, 默认为<C-Space>
""let g:ycm_key_invoke_completion = ['<C-Space>']
"" 停止显示补全列表(防止列表影响视野), 可以按<C-Space>重新弹出
""let g:ycm_key_list_stop_completion = ['<C-y>']

