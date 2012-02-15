set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

set nocompatible
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set clipboard=unnamedplus

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

"" Set region to US English
set spelllang=en_us

set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

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
 Bundle 'vim-ruby/vim-ruby'
 Bundle 'mattn/gist-vim'
 Bundle 'scrooloose/nerdtree'
 Bundle 'msanders/snipmate.vim'
 Bundle 'mileszs/ack.vim'
 Bundle 'kikijump/tslime.vim'
 Bundle 'jgdavey/vim-turbux'
 Bundle 'rson/vim-conque'
 Bundle 'altercation/vim-colors-solarized'
 " vim-scripts repos
 " non github repos
 Bundle 'git://git.wincent.com/command-t.git'

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

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
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

" command-t
nmap <unique> <silent> <Leader><Leader> :CommandT<CR>
nmap <unique> <silent> <Leader><Leader><Leader> :CommandTFlush<CR>:CommandT<CR>
let g:CommandTMatchWindowAtTop=1

" Fugitive
" ,g for Ggrep
nmap <leader>g :Ggrep
autocmd BufReadPost fugitive://* set bufhidden=delete

" ,f for global git serach for word under the cursor (with highlight)
nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
" same in visual mode
vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

" nerdtree
" Ctrl-P to Display the file browser tree
nmap <C-P> :NERDTreeToggle<CR>
" ,p to show current file in the tree
nmap <leader>p :NERDTreeFind<CR>

" Ack
" ,k for Ack
nmap <leader>k :Ack 

" ,b to switch to last buffer
nmap <Leader>b <C-^>

" ,sh shell window
nmap <Leader>sh :ConqueTermSplit zsh<cr>

