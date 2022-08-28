" ~~~~~~~~~~~~~~~~~~vim-plug插件配置~~~~~~~~~~~~~~~~~~~~~~~

call plug#begin('~/.vim/plugged')

" 主题
Plug 'tomasr/molokai'
let g:molokai_original = 1
let g:rehash256 = 1

Plug 'morhetz/gruvbox'
let g:gruvbox_transparent_bg = 1
set bg=dark

" 补全
"Plug 'neoclide/coc.nvim', {'branch': 'release'}


" 括号补全
Plug 'jiangmiao/auto-pairs'


" 目录树
Plug 'preservim/nerdtree'


" 底部状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'


" rainbow bracket
Plug 'frazrepo/vim-rainbow'


Plug 'tpope/vim-surround'

" 光标快速跳转, ss+目标单词两个字母的前缀，
Plug 'easymotion/vim-easymotion'
nmap ss <Plug>(easymotion-s2)

" thrift插件
Plug 'solarnz/thrift.vim'

" .tmux.conf插件
Plug 'tmux-plugins/vim-tmux'

call plug#end()

" 设置vim-airline
set laststatus=2
let g:airline#extensions#tabline#left_sep = ' '
let g:ariline#extensions#tabline#left_alt_sep = '|'

" 设置目录树
map <f2> :NERDTreeToggle<CR>
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa! | endif


" let g:rainbow_active = 1



" ~~~~~~~~~~~~~coc 配置~~~~~~~~~~~~~~~~~~~

let g:coc_global_extensions = ['coc-json', 'coc-python', 'coc-highlight', 
				\ 'coc-clangd', 'coc-go']


"  回车自动选中第一个
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 跳转到报错的上个位置
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 跳转到定义
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>


" 允许未保存文件跳出文件
set hidden 

set updatetime=100

set shortmess+=c





" ~~~~~~~~~~~~~~~~~~~~~~输入/快捷键配置~~~~~~~~~~~~~~~~~~~~~~~

" jj切换正常模式 
inoremap jj <esc>

" Enter 快速插入空格
nmap <cr> o<esc>

" gh 光标移至行首，gl光标移至行尾
map gh ^
map gl $

" 窗口操作
nnoremap <space>ww <c-w>w
nnoremap <space>wc <c-w>c
nnoremap <space>wj <c-w>j
nnoremap <space>wk <c-w>k
nnoremap <space>wh <c-w>h
nnoremap <space>wl <c-w>l
nnoremap <space>ws <c-w>s
nnoremap <space>w- <c-w>-
nnoremap <space>w+ <c-w>+
nnoremap <space>w= <c-w>=
nnoremap <space>wv <c-w>vf


" ~~~~~~~~~~~~~~~~~~~~~~~~基本美化~~~~~~~~~~~~~~~~~~~~~~~~

" 设置显示行号
set nu

" 语法高亮
syntax enable

" 缩进相关
set cindent
set autoindent
set smartindent

set shiftwidth=4
set softtabstop=4
set tabstop=4

" 设置字体
set guifont=Monaco\ 15


" customization
colorscheme molokai
