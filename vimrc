" set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" highlight 81 column
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

set number
set relativenumber
set nocompatible
set magic 
set path=.,**
set wildmenu
set wildmode=longest:list,full
set pastetoggle=<F3>

" syntax enable
syntax on
" colorsheme 
colo tango

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

" netrw settings
let g:netrw_liststyle=3
let g:netrw_banner = 0
let g:netrw_browse_split = 1
let g:netrw_winsize = 25

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
let g:airline_theme = 'luna'
let g:airline#extensions#branch#enabled = 1
set laststatus=2

set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

" ctags
set tags=tags;

" VimWiki
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

command! Diary VimwikiDiaryIndex
augroup vimwikigroup
    autocmd!
    " automatically update links on read diary
    autocmd BufRead,BufNewFile diary.md VimwikiDiaryGenerateLinks
augroup end

 " let Vundle manage Vundle
 " required! 
filetype off
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
 Bundle 'tpope/vim-obsession'
 Bundle 'vim-ruby/vim-ruby'
 Bundle 'mattn/calendar-vim'
 Bundle 'mattn/gist-vim'
 Bundle 'jgdavey/tslime.vim'
 Bundle 'jgdavey/vim-turbux'
 Bundle 'altercation/vim-colors-solarized'
 Bundle 'tsaleh/vim-align'
 Bundle 'derekwyatt/vim-scala'
 Bundle 'christoomey/vim-tmux-navigator'
 Bundle 'jamessan/vim-gnupg'
 Bundle 'bling/vim-airline'
 Bundle 'vim-airline/vim-airline-themes'
 Bundle 'moll/vim-node'
 Bundle 'pangloss/vim-javascript'
 Bundle 'walm/jshint.vim'
 Bundle 'Raimondi/delimitMate'
 Bundle 'docunext/closetag.vim'
 Bundle 'Valloric/YouCompleteMe'
 Bundle 'SirVer/ultisnips'
 Bundle 'vimwiki/vimwiki'
 Bundle 'flazz/vim-colorschemes'
 Bundle 'sirtaj/vim-openscad'
 Bundle 'dylanaraps/wal'
 Bundle 'stevearc/vim-arduino'
 Bundle 'posva/vim-vue'
 Bundle 'davidhalter/jedi-vim'
 Bundle 'junegunn/fzf.vim'

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

" fly between buffers
nnoremap <leader>l :ls<CR>:b<space>

" Easy window split
" window
nmap <leader>sh  :topleft  vnew<CR>
nmap <leader>sl :botright vnew<CR>
nmap <leader>sk    :topleft  new<CR>
nmap <leader>sj  :botright new<CR>

" Use hjkl-movement between rows when soft wrapping
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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

" fzf bindings
nnoremap <silent> <Leader>o :Files<CR>
nnoremap <silent> <Leader>. :Files <C-r>=expand("%:h")<CR>/<CR>
nnoremap <silent> <Leader>B :Buffers<CR>

let g:fzf_commits_log_options = '--graph --color=always
  \ --format="%C(yellow)%h%C(red)%d%C(reset)
  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

nnoremap <silent> <Leader>c  :Commits<CR>
nnoremap <silent> <Leader>bc :BCommits<CR>

" switch to last buffer
nmap <Leader>b <C-^>


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

command -nargs=1 WriteEncrypted w !gpg -c -o <q-args>

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger="<c-j>"
" let g:UltiSnipsJumpForwardTrigger="<c-j>"
" let g:UltiSnipsJumpBackwardTrigger="<c-k>"
" let g:UltiSnipsSnippetDirectories=["UltiSnips"]


map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*<CR><CR>

xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p
