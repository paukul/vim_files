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
if &compatible
  set nocompatible
endif

if exists('$TMUX')
  " Colors in tmux
  let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
endif
" use the terminal bg for ALL colorschemes
autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE

set background=dark
set t_ut=
set termguicolors

" set rtp+=/usr/local/opt/go/misc/vim
call plug#begin('~/.vim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

let g:deoplete#enable_at_startup = 1
Plug 'vim-syntastic/syntastic'
Plug 'cespare/vim-toml'
Plug 'StanAngeloff/php.vim'
Plug 'mxw/vim-jsx'
Plug 'isRuslan/vim-es6'
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_start_key='<C-m>'

Plug 'dracula/vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
set clipboard=unnamed
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'fxn/vim-monochrome'
Plug 'ekalinin/Dockerfile.vim'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-haml'
Plug 'vim-scripts/YankRing.vim'
Plug 'mileszs/ack.vim'
let g:ackprg = 'ag --vimgrep --smart-case'

Plug 'ddollar/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/Rename2'
Plug 'tpope/vim-endwise'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'smerrill/vcl-vim-plugin'
Plug 'slim-template/vim-slim'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'fatih/vim-go'
Plug 'elixir-lang/vim-elixir'
Plug 'whatyouhide/vim-gotham'
Plug 'rizzatti/dash.vim'
Plug 'scrooloose/nerdtree'
Plug 'joshdick/onedark.vim'

call plug#end()

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:UltiSnipsUsePythonVersion = 3
"let g:UltiSnipsExpandTrigger="<NUL>" " ctrl + space
let g:UltiSnipsExpandTrigger="<c-l>"
let g:UltiSnipsJumpForwardTrigger="<c-k>"
let g:UltiSnipsJumpBackwardTrigger="<c-j>"
let g:ctrlp_max_files = 25000

" vim-slime
let g:slime_target = "tmux"

" Powerline
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline_theme='onedark'

set modelines=0

set number " line numbers
set ruler
set encoding=utf-8 " Encoding to UTF-8

" Whitespace and syntax stuff
syntax on
" set background=light
" color solarized
" color hardcore
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" let g:seoul256_background = 233
" color seoul256
" color gotham256
" color onedark
color dracula
" overwrite the standard bg color of onedark
" let bgcol="#333333"
" hi Normal guibg=bgcol

" Allow jsx in .js files
let g:jsx_ext_required = 0

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
set wildignore+=*/gems/gems/*,*/doc/*,*/tmp/*,*/vendor/gems/*,.git,*.rbc,*.class,.svn,*.o,*.obj,public/assets/*,*.png,*.log,*.jpg,.bundle,*/public/system/*
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
" nnoremap / /\v
" vnoremap / /\v

" Movement
" Have screen-line j/k instead of file-line
nnoremap j gj
nnoremap k gk
" use jj in insert mode to go back to normal mode
inoremap jj <ESC>
" Jump between windows
" nnoremap <C-h> <C-w>h
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-l> <C-w>l
" noremap <S-J> <C-W>j<C-W>_
" noremap <S-K> <C-W>k<C-W>_
" noremap <S-L> <C-W>l<C-W>_
" noremap <S-H> <C-W>h<C-W>_
" make backtick behave like ' for marks
nnoremap ` '

" Filetypes
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
au BufNewFile,BufRead *.json set ft=javascript

" au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4

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
set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/backup
set timeoutlen=250  " Time to wait after ESC
set nobackup
set noswapfile

if has("gui_running")
  " Automatically resize splits when resizing MacVim window
  autocmd VimResized * wincmd =
endif

" MacVIM shift+arrow-keys behavior (required in .vimrc)
let macvim_hig_shift_movement = 1

let g:fzf_command_prefix = 'Fzf'
map <leader>b :FzfBuffers<cr>
map <leader>f :FzfFiles<cr>

nnoremap <silent> <leader>z :YRShow<CR>

au WinLeave * set nocursorline
au WinEnter * set cursorline

" Ag grep foobar
let g:ag_working_path_mode="r"

let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
" let g:go_bin_path = "/usr/local/bin/"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" a little more informative version of the above
nmap <Leader>l :call <SID>SynStack()<CR>

let $RUST_SRC_PATH = '$HOME/.cargo/src/rustc-1.8.0/src'
let g:rustfmt_autosave = 0 " auto format rust files on save

" nerdtree
" Start NERDTree when vim starts
autocmd VimEnter * NERDTree
" Jump to the main window.
autocmd VimEnter * wincmd p
map <Leader>t :NERDTreeToggle<CR>
let g:NERDTreeWinSize=22
" close vim if nerdtree is last window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
