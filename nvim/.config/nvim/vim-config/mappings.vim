" Creates command for search for current visually selected text
vnoremap // y/<C-R>"<CR>

" clear search highlighting, use space bar, l
nnoremap <silent> <leader>l :nohlsearch<CR><C-l>


" Make yank/paste more like clipboard
xnoremap p pgvy

" Kept making this mistake.  Let's map it away
:command! F f

" Close the quickfix, location, and NERDTree windows
nnoremap <silent> <leader>c :ccl <bar> lcl <bar> NERDTreeTabsClose <CR>

" Only sets cursorline on the selected window
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END

" From insert mode, Ctrl+u will uppercase the current word
inoremap <c-u> <esc>vBU`>a

" Bring up vimrc in a split
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source the vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>
