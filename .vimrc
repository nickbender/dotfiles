call plug#begin('~/.vim/plugins')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'dim13/smyck.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'dense-analysis/ale'
Plug 'leafgarland/typescript-vim'
Plug 'jiangmiao/auto-pairs'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

set autoindent                                     "always set autoindenting on
set autoread                                       "automatically read changes in the file
set backspace=indent,eol,start                     "make backspace behave properly in insert mode
set clipboard=unnamedplus                          "use system clipboard; requires has('unnamedplus') to be 1
set completeopt=longest,menuone,preview            "better insert mode completions
set cursorline                                     "highlight current line
set encoding=utf-8                                 "encode at utf-8 by default
set formatoptions-=croj                            "disable auto comments on new lines
set hidden                                         "hide buffers instead of closing them even if they contain unwritten changes
set hlsearch                                       "highlight search patterns
set history=1000                                   "increase undoo limit
set incsearch                                      "incremental search highlight
set ignorecase                                     "searches are case insensitive...
set laststatus=2                                   "always display the status bar
set noerrorbells                                   "never error bell
set noswapfile                                     "disable swap files
set nowrap                                         "disable soft wrap for lines
set number                                         "display line numbers
set scrolloff=2                                    "always show 2 lines above/below the cursor
set showcmd                                        "display incomplete commands
set smartcase                                      " ..unless they contain at least one capital letter
set splitbelow                                     "vertical splits will be at the bottom
set splitright                                     "horizontal splits will be to the right
set title                                          "show filename being edited
set ttimeout                                       "time waited for key press(es) to complete...
set ttimeoutlen=50                                 " ...makes for a faster key response
set ttyfast                                        "more characters will be sent to the screen for redrawing
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab "use two spaces for indentation
set visualbell                                     "flash screen on error
set wildmenu                                       "better menu with completion in command mode
set wildmode=longest:full,full

colorscheme smyck

"remove trailing whitespace on save
autocmd! BufWritePre * :%s/\s\+$//e

"The Leader
let mapleader="\<Space>"

nnoremap ! :!
"GitGutter
nnoremap <c-N> :GitGutterNextHunk<CR>
nnoremap <c-P> :Files<CR>
nnoremap <c-U> :GitGutterUndoHunk<CR>
"netrw
let g:netrw_banner=0
let g:netrw_winsize=25
let g:netrw_liststyle=4

"ALE
let g:ale_linters = {
  \ 'ruby': ['standardrb'],
  \ 'javascript': ['standard'],
  \}

let g:ale_fixers = {
  \ 'ruby': ['standardrb'],
  \ 'javascript': ['standard'],
  \}

let g:ale_fix_on_save = 1
let g:deoplete#enable_at_startup = 1
nnoremap <leader>n :Lexplore<CR>
