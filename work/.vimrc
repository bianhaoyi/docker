set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#rc()
call vundle#begin()
" let Vundle manage Vundle
" required!
Bundle 'VundleVim/Vundle.vim'
" My Bundles here:

Bundle 'scrooloose/nerdtree'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'vim-airline/vim-airline'
Bundle 'powerline/fonts'
Bundle 'vim-scripts/TagHighlight'
"Bundle 'vim-scripts/ack.vim'
Bundle 'mileszs/ack.vim'
"Bundle 'vim-scripts/taglist.vim'
"Bundle 'vim-php/phpctags'
"Bundle 'vim-php/tagbar-phpctags.vim'
Bundle 'majutsushi/tagbar'
"Bundle 'shawncplus/phpcomplete.vim'
"Bundle 'vim-php/phpctags'
" original repos on github
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...

call vundle#end()

filetype plugin indent on     " required!
"
" Brief help  -- 此处后面都是vundle的使用命令
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


set number                  "显示行号
set smarttab      "开启时，在行首按TAB将加入sw个空格，否则加入ts个空格
set tabstop=4     "编辑时一个TAB字符占多少个空格的位置
set softtabstop=4 "方便在开启了et后使用退格（backspace）键，每次退格将删除X个空格
set shiftwidth=4  "使用每层缩进的空格数
set expandtab     "是否将输入的TAB自动展开成空格。开启后要输入TAB，需要Ctrl-V<TAB>
set updatetime=250
set mouse+=a

fun! TogglePasteMode()
    if !exists("s:old_pastemode")
        let s:old_pastemode = "1"
    endif

    if s:old_pastemode == "0"
        let s:old_pastemode = "1"
        set number
        set nopaste
        ":EnableWhitespace
        "call gitgutter#enable()

        if exists("s:old_pastemouse")
            let &mouse = s:old_pastemouse
        endif

        if exists("s:old_pastelist")
            let &list=s:old_pastelist
        endif

        echo "set edit mode"
    else
        let s:old_pastemode = "0"
        set nonumber
        set norelativenumber
        set paste
        ":DisableWhitespace
        ":IndentLinesDisable
        "call gitgutter#disable()

        let s:old_pastemouse = &mouse
        let &mouse=""

        let s:old_pastelist = &list
        let &list="0"

        echo "set copy/paste mode"
    endif
endfunction
noremap <F2> :call TogglePasteMode()<CR>


" nerdtree
map <F3> :NERDTreeToggle<CR>
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.o','\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.taghl']
let NERDTreeChDirMode=2     "setting root dir in NT also sets VIM's cd
let NERDTreeQuitOnOpen=1 "the Nerdtree window will be close after a file is opend.
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1

" nocompatible
" let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 0
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_fuzzy_completion_start_length = 1
let g:neocomplcache_auto_completion_start_length = 3
let g:neocomplcache_manual_completion_start_length = 3
let g:neocomplcache_min_keyword_length = 3
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_same_filetype_lists = {}
let g:neocomplcache_same_filetype_lists._ = '_'
fun! Compatible_Enable() 
    if !exists("s:old_com_enable")
        let s:old_com_enable = "0"
    endif
    if s:old_com_enable == "0"
        let s:old_com_enable = "1"
        exec "NeoComplCacheEnable"
        echo "set enable compatible"
    else
        let s:old_com_enable = "0"
        exec "NeoComplCacheDisable"
        echo "set disable compatible"
    endif
endfunction
noremap <F1> :call Compatible_Enable()<CR>

" airline
let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nnoremap <C-n> :bn<CR>
nnoremap <C-p> :bp<CR>

" ctags
fun! UpdateCtagsAndFileTypes()
    "    !ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .
    UpdateTypesFile
    echo "UpdateTypesFile OK!"
endfunction
noremap <F7> :call UpdateCtagsAndFileTypes()<CR>

" Ack选项
let g:ack_default_options = " -s -H --nocolor --nogroup --column --ignore-file=is:tags --ignore-file=ext:taghl"

"Tagbar配置
let g:tagbar_width=26
noremap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

let g:tagbar_phpctags_bin='/home/work/.vim/bundle/phpctags/bin'
