" are we on a mac?
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    let isMac = 1
  else
    let isMac = 0
  endif
endif

filetype off
" Get rid of vi compat crap
set nocompatible
set rtp+=/usr/local/opt/go/misc/vim
set rtp+=~/.vim/vundle/
call vundle#rc()

Bundle "ekalinin/Dockerfile.vim"
Bundle 'wting/rust.vim'
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails.git'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'mileszs/ack.vim'
Bundle 'ddollar/nerdcommenter'
Bundle 'tsaleh/vim-align'
Bundle 'tpope/vim-repeat'
" Bundle 'ervandew/supertab'
Bundle 'oscarh/vimerl'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-scripts/Rename2'
Bundle 'tpope/vim-endwise'
Bundle 'bling/vim-airline'
Bundle 'skalnik/vim-vroom'
Bundle 'mattn/emmet-vim'
Bundle 'tpope/vim-fugitive'
Bundle 'jpalardy/vim-slime'
Bundle 'smerrill/vcl-vim-plugin'
Bundle 'slim-template/vim-slim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'airblade/vim-gitgutter'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "jnwhiteh/vim-golang.git"
Bundle "elixir-lang/vim-elixir"

" vim-slime
let g:slime_target = "tmux"

" Powerline
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1

set modelines=0

set number " line numbers
set ruler
set encoding=utf-8 " Encoding to UTF-8

" Whitespace and syntax stuff
syntax on
color hardcore
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=indent,eol,start
set autoindent
set list listchars=tab:\ \ ,trail:·

filetype plugin indent on " indent depends on filetype
filetype plugin on

" misc
set visualbell
set ttyfast
set lazyredraw " buffer screen redraws instead of updating all the time

set hidden " Allow unsafed buffers
set wildignore+=gems/gems/*,doc/*,tmp/*,vendor/gems/*,.git,*.rbc,*.class,.svn,*.o,*.obj,public/assets/*,*.png,*.log,*.jpg,.bundle
set wildmenu
set wildmode=list:longest
set guifont="Inconsolata-dz for Powerline":h22
set laststatus=2 " always display the status line
set showcmd

" Search
set ignorecase " search case insensitive unless...
set smartcase  " ...search phrase contains a capital letter
set incsearch
set showmatch
set hlsearch " highlight searches and unhighlight search results with <space>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR> 
" Have sane search regexpes
nnoremap / /\v
vnoremap / /\v

" Movement
" Have screen-line j/k instead of file-line
nnoremap j gj
nnoremap k gk
" use jj in insert mode to go back to normal mode
inoremap jj <ESC>
" Jump between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
noremap <S-J> <C-W>j<C-W>_
noremap <S-K> <C-W>k<C-W>_
noremap <S-L> <C-W>l<C-W>_
noremap <S-H> <C-W>h<C-W>_
" make backtick behave like ' for marks
nnoremap ` '

" Filetypes
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
au BufNewFile,BufRead *.json set ft=javascript

au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

if isMac
  " copy stuff to the macs clipboard
  vmap <leader>c "+y
  set mouse=a
endif

" Mappings
" Opens an edit command with the path of the currently edited file filled in
cnoremap %% <C-R>=expand("%:p:h")."/"<CR>
map <leader>e :e %%
" Switch between current and previous buffer
nnoremap <leader><leader> <c-^>

" Vim internals
" Directories for swp files
set backupdir=~/.vim/backup
set directory=~/.vim/backup
set timeoutlen=250  " Time to wait after ESC
set nobackup
set noswapfile

if has("gui_running")
  " Automatically resize splits when resizing MacVim window
  autocmd VimResized * wincmd =
endif

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

" Plugins
" Syntastic
" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1
" supertab
" let g:SuperTabDefaultCompletionType = "context"
" Command-T
map <leader>f :CtrlP<CR>
map <leader>b :CtrlPBuffer<cr>
map <leader>m :CtrlPMRU<cr>
" let g:CommandTMaxHeight=20
" map <leader>t :CommandTFlush<cr>\|:CommandT<cr>
" map <leader>f :CommandT<cr>
" map <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>
" map <leader>a :CommandT app/assets/javascripts/<cr>
" YankRing
nnoremap <silent> <leader>z :YRShow<CR>
" Youcompleteme
let g:ycm_complete_in_comments_and_strings = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1

au WinLeave * set nocursorline
au WinEnter * set cursorline

" use the silver searcher instead of ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" a little more informative version of the above
nmap <Leader>l :call <SID>SynStack()<CR>

function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
