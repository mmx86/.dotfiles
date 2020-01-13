set nocompatible

filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
let NERDTreeQuitOnOpen=1
Plugin 'ycm-core/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
" flake8
Plugin 'nvie/vim-flake8'
Plugin 'ctrlpvim/ctrlp.vim'

"Plugin 'ctrlpvim/ctrlp.vim'  " Fuzzy file, buffer, mru, tag, ... (original kien/ctrlp.vim is no longer maintained)
"
"Plugin 'davidhalter/jedi-vim'  " Autocompletion for python. (Alternatives: rope(better for refactoring), pycharm)
""let g:jedi#popup_select_first = 0  
"let g:jedi#use_tabs_not_buffers = 1
"let g:jedi#goto_command = "<leader>g"  
"let g:jedi#goto_definition_command = "<leader>d"  
"let g:jedi#rename_command = "<leader>r"  
"let g:jedi#usages_command= "<leader>u"  
""let g:jedi#autocompletion_command = "<C-Space>"


"Plugin 'scrooloose/syntastic'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0


call vundle#end()
filetype plugin indent on

"'tednaleid/sublime-EasyMotion'


syntax on

imap jj <Esc>
let mapleader = ","
let maplocalleader = ";"
set number

set ignorecase
set smartcase
set hlsearch
set incsearch

set colorcolumn=80
set splitbelow
set splitright

set tabstop=4
"set softtabstop=4
set shiftwidth=4
set expandtab
"set smarttab  " indenting beginning of string (<TAB>, <BS>) using 'shiftwidth'

nnoremap <leader>vr :vsplit $MYVIMRC<CR>

" Tabs
"nnoremap <C-p> :tabprev<CR>
"nnoremap <C-n> :tabnext<CR>
nnoremap H gT
nnoremap L gt
nnoremap <C-H> tabm +1 
nnoremap <C-L> tabm -1
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Buffers
nnoremap <leader>d :bp\|bd #<CR>


nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright


" Netrw

" CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['manage.py']  " [todo] multiline list

set laststatus=2
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

" Save meta information in special directories.
"[TODO] DRY dir creation
"http://vim.wikia.com/wiki/Automatically_create_tmp_or_backup_directories
"http://stackoverflow.com/questions/4331776/change-vim-swap-backup-undo-file-name/4331812#4331812
set backupdir^=~/.vim/_meta-backup//
set directory^=~/.vim/_meta-swap//
"set undodir^=~/.vim/_meta-undo//
"call mkdir($HOME . '/.vim/_meta-backup', 'p')
"call mkdir($HOME . '/.vim/_meta-swap', 'p')
"call mkdir($HOME . '/.vim/_meta-undo', 'p')

" http://vim.wikia.com/wiki/Remove_unwanted_spaces
" Removes trailing spaces
set list listchars=trail:.,extends:>
"autocmd FileWritePre * :%s/\s\+$//e
autocmd FileWritePre * :%s/\s\+$
"autocmd FileAppendPre * :%s/\s\+$//e
"autocmd FilterWritePre * :%s/\s\+$//e
"autocmd BufWritePre * :%s/\s\+$//e
"map <F2> :call TrimWhiteSpace()<CR>
"map! <F2> :call TrimWhiteSpace()<CR>

"vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
"vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"https://github.com/pitchinvasion/home-files/blob/master/home/.vimrc
"https://github.com/pitchinvasion/home-files/blob/e735d3cd949de99b340ec92b7ebd5a75b6fea4d9/home/.vimrc.bundles
"https://github.com/ets-labs/python-vimrc/blob/master/vimrc
"http://blog.makersacademy.com/why-vim-is-better-than-atom/
"https://wiki.archlinux.org/index.php/vim
"https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db#.if7oh4bys
"https://www.youtube.com/watch?v=knSFZCKMy20
"https://www.youtube.com/watch?v=YD9aFIvlQYs
" Plugins to install
" syntastic


"https://stackoverflow.com/questions/18948491/running-python-code-in-vim
autocmd FileType python nnoremap <buffer> <F9> :w<cr>:exec '!echo -en "\ec"; python' shellescape(@%, 1)<cr>
autocmd FileType python nnoremap <buffer> <Leader>t :w<cr>:exec '!echo -en "\ec"; python3' shellescape(@%, 1) '; echo "============="; python2' shellescape(@%, 1)<cr>

"[todo] DRY other languages. Is there a plugin that has correspondance of
"FileType and action? needs to be wrappable with clear and save"

"let g:ycm_goto_buffer_command = 'new-or-existing-tab'
let g:ycm_goto_buffer_command = 'split'
nnoremap <leader>g :rightbelow vertical YcmCompleter GoTo<CR>
"nnoremap <C-Tab> WW

"[todo] better indication of modes. BG color, statusbar color or smth. look for plugin?

" md tmp
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'JamshedVesuna/vim-markdown-preview'
set noeol
