"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""
"=>Vundle
"""""""""""""""""""""""""""""""""""
set nocompatible              " 这是必需的 
filetype off                  " 这是必需的 
  
" 你在此设置运行时路径 
set rtp+=~/.vim/bundle/Vundle.vim    
" vundle初始化 
call vundle#begin()  
" 这应该始终是第一个 
Plugin 'gmarik/Vundle.vim' 
Plugin 'taglist.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'python.vim'
Plugin 'a.vim'
Plugin 'molokai'
Plugin 'The-NERD-Commenter'
Plugin 'vcscommand.vim'
Plugin 'kevinw/pyflakes-vim'
Plugin 'Markdown'
Plugin 'davidhalter/jedi-vim'
Bundle 'Valloric/YouCompleteMe'
call vundle#end()            " required 



""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>General
""""""""""""""""""""""""""""""""""""""""""""""""""""
"保留20条历史命令
"set history=20

"打开文件类型的插件和文件类型的缩进
filetype plugin on
filetype indent on

"如果外界文件被修改则自动读入
"set autoread

"让,作为映射前缀
let mapleader = ","
"let g:mapleader = ","

"拒绝和VI的兼容
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>Cmd
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"显示当前输入的命令
set showcmd

"""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>User interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"始终显示文本的末7行
set so=7

"显示缩进
set list
set listchars=tab:>-

"显示行号
set number

"用于激活菜单，可能用于自动补全？
set wildmenu

"用于忽略补全文件的类型
set wildignore=*.o,*~,*.pyc

"用于显示当前光标的坐标
set ruler

"命令行区域的高度
set cmdheight=2

"设置Buffer的隐藏模式？
set hid

"设置可删除行首行尾和缩进
set backspace=eol,start,indent
"设置可以在行首或行尾用方向键换行
set whichwrap+=<,>,h,l

"这个是让搜索字符串跟智能？
set smartcase

"将搜索结果高光显示
set hlsearch

"根据已输入的内容动态搜索
set incsearch

"我不知道它是干啥的？
"set lazyredraw

"处理正则式的\问题
set magic

"跳转回屏幕内可匹配到的括号
set showmatch
"不知道干啥的？
"set mat=2

"不产生报错声音
set noerrorbells
set novisualbell
set t_vb=
"set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
"=>Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
"语法高亮
syntax enable
:color desert
set background=dark

" Set extra options when running in GUI mode
"if has("gui_running")
"	set guioptions-=T
"	set guioptions+=e
"	set t_Co=256
"	set guitablabel=%M\ %t
"endif

"utf8编码格式
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>Files,backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
" Turn backup off, since most stuff is in git
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
"=>Text,tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 128 characters
set lbr
set tw=128

"使用C风格缩进
set cindent
set wrap "Wrap lines

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>Visual mode related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
"vnoremap <silent> * :call VisualSelection('f')<CR>
"vnoremap <silent> # :call VisualSelection('b')<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"处理wrapline时的j和k
map j gj
map k gk

" Map <Space> to /(search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?

" Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" Close the current buffer
"map <leader>bd :Bclose<cr>

" Close all the buffers
"map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
"map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove<cr>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
"map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
"map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
"try
	"set switchbuf=useopen,usetab,newtab
	"set stal=2
"catch
"endtry

" Return to last edit position when opening files
"autocmd BufReadPost *
"    \ if line("'\"") > 0 && line("'\"") <= line("$") |
"    \    exe "normal! g`\"" |
"   \ endif
" Remember info about open buffers on close
"set viminfo^=%

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>C
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType c,cpp :set foldmethod=syntax
autocmd FileType c,cpp :set number
autocmd FileType c,cpp :set cindent

autocmd BufNewFile *.{h,hpp} 0r ~/.vim/templates/dynamic/ext/c_style_h.h
autocmd BufNewFile *.{h,hpp} ks|call CStyleTempleteComplete()|'s

fun CStyleTempleteComplete()
    let MacroName = toupper(expand("%"))
    let MacroName = substitute(MacroName,' ','','g')
    let MacroName = "_" . substitute(MacroName,'\.','_','g') . "_"
    exe "1,$g/ifndef.*/s/ifndef.*/ifndef " .MacroName
    exe "1,$g/define.*/s/define.*/define " .MacroName
    exe "1,$g/Created Time:.*/s/Created Time:.*/Created Time: " .strftime("%Y-%m-%d %T")
endfun
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType python :set foldmethod=syntax
autocmd FileType python :set number
autocmd FileType python :set smartindent

autocmd BufNewFile *.py 0r ~/.vim/templates/dynamic/ext/python_templete.py
autocmd BufNewFile *.py ks|call FileName()|'s
autocmd BufNewFile *.py ks|call CreatedTime()|'s

fun FileName()
    if line("$") > 10
        let l = 10
    else
        let l = line("$")
    endif
    exe "1," . l . "g/File Name:.*/s/File Name:.*/File Name: " .expand("%")
endfun

fun CreatedTime()
    if line("$") > 10
        let l = 10
    else
        let l = line("$")
    endif
    exe "1," . l . "g/Created Time:.*/s/Created Time:.*/Created Time: " .strftime("%Y-%m-%d %T")
endfun

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>shell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.sh 0r ~/.vim/templates/common/ext/shell_templete.sh

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>taglist
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"只显示当前文件的Tlist,其余窗口折叠
let Tlist_File_Fold_Auto_Close = 1 

"Tlist不成为最后一个窗口
let Tlist_Exit_OnlyWindow = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NERDTree不成为最后一个窗口
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"在chrome中打开markdown
autocmd BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} map <Leader>p :!start "google-chrome" "%:p"<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_filetype_blacklist = {
    \ 'tagbar': 1,
    \ 'qf': 1,
    \ 'notes': 1,
    \ 'markdown': 1,
    \ 'unite': 1,
    \ 'text': 1,
    \ 'vimwiki': 1,
    \ 'gitcommit': 1,
    \}
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf=0
let g:ycm_complete_in_comments=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>map key
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F2> :NERDTreeToggle<CR>
map <F10> :TlistToggle<CR>

nnoremap <F3> :set invpaste paste?<CR>
imap <F3> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F3>

"设置,w为保存的快捷键
nmap <leader>w :w!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>template
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
