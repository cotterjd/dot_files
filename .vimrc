" check for needed folders
if !isdirectory(expand("$HOME/.vim/swap"))
   call mkdir(expand("$HOME/.vim/swap"), "p")
endif
if !isdirectory(expand("$HOME/.vim/undo"))
   call mkdir(expand("$HOME/.vim/undo"), "p")
endif

" Vundle (needed because YouCompleteMe doesn't seem to work with vim-plug
set nocompatible              " be iMproved, required for Vundle
filetype off                  " required for Vundl$
" set the runtime path to include Vundle and initialize$
set rtp+=~/.vim/bundle/Vundle.vim$
call vundle#begin()$
  Plugin 'VundleVim/Vundle.vim'$
  Plugin 'ycm-core/YouCompleteMe'$
call vundle#end()            " required for Vundle$
filetype plugin indent on    " required for Vundle$
 
" vim-plug$
let g:plug_timmeout = 300 " Increase vim-plug timeout for YouCompleteMe$
call plug#begin()$
  Plug 'sjl/gundo.vim' " requires vim to be compiled with Python 2.4+$
  Plug 'tpope/vim-fugitive'$
  Plug 'bananushka/taboo.vim'$
call plug#end()$

" vim settings
set directory=~/.vim/swap " make all swap files go here 
set ignorecase
set list " see tab and space characters
set laststatus=2 " will always show current file name
set tabstop=2
set expandtab " turn tabs into spaces
set path+=**
set wildmenu
color desert
syntax on " sytax highlighting
set relativenumber
set number " line numbers
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories 
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set nowrap "Don't wrap lines
set cindent shiftwidth=2
set foldmethod=indent
set hlsearch " highlights matches when using / or ?

" gives relative number lines on netrw (Ex, Ve, Se)
" https://vi.stackexchange.com/questions/7890/how-to-display-line-numbers-in-netrw-v125-vim7-0
set updatetime=100
autocmd CursorHold * if (&filetype == 'netrw' && &number == 0) | set relativenumber | endif
" Autoclose NERDTree if it's the last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin\ --indent-size=2 

" NERDTree shortcut
let NERDTreeShowBookmarks = 1

set statusline+=%#warningmsg#
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

execute pathogen#infect()

" for eslint enforcement https://github.com/dense-analysis/ale
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
let g:ale_set_quickfix = 1 " allows :copen when cursor is on TS error to show full error in quickfix window

" mapping
set mapleader "\<SPACE>"
map <C-o> :NERDTreeToggle<CR>
map <leader>g :ALEGoToDefinition<CR> " g for 'go'
map <leader>f :GFiles<CR> " f for 'files'
map <leader>t :TabooOpen " t for 'tab'
map <leader>l :!lazygit<CR> " l for 'lazy'
map <leader>c :set nolist nonumber norelativenumber<CR> " c for 'clear' or 'copy'. This command will clear numbers and special characters so you can copy just the code
map <leader>b :set list number relativenumber<CR> " b for 'back'. Goes back to original config after copying code
map <leader>- <C-w>< " decrease window size (to increase a window just switch to the other window and do same command)
