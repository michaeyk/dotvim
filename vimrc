set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" highlight 81 column
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

set number
set nocompatible
set magic 

" syntax enable
syntax on
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


"" statusline 
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
set statusline+=%-40f\                    " path
set statusline+=%=%1*%y%*%*\              " file type
set statusline+=%10((%l,%c)%)\            " line and column
set statusline+=%P                        " percentage of file

" colorsheme 
" colorscheme solarized
" set background=dark

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
 Bundle 'kien/ctrlp.vim'
 Bundle 'tacahiroy/ctrlp-funky' 
 Bundle 'derekwyatt/vim-scala'
 Bundle 'Shougo/neocomplcache.vim'
 Bundle 'christoomey/vim-tmux-navigator'


" snipmate 
" Install dependencies:
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"

 " vim-scripts repos
 " non github repos
 " Bundle 'git://git.wincent.com/command-t.git'

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

" Open a new file
nnoremap <Leader>o :CtrlP<CR> 
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

" ,f for global git serach for word under the cursor (with highlight)
nmap <leader>f :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ggrep -w "<C-R><C-W>"<CR>:ccl<CR>:cw<CR><CR>
" same in visual mode
vmap <leader>f y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ggrep -F "<C-R>=escape(@", '\\"#')<CR>"<CR>:ccl<CR>:cw<CR><CR>

" Ack
" ,k for Ack
nmap <leader>k :Ack 

" ,b to switch to last buffer
nmap <Leader>b <C-^>

command -nargs=1 WriteEncrypted w !gpg -c -o <q-args>


" CtrlP Settings
let g:ctrlp_switch_buffer = 'E'
let g:ctrlp_tabpage_position = 'c'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_root_markers = ['.project.root']
let g:ctrlp_custom_ignore = '\v%(/\.%(git|hg|svn)|\.%(class|o|png|jpg|jpeg|bmp|tar|jar|tgz|deb|zip)$|/target/)'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_open_multiple_files = '1ri'
let g:ctrlp_match_window = 'max:40'
let g:ctrlp_prompt_mappings = {
  \ 'PrtSelectMove("j")': ['<c-n>'],
    \ 'PrtSelectMove("k")': ['<c-p>'],
      \ 'PrtHistory(-1)': ['<c-j>', '<down>'],
        \ 'PrtHistory(1)': ['<c-i>', '<up>']
        \ }
        map <Leader>fb :CtrlPBuffer<cr>
        map <Leader>ff :CtrlP .<cr>
        map <Leader>fr :CtrlP<cr>
        map <Leader>fm :CtrlPMixed<cr>

        

map <Leader>rt :!ctags --extra=+f --exclude=.git --exclude=log -R * `rvm gemdir`/gems/*<CR><CR>

