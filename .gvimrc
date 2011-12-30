" Don't beep
set visualbell

" Start without the toolbar
set guioptions-=T

colorscheme molokai

" if buffer is already open, just go to it rather than open in new window
set switchbuf="useopen"

map <Leader>t :CommandT<CR>
map <Leader>r :CommandTFlush<CR>
map <Leader><Leader> :FufBuffer<CR>

" open a NERDTree file explorer at the current buffer's directory
map <Leader>f :e %:p:h<CR>
map <Leader>p :e .<CR>
