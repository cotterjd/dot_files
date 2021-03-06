set tabstop=2
set expandtab
set path+=**
set wildmenu
colo desert
syntax on
set relativenumber
set number
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories (make sure directory exists)
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
set nowrap "Don't wrap lines
set cindent shiftwidth=2

" gives relative number lines on netrw (Ex, Ve, Se)
" https://vi.stackexchange.com/questions/7890/how-to-display-line-numbers-in-netrw-v125-vim7-0
set updatetime=100
autocmd CursorHold * if (&filetype == 'netrw' && &number == 0) | set relativenumber | endif

autocmd FileType javascript setlocal equalprg=js-beautify\ --stdin\ --indent-size=2 

" NERDTree shortcut
" map <C-o> :NERDTreeToggle<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
