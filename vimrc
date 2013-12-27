""""""""""Vundle""""""""""
set nocompatible 
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
Bundle 'gmarik/vundle'
" Vim-Scripts repos
Bundle 'a.vim'
Bundle 'Mark'
Bundle 'Tagbar'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'Valloric/YouCompleteMe'
Bundle 'JuneWater/c.vim'
Bundle 'lua.vim'
Bundle 'Tabular'
Bundle 'vim-scripts/mru.vim'
Bundle 'UltiSnips'
" Bundle 'xml.vim'
" Bundle 'DoxygenToolkit.vim'
Bundle 'taglist.vim'
" Bundle 'scrooloose/syntastic'
Bundle 'xolox/vim-misc'
" Bundle 'xolox/vim-easytags'
" Bundle 'Raimondi/delimitMate'
Bundle 'plasticboy/vim-markdown'
Bundle 'kien/ctrlp.vim'
Bundle 'ack.vim'
filetype plugin indent on      " 安装完Vundle后打开文件类型

set backspace=indent,eol,start " indent：如果使用了set indent等自动缩进，想用退格键将缩进字段删掉，必须设置这个选项，否则vim不响应退格
                               " eol：如果在INSERT模式下，在行头想通过退格键合并两行，需要设置这个选项
                               " start：要想删除在此次插入前的输入，需要设置这个选项
syntax on                      " 打开高亮
set vb t_vb=                   " 当vim进行编辑时，如果命令错误，会发出警报，该设置去掉警报
set tabstop=4                  " 让一个tab等于4空格
set nowrap                     " 不自动换行
set hlsearch                   " 高亮显示结果
set incsearch                  " 在输入要搜索的文字时，vim会实时匹配
set so=3                       " 光标上下两侧最少保留的屏幕行数
" set encoding=utf-8             " 设置字符编码方式
set fencs=utf-8,gb18030        " 设置编码列表
set number                     " 显示行号
set history=10000              " history文件中需要记录的行数
set background=dark            " 设置背景色
colorscheme desert             " 配色方案
set cursorline                 " 开启光亮光标行
set autoread                   " 文件在Vim之外修改过，自动重新读入
set helplang=cn                " 设置中文帮助
set foldmethod=syntax          " 折叠方式
set cindent                    " 自动缩进
set showmode                   " Vim会对所处的模式提示
set showcmd                    " 在Vim窗口的右下角显示一个完整的命令已经完成的部分
set showmatch                  " 括号匹配高亮
set ruler                      " 会在状态列显示游标所在处之行列状态
set nobackup                   " 取消自动备份
set pastetoggle=<F10>           " 解决vim复制代码时代码混乱
set directory=~/.cache         " 设置Vim备份文件目录
                               " 设置C/C++和lua文件自动缩进使用4个空格
autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.lua set shiftwidth=4	

""""""""""Mark""""""""""
map mm \m 
map ma \n

""""""""""Taglist""""""""""
map tl :silent! Tlist<CR>
let Tlist_Ctags_Cmd='ctags'      " 因为我们放在环境变量里，所以可以直接执行
let Tlist_Use_Right_Window=0    " 让窗口显示在右边，0的话就是显示在左边
let Tlist_Show_One_File=0        " 让taglist可以同时展示多个文件的函数列表，如果想只有1个，设置为1
let Tlist_File_Fold_Auto_Close=1 " 非当前文件，函数列表折叠隐藏
let Tlist_Exit_OnlyWindow=1      " 当taglist是最后一个分割窗口时，自动推出vim
let Tlist_Process_File_Always=0  " 是否一直处理tags.1:处理;0:不处理。不是一直实时更新tags，因为没有必要
" let Tlist_Auto_Open=1            " 启动vim后，自动打开taglist窗口
let Tlist_Inc_Winwidth=0

""""""""""Tagbar""""""""""
nmap tg :silent! :TagbarToggle<CR>
let g:tagbar_ctags_bin = 'ctags'
let g:tagbar_right = 1             						" 让窗口显示在右侧                                              
let g:tagbar_width = 30            						" 设置宽度   
" autocmd VimEnter * nested :call tagbar#autoopen(1)    	" 打开vim时自动打开tagbar

""""""""""The-NERD-Tree"""""""""" 
map tr :silent! NERDTreeToggle<CR> 
let NERDTreeIgnore = ['.*\.o$','.*\.ko$']

""""""""""The-NERD-commenter""""""""""
map cc \c<space><CR>
let NERDShutUp=1
let NERDSpaceDelims=1     " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1 " 多行注释时样子更好看
let NERD_c_alt_style=1
let NERD_cpp_alt_style=1

""""""""""DoxygenToolkit.vim setting""""""""""
" let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
" let g:DoxygenToolkit_paramTag_pre="@Param "
" let g:DoxygenToolkit_returnTag="@Returns "
" let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
" let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
" let g:DoxygenToolkit_authorName="whz junevimer@gmail.com"
" let s:licenseTag = "Copyright(C)\<enter>"
" let s:licenseTag = s:licenseTag . "For free\<enter>"
" let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
" let g:DoxygenToolkit_licenseTag = s:licenseTag
" let g:DoxygenToolkit_briefTag_funcName="yes"
" let g:doxygen_enhanced_color=1
" DoxAuthor Dox DoxBlock三个命令的快捷操作
" map fa : DoxAuthor<CR>
" map fl : DoxLic<CR>
" map ff : Dox<CR>

""""""""""ctags""""""""""
" set tags+=$HOME/workdir/dm365/dev_app/tags

""""""""""cscope""""""""""
nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>

""""""""""cscopeverbose""""""""""
set cscopetag
set csto=0
cs add $HOME/workdir/dm365/dev_app/cscope.out $HOME/workdir/dm365/dev_app/

""""""""""Lua"""""""""""
let g:lua_compiler_name = '/usr/local/bin/luac'    " This sets the default value for all buffers.
let b:lua_compiler_name = '/usr/local/bin/lualint' " This is how you change the value for one buffer.
let g:lua_complete_omni = 1

""""""""""YouCompleteMe""""""""""
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
" let g:ycm_register_as_syntastic_checker = 0
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<Down>', '<C-N>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 1

""""""""""syntastic"""""""""
" let g:syntastic_check_on_open=1
" let g:syntastic_cpp_include_dirs = ['/usr/include/']
" let g:syntastic_cpp_no_default_include_dirs = 1
" let g:syntastic_cpp_errorformat = '%f:%l:%c: %trror: %m'
" let g:syntastic_cpp_remove_include_errors = 1
" let g:syntastic_cpp_check_header = 1
" let g:syntastic_cpp_compiler = 'clang++'
" let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

""""""""""ctrlp"""""""""""
set runtimepath^=~/.vim/bundle/ctrlp.vim

""""""""""ack""""""""""
map <F2> "zyw:exe "Ack ".@z.""<CR>

""""""""""map""""""""""
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l
map mn : noh<CR>
