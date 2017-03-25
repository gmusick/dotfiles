set nocompatible  " use vim, no vi defaults
filetype off  " required

"""""""""""""""""""""""""""""""""""""""""""""""
" vundle
"""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'molokai'
Plugin 'chriskempson/base16-vim'
Plugin 'ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bkad/CamelCaseMotion'
Plugin 'ervandew/supertab'
Plugin 'yssl/QFEnter'
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'othree/html5.vim'
Plugin 'elixir-lang/vim-elixir'

call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""

syntax on  " turn on syntax highlighting
filetype plugin indent on

colorscheme base16-default

set t_Co=256 " 256 colors
set number  " show line numbers
set ruler  " show line and column numbers
set encoding=utf-8  " set default encoding to UTF-8

set visualbell  " don't beep

set guifont=hack:h14
set guioptions-=T  " no tabs
set guioptions-=L  " no left scrollbar
set guioptions-=r  " no right scrollbar

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
set wildignore+=*/public/system/*  " ignore assets
set wildignore+=*.swp,*~,._*  " disable temp and backup files
set wildignore+=*.meta  " ignore .meta files for Unity3D

" backup and swap files
set backupdir=~/.vim/_backup//  " where to put backup files
set directory=~/.vim/_temp//  " where to put swap files

" status line
set laststatus=2  " always show the status bar

" autocommands
au BufNewFile,BufRead *.json set ft=javascript  " treat JSON files like JavaScript
au BufNewFile,BufRead *.json.txt set ft=javascript  " treat JSON files like JavaScript
au VimResized * wincmd =  " resize splits when window size changes
au BufWritePre * :%s/\s\+$//e  " remove trailing whitespace on save

" leader is <space>
let mapleader=" "

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" move around windows easier
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" for Barton
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l

" easy splitting
map <leader>s :split<cr>
map <leader>v :vsplit<cr>


" format the entire file
nmap <leader>c ggVG=

" start a :e at the directory of the current open file
cnoremap %% <C-R>=expand('%:h').'/'<CR>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%

" insert the current directory into a command-line path
cmap <C-P> <C-R>=expand("%:p:h") . "/"<CR>

" adjust viewports to the same size
map <Leader>= <C-w>=

" keep visual selection when indenting or outdenting
vmap <Tab> >gv
vmap <S-Tab> <gv

" search using ack
map <leader>f :Ack!<space>

if executable('ag')
  " use Ag when available
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" search for the term under the cursor
nmap <C-S-f> :let @/="\\<<C-R><C-W>\\>"<CR>:set hls<CR>:silent Ack! "<C-R><C-W>"<CR>;
" search for the highlighted term
vmap <C-S-f> y:let @/=escape(@", '\\[]$^*.')<CR>:set hls<CR>:silent Ack! "<C-R>=escape(@", '\\"#')<CR>"<CR>;
" close the quickfix window
map <leader>q :ccl<CR>

" remove highlighted term
nnoremap <silent> <Leader>* :nohlsearch<CR>

"""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""
" reverse results
let g:ctrlp_match_window_reversed = 0

" more results
let g:ctrlp_max_height = 20

" clear cache inside ctrl-p
let g:ctrlp_prompt_mappings = {'PrtClearCache()': ['<c-s-r>']}

" use the cwd as the path for ctrl-p (default is to use the nearest ancestor
" path that contains a .git directory)
let g:ctrlp_working_path_mode = 'a'

let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" view most recently used files
map <Leader><Leader> :CtrlPMRU<CR>

"""""""""""""""""""""""""""""""""""""""""""""""

map <Leader>\ :NERDTreeToggle<CR>
map <Leader>] :NERDTreeFind<CR>

"""""""""""""""""""""""""""""""""""""""""""""""
" nerd commenter
"""""""""""""""""""""""""""""""""""""""""""""""
" toggle comments
map <Leader>/ <plug>NERDCommenterToggle

"""""""""""""""""""""""""""""""""""""""""""""""

map <silent> <Leader>w <Plug>CamelCaseMotion_w
map <silent> <Leader>b <Plug>CamelCaseMotion_b
map <silent> <Leader>e <Plug>CamelCaseMotion_e
let g:SuperTabDefaultCompletionType = 'context'

" jsx support in .js files
let g:jsx_ext_required = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_tidy_exec = '/usr/local/Cellar/tidy-html5/5.1.25/bin/tidy'
