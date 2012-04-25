" are we on a mac?
if has("unix")
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    let isMac = 1
  else
    let isMac = 0
  endif
endif

" Pathogene
call pathogen#infect()

" Get rid of vi compat crap
set nocompatible
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

filetype plugin on

" misc
set visualbell
set ttyfast
set lazyredraw " buffer screen redraws instead of updating all the time
filetype plugin indent on " indent depends on filetype

set hidden " Allow unsafed buffers
set wildignore+=gems/gems/*,doc/*,tmp/*,vendor/gems/*,.git,*.rbc,*.class,.svn,*.o,*.obj,public/assets/*
set wildmenu
set wildmode=list:longest
set guifont=Monaco:h12
set statusline=[%02n]%y\ %f\ %(\[%M%R%H]%)\ %{fugitive#statusline()\ }[%b][0x%B]%=\ %4l,%02c%2V\ %P%*
set laststatus=2 " always display the status line
set showcmd

" Search
set ignorecase " search case insensitive unless...
set smartcase  " ...search phrase contains a capital letter
set gdefault
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

" Filetypes
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
au BufNewFile,BufRead *.json set ft=javascript

if isMac
  " copy stuff to the macs clipboard
  vmap <leader>c "+y
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
let g:CommandTMaxHeight=20
map <leader>t :CommandTFlush<cr>\|:CommandT<cr>
map <leader>f :CommandT<cr>
map <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>
" YankRing
nnoremap <silent> <leader>z :YRShow<CR>

au WinLeave * set nocursorline
au WinEnter * set cursorline

