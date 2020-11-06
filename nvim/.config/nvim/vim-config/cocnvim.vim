" Better display for messages
set cmdheight=2

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Autocomplete mappings:
" - TAB will trigger autocompletion options when in 
inoremap <silent><expr> <c-J>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
imap <expr><c-K> pumvisible() ? "\<C-p>" : "\<C-h>"

" I've tried different options for a better key for selecting a completion
" option.  But it turns out that they're all broken or slow.  The best
" option seems to be the built in C-y.

" Somehow <CR> is still working to select autocomplete at some weird times.
" Lets completely disable it

" inoremap <expr> <cr> pumvisible() ? "\<C-g>u\<CR>" : "\<C-g>u\<CR>"

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

nmap <leader>rf <Plug>(coc-refactor)

" Remap for format selected region
" vmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
" " Show all diagnostics
nmap <silent> <leader>d  :<C-u>CocList diagnostics<cr>
nmap <silent> <leader>cl  :CocList<cr>
nmap <silent> <leader>cc  :CocCommand<cr>
" Manage extensions
" nmap <silent> <leader>e  :<C-u>CocList extensions<cr>
" Show commands
" nmap <silent> <leader>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
nmap <silent> <leader>col  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nmap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nmap <silent> <leader>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nmap <silent> <leader>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nmap <silent> <leader>p  :<C-u>CocListResume<CR>

" Set K to show documentation
" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>
" nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" COC EXTENSIONS
Plug 'fannheyward/coc-markdownlint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
" Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}

Plug 'josa42/coc-go', {'do': 'yarn install --frozen-lockfile'}
 
" This on only works when installed with CocInstall"
" Plug 'iamcco/coc-diagnostic', {'do': 'yarn install --frozen-lockfile'} "

Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}
  " Key mapping for special yank list to go with this extension
  nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
