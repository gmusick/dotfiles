set nocompatible  " use vim, no vi defaults
filetype off  " required

"""""""""""""""""""""""""""""""""""""""""""""""
" vundle
"""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kchmck/vim-coffee-script'
Bundle 'molokai'
Bundle 'ctrlp.vim'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'nono/vim-handlebars'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'

"""""""""""""""""""""""""""""""""""""""""""""""

syntax on  " turn on syntax highlighting
filetype plugin indent on

colorscheme molokai

set t_Co=256 " 256 colors
set number  " show line numbers
set ruler  " show line and column numbers
set encoding=utf-8  " set default encoding to UTF-8

set visualbell  " don't beep

set guifont=Inconsolata-g:h12
set guioptions-=T

set nowrap  " don't wrap lines
set tabstop=2  " a tab is two spaces
set shiftwidth=2  " an autoindent (with <<) is two spaces
set softtabstop=2
set expandtab  " use spaces, not tabs
set backspace=indent,eol,start  " backspace through everything in insert mode

set list  " show invisible characters
set listchars=""  " reset the listchars
set listchars=tab:\ \  " a tab should display as "  "
set listchars+=trail:·  " show trailing spaces as dots
set listchars+=extends:>  " The character to show in the last column when wrap is off and the line continues beyond the right of the screen
set listchars+=precedes:<  " The character to show in the last column when wrap is off and the line continues beyond the right of the screen

" searching
set hlsearch  " highlight matches
set incsearch  " incremental searching
set ignorecase  " searches are case insensitive
set smartcase  " unless they contain at least one capital letter

" allow switching of buffers before saving them
set hidden

" ignore these file types when tab completing or globing
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem  " disable output and VCS files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz  " disable archive files
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*  " ignore bundler and sass cache
set wildignore+=*.swp,*~,._*  " disable temp and backup files

" backup and swap files
set backupdir=~/.vim/_backup//  " where to put backup files
set directory=~/.vim/_temp//  " where to put swap files

" status line
set laststatus=2  " always show the status bar

" autocommands
au BufNewFile,BufRead *.json set ft=javascript  " treat JSON files like JavaScript
au VimResized * wincmd =  " resize splits when window size changes

" leader is <space>
let mapleader=" "

" move around windows easier
map <C-j> <C-w>j
imap <C-j> <Esc> <C-w>j
map <C-k> <C-w>k
imap <C-k> <Esc> <C-w>k
map <C-h> <C-w>h
imap <C-h> <Esc> <C-w>h
map <C-l> <C-w>l
imap <C-l> <Esc> <C-w>l

" format the entire file
nmap <leader>fef ggVG=

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" start a :e at the directory of the current open file
cnoremap %% <C-R>=expand('%:h').'/'<CR>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%

" insert the current directory into a command-line path
cmap <C-P> <C-R>=expand("%:p:h") . "/"<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" adjust viewports to the same size
map <Leader>= <C-w>=

" keep visual selection when indenting or outdenting
vmap <Tab> >gv
vmap <S-Tab> <gv

" search using ack
map <C-S-f> :Ack!<space>

" remove highlighted term
nnoremap <silent> <Leader>. :nohlsearch<CR>

"""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""
" reverse results
let g:ctrlp_match_window_reversed = 0

" more results
let g:ctrlp_max_height = 20

" clear cache inside ctrl-p
let g:ctrlp_prompt_mappings = {'PrtClearCache()': ['<c-s-r>']}

" view most recently used files
map <Leader><Leader> :CtrlPMRU<CR>

"""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""
" nerd commenter
"""""""""""""""""""""""""""""""""""""""""""""""
" toggle comments
map <Leader>/ <plug>NERDCommenterToggle

"""""""""""""""""""""""""""""""""""""""""""""""
