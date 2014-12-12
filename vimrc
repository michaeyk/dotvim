" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" highlight 81 column
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

set number
set nocompatible
set magic 

" syntax enable
syntax on
" colorsheme 
colo grb256

set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
if $TMUX == ''
  set clipboard=unnamedplus
endif

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (change this to your linking)
set expandtab                   " use spaces, not tabs (remove this if you mostly use tabs)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        
set foldlevel=1        

"" Set region to US English
set spelllang=en_us
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" Airline
let g:airline_theme             = 'powerlineish'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1


set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

" omni completion settings
set ofu=syntaxcomplete#Complete
let g:rubycomplete_buffer_loading = 0
let g:rubycomplete_classes_in_global = 1

" ctags
set tags=tags;/

if has("autocmd")
  autocmd FileType ruby set omnifunc=rubycomplete#Complete
  autocmd FileType ruby let g:rubycomplete_buffer_loading=1
  autocmd FileType ruby let g:rubycomplete_classes_in_global=1
endif

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
 Bundle 'tpope/vim-fugitive'
 Bundle 'tpope/vim-surround'
 Bundle 'tpope/vim-unimpaired'
 Bundle 'tpope/vim-commentary'
 Bundle 'tpope/vim-endwise'
 Bundle 'tpope/vim-ragtag'
 Bundle 'tpope/vim-rails'
 Bundle 'tpope/vim-dispatch'
 Bundle 'vim-ruby/vim-ruby'
 Bundle 'mattn/gist-vim'
 Bundle 'mileszs/ack.vim'
 Bundle 'jgdavey/tslime.vim'
 Bundle 'jgdavey/vim-turbux'
 Bundle 'altercation/vim-colors-solarized'
 Bundle 'tsaleh/vim-align'
 Bundle 'derekwyatt/vim-scala'
 Bundle 'christoomey/vim-tmux-navigator'
 Bundle 'jamessan/vim-gnupg'
 Bundle 'bling/vim-airline'
 Bundle 'Shougo/neocomplcache.vim'
 Bundle 'Shougo/vimproc.vim'
 Bundle 'Shougo/neomru.vim'
 Bundle 'Shougo/unite.vim'

" snipmate 
" Install dependencies:
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"

 " vim-scripts repos
 " non github repos

 filetype plugin indent on     " required! 
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

"" Keybindings 

let mapleader = ","

" Save a file 
nnoremap <Leader>w :w<CR> 
" Visual line mode 
nmap <Leader><Leader> V

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Easy buffer switching
map <S-j> :bn<CR> 
map <S-k> :bp<CR> 

" Tabs 
nnoremap t :tabnew<CR>
nnoremap <S-h> gT
nnoremap <S-l> gt


" cnext / cprev
map <f1> :cprev<CR>
map <f2> :cnext<CR>

" w!! to write as root
cmap w!! w !sudo tee % >/dev/null

" Toggle spell checking with ',s'
nmap <silent> <leader>s :set spell!<CR>

" ,cd to change working directory to current file directory
nmap <silent> <Leader>cd :cd %:p:h<CR>

" Ctrl-N to disable search match highlight
nmap <silent> <C-N> :silent noh<CR>

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za
"
" "Refocus" folds
nnoremap ,z zMzvzz

" Make zO recursively open whatever top level fold we're in, no matter where
" the cursor happens to be.
nnoremap zO zCzO

" fugitive git bindings
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <Leader>gp :Ggrep<Space>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gps :Dispatch! git push<CR>
nnoremap <Leader>gpl :Dispatch! git pull<CR>

" Ack
" ,k for Ack
nmap <leader>k :Ack 

" ,b to switch to last buffer
nmap <Leader>b <C-^>

command -nargs=1 WriteEncrypted w !gpg -c -o <q-args>

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>/ :Unite grep:.<cr>
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer buffer<cr>

map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*<CR><CR>

