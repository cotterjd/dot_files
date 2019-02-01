set tabstop=2
set expandtab
set path+=**
set wildmenu
syntax on
set relativenumber
set undofile                      " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000               " How many undos
set undoreload=10000              " number of lines to save for undo
set nowrap "Don't wrap lines
set cindent shiftwidth=2

autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin\ --indent-size=2 

execute pathogen#infect()
call pathogen#helptags()
