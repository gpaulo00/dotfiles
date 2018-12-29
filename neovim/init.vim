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
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'vim-syntastic/syntastic'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dyng/ctrlsf.vim'

""" styling
Plug 'sjl/badwolf'
Plug 'KeitaNakamura/neodark.vim'
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
colorscheme neodark

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
let g:airline_theme='neodark'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#syntastic#enabled = 1
if &term =~ 'linux'
  let g:airline_powerline_fonts = 0
endif

"" shortcuts
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <F8> :TagbarToggle<CR>
nnoremap <leader>d2u :e ++ff=dos<cr>:setlocal ff=unix<cr>
cmap w!! w !sudo tee % >/dev/null

nnoremap <leader>p :FZF<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>w :Windows<CR>

nmap     <leader>f <Plug>CtrlSFPrompt

nnoremap <leader>vr :so $MYVIMRC<CR>
nnoremap <leader>ve :tabe $MYVIMRC<CR>

nmap <S-h>  <C-w>h
nmap <S-l>  <C-w>l
nmap <S-k>  <C-w>k
nmap <S-j>  <C-w>j
nnoremap <S-PageUp>    :bn<CR>
nnoremap <S-PageDown>  :bp<CR>

nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>ga :Gcommit --amend<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gl :Git glog<CR>

"" some filetypes
augroup filetypedetect
  au BufRead,BufNewFile *.cr setfiletype crystal
augroup END

""" fzf
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler
