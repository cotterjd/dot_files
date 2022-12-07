if !isdirectory(expand("$HOME/.vim/swap"))
   call mkdir(expand("$HOME/.vim/swap"), "p")
endif
set directory=~/.vim/swap " make all swap files go here 
set list " see tab and space characters
set tabstop=2
set expandtab " turn tabs into spaces
set path+=**
set wildmenu
color desert
syntax on " sytax highlighting
set relativenumber
set number " line numbers
if !isdirectory(expand("$HOME/.vim/undo"))
   call mkdir(expand("$HOME/.vim/undo"), "p")
endif
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
map <C-o> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
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
