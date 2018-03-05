"
" Gustavo Paulo <gustavo.paulo.segura@gmail.com>
" nvimrc configuration

"" plugins (see https://github.com/junegunn/vim-plug)
call plug#begin('~/.nvim/plugged')

""" general
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-syntastic/syntastic'
Plug 'jeetsukumaran/vim-buffergator', { 'on': 'BuffergatorToggle' }
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'

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
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'HerringtonDarkholme/yats.vim'
call plug#end()

"" some fixes (NERDTree)
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif
autocmd StdinReadPre * let s:std_in=1
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

"" configs
let g:deoplete#enable_at_startup = 1
let g:vim_markdown_folding_disabled = 1
let g:NERDSpaceDelims = 1

"" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_aggregate_errors = 1

"" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1

"" shortcuts
" ,cl = comment, ,ci = uncomment
map <C-n> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>
map <leader>b :BuffergatorToggle<CR>

nnoremap <leader>vr :so $MYVIMRC<CR>
nnoremap <leader>ve :e $MYVIMRC<CR>

nnoremap <C-h> :tabprevious<CR>
nnoremap <C-l> :tabnext<CR>
nnoremap <leader>nt :tabnew<CR>
nnoremap <leader>hs :split<CR>
nnoremap <leader>vs :vsplit<CR>

nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>ga :Gcommit --amend<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gl :Git glog<CR>

"" some filetypes
augroup filetypedetect
  au BufRead,BufNewFile *.cr setfiletype crystal
augroup END

"" oni
if exists("g:gui_oni")
  let g:airline#extensions#tabline#enabled = 0
  set showtabline=0
endif
