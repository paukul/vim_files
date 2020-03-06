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

set background=dark
set t_ut=
" set termguicolors

if exists('$TMUX')
  " Colors in tmux
  let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"
endif
" use the terminal bg for ALL colorschemes
autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE


" set rtp+=/usr/local/opt/go/misc/vim
call plug#begin('~/.vim/plugged')

"Linters and autocomplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
" Plug 'fishbullet/deoplete-ruby'
set completeopt-=menu,preview
let g:UltiSnipsExpandTrigger="<tab>"
let g:deoplete#enable_at_startup = 1
Plug 'w0rp/ale'
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'ruby': ['rubocop'],
\}
let g:ale_linters = {'rust': ['rustc', 'cargo'] }
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_fix_on_save = 1
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_pattern_options = {'medipack': {'ale_fixers':
\    {
\      '*': ['remove_trailing_lines', 'trim_whitespace'],
\      'javascript': ['prettier'],
\    }
\  }
\}

" Language Support
Plug 'slim-template/vim-slim'
Plug 'StanAngeloff/php.vim'
Plug 'cespare/vim-toml'
Plug 'mxw/vim-jsx'
Plug 'dag/vim-fish'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'othree/yajs.vim'
Plug 'isRuslan/vim-es6'
Plug 'ekalinin/Dockerfile.vim'
Plug 'rust-lang/rust.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-haml'
Plug 'posva/vim-vue'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'elixir-lang/vim-elixir'

Plug 'autozimu/LanguageClient-neovim', {
\ 'branch': 'next',
\ 'do': 'bash install.sh',
\ }

let g:LanguageClient_serverCommands = {
\ 'javascript': ['javascript-typescript-stdio'],
\ 'javascript.jsx': ['javascript-typescript-stdio']
\ }
nnoremap <leader>l :call LanguageClient_contextMenu()<CR>
nnoremap K :call LanguageClient#textDocument_hover()<CR>
nnoremap gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <leader>r :call LanguageClient#textDocument_rename()<CR>

" Colorthemes
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim'
Plug 'junegunn/seoul256.vim'
Plug 'fxn/vim-monochrome'
Plug 'whatyouhide/vim-gotham'
Plug 'joshdick/onedark.vim'

" Tmux
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'
set clipboard=unnamedplus
Plug 'christoomey/vim-tmux-navigator'

" Utility
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/YankRing.vim'
Plug 'ddollar/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'vim-scripts/Rename2'
Plug 'tpope/vim-endwise'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
let g:multi_cursor_start_key='<C-m>'

call plug#end()

" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:UltiSnipsUsePythonVersion = 3
"let g:UltiSnipsExpandTrigger="<NUL>" " ctrl + space
" let g:UltiSnipsExpandTrigger="<c-l>"
" let g:UltiSnipsJumpForwardTrigger="<c-k>"
" let g:UltiSnipsJumpBackwardTrigger="<c-j>"
" let g:ctrlp_max_files = 25000

" Powerline
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline_theme='nord'

" misc
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=indent,eol,start
set autoindent
set list listchars=tab:\ \ ,trail:·
set modelines=0
set number " line numbers
set ruler
set encoding=utf-8 " Encoding to UTF-8
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

" Whitespace and syntax stuff
syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
color nord

" Allow jsx in .js files
let g:jsx_ext_required = 0

filetype plugin indent on " indent depends on filetype
filetype plugin on

" Search
set ignorecase " search case insensitive unless...
set smartcase  " ...search phrase contains a capital letter
set incsearch
set showmatch
set hlsearch " highlight searches and unhighlight search results with <space>
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Movement
" Have screen-line j/k instead of file-line
nnoremap j gj
nnoremap k gk
" use jj in insert mode to go back to normal mode
inoremap jj <ESC>
" make backtick behave like ' for marks
nnoremap ` '

" Filetypes
au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
au BufNewFile,BufRead *.json set ft=javascript
" au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
" enable mouse
set mouse=a
if isMac
  " copy stuff to the macs clipboard
  vmap <leader>c "+y
endif

" Mappings
" Opens an edit command with the path of the currently edited file filled in
cnoremap %% <C-R>=expand("%:p:h")."/"<CR>
map <leader>e :e %%
" Double tap <leader> to switch between current and previous buffer
nnoremap <leader><leader> <c-^>

" Vim internals
" Directories for swp files
set backupdir=~/.config/nvim/backup
set directory=~/.config/nvim/backup
set timeoutlen=250  " Time to wait after ESC
set nobackup
set noswapfile

" FzF
let g:fzf_command_prefix = 'Fzf'
map <leader>b :FzfBuffers<cr>
map <leader>f :FzfFiles<cr>
map <leader>r :FzfRg<cr>

nnoremap <silent> <leader>z :YRShow<CR>

" Only show cursorline in active window
au WinLeave * set nocursorline
au WinEnter * set cursorline

" Golang
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
" let g:go_bin_path = "/usr/local/bin/"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" Show vim syntax selector under cursor
" nmap <Leader>l :call <SID>SynStack()<CR>

" TODO: Check if still needed
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
