" check for needed folders
if !isdirectory(expand("$HOME/.vim/swap"))
   call mkdir(expand("$HOME/.vim/swap"), "p")
endif
if !isdirectory(expand("$HOME/.vim/undo"))
   call mkdir(expand("$HOME/.vim/undo"), "p")
endif

set rtp+=~/.fzf " for fzf-vim
" vim settings
set directory=~/.vim/swap " make all swap files go here 
set ignorecase
set list " see tab and space characters
set laststatus=2 " will always show current file name
set tabstop=2
set expandtab " turn tabs into spaces
set path+=**
set wildmenu
color desert " or pablo
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

" for eslint enforcement https://github.com/dense-analysis/ale
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
let g:ale_set_quickfix = 1 " allows :copen when cursor is on TS error to show full error in quickfix window
let g:ale_completion_enabled = 1
let g:ale_go_to_definition = 1

" mapping
set mapleader = "\<SPACE>"
map <C-o> :NERDTreeToggle<CR>
map <leader>g :ALEGoToDefinition<CR> " g for 'go'
map <leader>f :GFiles<CR> " f for 'files'
map <leader>fs :Se \| GFiles " fs for 'files Se'
map <leader>fv: Ve \| GFiles " fv for 'files Ve'
map <leader>t :TabooOpen " t for 'tab'
map <leader>l :!lazygit<CR> " l for 'lazy'
map <leader>c :set nolist nonumber norelativenumber<CR> " c for 'clear' or 'copy'. This command will clear numbers and special characters so you can copy just the code
map <leader>b :set list number relativenumber<CR> " b for 'back'. Goes back to original config after copying code
map <leader>- <C-w>< " decrease window size
map <leader>= <C-w>> " increase window size 
map <leader>r :source ~/.vimrc<CR> " r for 'reload' or 'rcmap <leader>L :diffg L<CR> " L for 'LOCAL'
map <leader>R :diffg R<CR> " R for 'REMOTE'
map <leader>C :wqa <CR> " C for 'close'
map <leader>v :e ~/.vimrc<CR> " v for 'vimrc'

" vimdiff
" git config --global diff.tool vimdiff
" git config --global difftool.prompt false
" 'git difftool' will open diffs in vimdiff

" make vimdiff mergetool
" git config --global merge.tool vimdiff
" git config --global merge.conflictstyle diff3
" git config --global mergetool.prompt false

" PLUGINS (clone into ~/.vim/pack/plugins/start)
" git@github.com:preservim/nerdtree.git :NERDTree
" git@github.com:vim-test/vim-test.git :TestNearest
" git@github.com:dense-analysis/ale.git :ALEGoToDefinition (works out of the box for TS)
" git@github.com:mileszs/ack.vim.git :Ack mySearchString
" git@github.com:tpope/vim-fugitive.git :G blame
" git@github.com:github/copilot.vim.git (needs Vim 9)
" git@github.com:junegunn/fzf.vim.git :GFiles (need fzf installed as well)
" git@github.com:preservim/nerdcommenter.git <leader>c<SPACE>
