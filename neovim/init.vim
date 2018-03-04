"
" Gustavo Paulo <gustavo.paulo.segura@gmail.com>
" nvimrc configuration

"" plugins (see https://github.com/junegunn/vim-plug)
call plug#begin('~/.nvim/plugged')

""" general
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-syntastic/syntastic'
Plug 'jeetsukumaran/vim-buffergator', { 'on': 'BuffergatorToggle' }

""" styling
Plug 'sjl/badwolf'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/indentLine'

""" languages
Plug 'plasticboy/vim-markdown'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
Plug 'zchee/deoplete-go', { 'do': 'make', 'for': 'go' }
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh', 'for': 'go' }
Plug 'jparise/vim-graphql', { 'for': 'graphql' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
call plug#end()

"" some fixes (NERDTree)
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" initial config
set nocompatible
set nowrap
set encoding=utf8
set backspace=indent,eol,start

"" general config
let mapleader = ","
set number
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set laststatus=2
set noshowmode
set splitright
set splitbelow

"" styling
set guifont=Knack\ Nerd\ Font\ Regular\ 10
set t_Co=256
set background=dark
set guioptions-=r
colorscheme badwolf

if (has("termguicolors"))
  set termguicolors
endif

"" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

"" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1

"" shortcuts
map <C-n> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>
map <leader>b :BuffergatorToggle<CR>
