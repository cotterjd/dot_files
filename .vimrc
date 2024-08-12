" To Install New Plugin
" 1. Add the plugin to the vimrc file
" 2. Reload Vim
" 3. Run :PlugInstall
" To Delete Plugin
" 1. Remove the plugin from the vimrc file
" 2. Reload Vim
" 3. Run :PlugClean
call plug#begin()
  Plug 'tpope/vim-fugitive'
  " Plug 'prettier/vim-prettier' " doesn't work in vim-plug
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf.vim'
  " Plug 'dense-analysis/ale' " doesn't work in vim-plug
  Plug 'mileszs/ack.vim'
  Plug 'github/copilot.vim'
  Plug 'vim-test/vim-test'
call plug#end()

" check for needed folders
if !isdirectory(expand("$HOME/.vim"))
   call mkdir(expand("$HOME/.vim"))
endif
if !isdirectory(expand("$HOME/.vim/swap"))
   call mkdir(expand("$HOME/.vim/swap"))
endif
if !isdirectory(expand("$HOME/.vim/undo"))
   call mkdir(expand("$HOME/.vim/undo"))
endif
if executable('fzf')
  " Use the existing fzf binary if it is installed
  let g:fzf_binary = 'fzf'
else
  " Otherwise, install the fzf binary
  call fzf#install()
endif

set rtp+=~/.fzf

" vim settings
set colorcolumn=100
set directory=~/.vim/swap " make all swap files go here 
set ignorecase
set list " see tab and space characters
set laststatus=2 " will always show current file name
set tabstop=2
set expandtab " turn tabs into spaces
set path+=**
set wildmenu
set t_Co=256 " fix colors in tmux
color darkblue " or dessert or pablo
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
set incsearch " will search as you type

" gives relative number lines on netrw (Ex, Ve, Se)
" https://vi.stackexchange.com/questions/7890/how-to-display-line-numbers-in-netrw-v125-vim7-0
set updatetime=100
autocmd CursorHold * if (&filetype == 'netrw' && &number == 0) | set relativenumber | endif


" Autoclose NERDTree if it's the last window
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"
let g:test#typescript#vite#file_pattern = 'v^spec [\\/].*\\.test\\.ts$'

" NERDTree shortcut
let NERDTreeShowBookmarks = 1

" for eslint enforcement https://github.com/dense-analysis/ale
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }

" ALE settings
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
let g:ale_set_quickfix = 1 " allows :copen when cursor is on TS error to show full error in quickfix window
let g:ale_completion_enabled = 1
let g:ale_go_to_definition = 1

" vim-prettier settings
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" buftabline settings
" show tab number in tab
" let g:buftabline_numbers = 2 " show tab #. 1 value would show buffer # 
" show buffer number in tab
let g:buftabline_numbers = 1 " show tab #. 1 value would show buffer # 

" custom commands 
let mapleader="\<SPACE>"
" map <leader>n :NERDTreeToggle<CR>:set relativenumber<CR>
map <C-n> :NERDTreeToggle<CR>:set relativenumber<CR>
map <leader>N :NERDTreeFind<CR>: set relativenumber<CR>
map <leader>g :ALEGoToDefinition<CR> " g for 'go'
map <leader>gh :ALEGoToDefinition \| Se <CR> " g for 'go'
map <leader>gv :ALEGoToDefinition \| Ve<CR> " g for 'go'
" map <leader>f :GFiles<CR>
map <leader>f :GFiles<CR>
map <leader>fh :Se \| GFiles<CR>
map <leader>fv :Ve \| GFiles<CR>
map <leader>t :b
" map <leader>bn :bn<CR> " buffer(tab) next
map <tab> :bn<CR> " buffer(tab) next
map <leader>bp :bp<CR> " buffer(tab) previous
" open buffer in vertical split
nnoremap <leader>bv :vert sb 
" open buffer in horizontal split
nnoremap <leader>bh :sb 
nnoremap <leader>dt :bd
nnoremap <leader>x :bd<CR>
nnoremap <leader>gg :!lazygit<CR> " l for 'lazy'
nnoremap <leader>c :set nolist nonumber norelativenumber<CR> " c for 'clear' or 'copy'. This command will clear numbers and special characters so you can copy just the code
nnoremap <leader>b :set list number relativenumber<CR> " b for 'back'. Goes back to original config after copying code
nnoremap <leader>- 10<C-w>< " decrease window size
nnoremap <leader>= 10<C-w>> " increase window size
nnoremap <leader>h- 10<C-w>- " increase horizontal window size
nnoremap <leader>h= 10<C-w>+ " increase horizontal window size
nnoremap <leader>r :source ~/.vimrc<CR> " r for 'reload' or 'rc'
nnoremap <leader>L :diffg LO<CR> " L for 'LOCAL'
nnoremap <leader>R :diffg RE<CR> " R for 'REMOTE'
nnoremap <leader>C :wqa <CR> " C for 'Close'
nnoremap <leader>v :e ~/.vimrc <CR> " v for 'vimrc'
nnoremap <leader>sc :source https://raw.githubusercontent.com/vim-scripts/ScrollColors/master/plugin/ScrollColor.vim \| SCROLL<CR> " 'sc' for 'scroll colors'
nnoremap <leader>sa :let g:ale_set_quickfix = 0<CR> " stops ALE from using quickfix window when trying to use it for Ack sa for 'stop ale'
nnoremap <leader>ba :let g:ale_set_quickfix = 1<CR> " resets ALE ALE settings sa for 'back ale'
nnoremap <leader>s :Ack --ignore-file=match:.js packages/rent-roll/src
nnoremap <leader>B :Git blame<CR> " B for 'blame' 
nnoremap <leader>gg :!lazygit<CR> " l for 'lazygit' 
noremap <leader>p "+p " pc for 'paste clipboard'
vnoremap <leader>pr "0p " pr for 'paste recent'
nnoremap <leader>dp :let g:prettier#autoformat = 0<CR>
nnoremap <leader>ep :let g:prettier#autoformat = 1 \| let g:prettier#autoformat_require_pragma = 1
nnoremap <leader>nc :/<<<<<<<<CR> " nc for 'next conflict'

" file shortcuts
nnoremap <leader>fdu :e server/src/dataUtils/index.ts<CR> " fdu for 'file data utils'
nnoremap <leader>frr :e packages/rent-roll/src/preprocessors/rentReady.ts<CR> " frr for 'file rent ready'
nnoremap <leader>fpp :e packages/rent-roll/src/index.ts <CR> " fpp for 'file preprocess (former name)'
nnoremap <leader>fa :e packages/rent-roll/src/preprocessors/atlas.ts <CR> " fa for 'file atlas'
nnoremap <leader>frs :e packages/rent-roll/src/rentRollService.ts <CR> " frs for 'file rentroll service'
nnoremap <leader>fb :e packages/rent-roll/src/preprocessors/buildium.ts <CR> " fa for 'file atlas'

" function shortcuts
nnoremap <leader>pt :call search("processTenancies")<cr> " pt for 'process tenancies'
nnoremap <leader>ph :call search("processHouse")<cr> " ph for 'process house'

" nops
nnoremap <C-t> <Nop> " binding for switching tabs in gnome terminal

" Go to buffer in *position* X, not go to buffer X
nnoremap <leader>1 <Plug>BufTabLine.Go(1)
nnoremap <leader>v1 :Ve<CR> <Plug>BufTabLine.Go(1)
nnoremap <leader>2 <Plug>BufTabLine.Go(2)
nnoremap <leader>v2 :Ve<CR> <Plug>BufTabLine.Go(2)
nnoremap <leader>3 <Plug>BufTabLine.Go(3)
nnoremap <leader>v3 :Ve<CR> <Plug>BufTabLine.Go(3)
nnoremap <leader>4 <Plug>BufTabLine.Go(4)
nnoremap <leader>v4 :Ve<CR> <Plug>BufTabLine.Go(4)
nnoremap <leader>5 <Plug>BufTabLine.Go(5)
nnoremap <leader>v5 :Ve<CR> <Plug>BufTabLine.Go(5)
nnoremap <leader>6 <Plug>BufTabLine.Go(6)
nnoremap <leader>v6 :Ve<CR> <Plug>BufTabLine.Go(6)
nnoremap <leader>7 <Plug>BufTabLine.Go(7)
nnoremap <leader>v7 :Ve<CR> <Plug>BufTabLine.Go(7)
nnoremap <leader>8 <Plug>BufTabLine.Go(8)
nnoremap <leader>v8 :Ve<CR> <Plug>BufTabLine.Go(8)
nnoremap <leader>9 <Plug>BufTabLine.Go(9)
nnoremap <leader>v9 :Ve<CR> <Plug>BufTabLine.Go(9)

" bookmarks
" c - dataUtils/index.ts --preprocessConserviceData
" t - dataUtils/index.ts --test

" Define a custom command to jump to the function in the specified file
command! -nargs=1 GoToFunction :execute "edit " . <args> | call search('\Vfunction processTenancies', 'w')

" Map a hotkey (e.g., F12) to use the custom command
nnoremap <F12> :GoToFunction /home/jordancotter/Development/Nutiliti/nutiliti/packages/rent-roll/src/rentRollService.ts<CR>
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Disable single uses of j, k, l, h to force use advanced navigation commands
" noremap <expr> j v:count ? 'j' : ':<CR>'
" noremap <expr> k v:count ? 'k' : ':<CR>'
" noremap <expr> h v:count ? 'h' : ':<CR>'
" noremap <expr> l v:count ? 'l' : ':<CR>'

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
" git@github.com:mileszs/ack.vim.git :Ack mySearchString (requires 'sudo apt install ack')
" git@github.com:tpope/vim-fugitive.git :Git blame
" git@github.com:github/copilot.vim.git (needs Vim 9)
" git@github.com:junegunn/fzf.vim.git :GFiles (need fzf installed as well)
" git@github.com:gcmt/taboo.vim.git TabooOpen <tabname>
" git@github.com:prettier/vim-prettier.git 
" git@github.com/ap/vim-buftabline opens buffers in tabs automatically. Can just use standard buffer commands with it. :b3 to got to buffer 3, :db3 to delete buffer 3, :bn and :bp to navigate tabs
" git@github.com:tpope/vim-commentary.git :22Commentary (comments out line 22)
