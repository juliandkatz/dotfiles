" ---------------------------------------- GENERAL SETTINGS ---------------------------------------
filetype plugin indent on

" BASIC CONFIG
  let mapleader = "\<Space>"
  set number            " Show line numbers
  set expandtab         " Use spaces instead of tabs
  set tabstop=2         " Set literal tab character to two spaces
  set softtabstop=2     " Fixes some weird behavior
  set shiftwidth=2      " Number of auto-indent spaces
  set colorcolumn=100   " Add column n characters from left
  set linebreak         " Break line on whole word
  set ttyfast           " Improves drawing of screen when scrolling
  set hidden            " Changes buffer behavior to hide rather than overrite
  set history=100       " Lengthens vim history
  set scrolloff=10      " Can't scroll within 10 lines of top of window
  set rnu               " Use relative line numbers
  set mouse=a           " Mouse support
  set clipboard=unnamed " Allows yank to pbcopy  THIS WORKS ON MAC
  set timeoutlen=1000   " Faster key response
  set ttimeoutlen=0     " Faster key response
  set cursorline        " Gently highlights line cursor is on
  set laststatus=2
  set updatetime=20

" SEARCH
  set hlsearch          " highlight search matches
  set incsearch         " incremental searching
  set ignorecase        " Makes search case-insensitive
  set smartcase         " Makes caps required

" MISC
  " Creates command for search for current visually selected text
  vnoremap // y/<C-R>"<CR>

  " clear search highlighting, use space bar, l
  nnoremap <silent> <leader>l :nohlsearch<CR><C-l>

  " Set default fold method
  set foldmethod=indent
  set nofoldenable

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

" ----------------------------------------
" PLUGINS
" ----------------------------------------

" BEGIN PLUGIN DECLARATIONS
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim'
Plug 'elzr/vim-json'
Plug 'easymotion/vim-easymotion' 
Plug 'christoomey/vim-tmux-navigator'
Plug 'nhooyr/neoman.vim'
Plug 'djoshea/vim-autoread'
Plug 'tpope/vim-obsession'
Plug 'google/vim-searchindex'
Plug 'psliwka/vim-smoothie'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'joshdick/onedark.vim'

  if (empty($TMUX))
    if (has("nvim"))
      "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
    "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
    " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
    if (has("termguicolors"))
      set termguicolors
    endif
  endif

  augroup colorextend
    autocmd!

    " Make the main text lighter
    autocmd ColorScheme * call onedark#extend_highlight("Normal", { "fg": { "cterm": "253" } })

    " Make search results orange
    autocmd ColorScheme * call onedark#extend_highlight("Search", { "fg": { "cterm": "214" }})

    " Remove search result background
    autocmd ColorScheme * call onedark#extend_highlight("Search", { "bg": { "cterm": "NONE" }})

    " Make search results underlined
    let s:yellow = { "gui": "#ffaf00", "cterm": "214", "cterm16": "3" }
    autocmd ColorScheme * call onedark#set_highlight("Search", { "fg": s:yellow, "gui": "underline", "cterm": "underline" })
  augroup END

  syntax enable

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plug 'jiangmiao/auto-pairs'
"
"   let g:AutoPairsFlyMode=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'

  function! OpenFind()
    silent NERDTreeFind
    silent NERDTreeTabsOpen
    silent NERDTreeFocusToggle
  endfunction

  let NERDTreeIgnore=['\.DS_Store$']

  nnoremap <silent><leader>n :call OpenFind()<cr>
  nnoremap <silent><leader>a :NERDTreeTabsToggle<cr>

  let g:nerdtree_tabs_focus_on_files=1
  let g:NERDTreeWinSize=40
  let NERDTreeShowHidden=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'neoclide/coc.nvim', {'branch': 'release' }

  " Better display for messages
  set cmdheight=2 "why is this a thing?

  " don't give |ins-completion-menu| messages.
  set shortmess+=c

  " always show signcolumns
  set signcolumn=yes

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
  inoremap <expr><c-K> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

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

  " Use U to show documentation in preview window
  nnoremap <silent> U :call <SID>show_documentation()<CR>

  " Remap for rename current word
  nmap <leader>rn <Plug>(coc-rename)

  nmap <leader>rf <Plug>(coc-refactor)

  " Remap for format selected region
  " vmap <leader>f  <Plug>(coc-format-selected)
  " nmap <leader>f  <Plug>(coc-format-selected)
  " " Show all diagnostics
  nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
  " Manage extensions
  " nnoremap <silent> <leader>e  :<C-u>CocList extensions<cr>
  " Show commands
  " nnoremap <silent> <leader>c  :<C-u>CocList commands<cr>
  " " Find symbol of current document
  " nnoremap <silent> <leader>o  :<C-u>CocList outline<cr>
  " " Search workspace symbols
  " nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
  " " Do default action for next item.
  " nnoremap <silent> <leader>j  :<C-u>CocNext<CR>
  " " Do default action for previous item.
  " nnoremap <silent> <leader>k  :<C-u>CocPrev<CR>
  " " Resume latest coc list
  " nnoremap <silent> <leader>p  :<C-u>CocListResume<CR>

  " Set K to show documentation
  nnoremap <silent> K :call <SID>show_documentation()<CR>
  function! s:show_documentation()
    if &filetype == 'vim'
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  " Format go code on save
  autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

  " COC EXTENSIONS
  Plug 'fannheyward/coc-markdownlint', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
  Plug 'neoclide/coc-pairs', {'do': 'yarn install --frozen-lockfile'}

  " Plug 'iamcco/coc-diagnostic', {'do': 'yarn install --frozen-lockfile'} "
  " This on only works when installed with CocInstall"

  Plug 'neoclide/coc-yank', {'do': 'yarn install --frozen-lockfile'}
    " Key mapping for special yank list to go with this extension
    nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'dyng/ctrlsf.vim'

  nnoremap <Leader>f :CtrlSF<space>
  vmap ?? <Plug>CtrlSFVwordExec

  let g:ctrlsf_auto_focus = {
      \ "at": "start"
      \ }

  let g:ctrlsf_ackprg = 'rg'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

  nmap <c-p> :Files<CR>

  " Make ripgrep the default command
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

  let g:fzf_action = {
      \ 'ctrl-i': 'split'
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'ryanoasis/vim-devicons'

  let g:webdevicons_enable=1
  let g:webdevicons_enable_nerdtree = 1
  let g:webdevicons_enable_airline_statusline = 1
  set encoding=utf8

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'itchyny/lightline.vim'

  let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'cocstatus': 'coc#status'
    \ },
  \ }
  set noshowmode    " Remove the normal status line

  " Use auocmd to force lightline update.
  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" GO
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

  let g:go_fmt_fail_silently = 1
  let g:go_fmt_experimental = 1

  " autocmd FileType go nmap <leader>b  <Plug>(go-build)
  autocmd FileType go nmap <leader>R  <Plug>(go-run)
  autocmd FileType go nmap <silent><leader>s :GoAlternate<cr>
  autocmd FileType go nmap <leader>t  <Plug>(go-test)
  " autocmd FileType go nmap <Leader>i  <Plug>(go-info)

  " Allows for vim-go to save the file when we run :GoBuild
  set autowrite

  " disable vim-go :GoDef short cut (gd)
  " this is handled by LanguageClient [LC]
  let g:go_def_mapping_enabled = 0

  let g:go_auto_type_info = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" JAVASCRIPT
Plug 'pangloss/vim-javascript'
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'mxw/vim-jsx'

  let g:jsx_ext_required = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TYPESCRIPT
Plug 'leafgarland/typescript-vim'

" RUBY
Plug 'tpope/vim-endwise'

" PYTHON
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'hdima/python-syntax'

  let g:python_highlight_all = 1
  let g:python_version_2 = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" MARKDOWN
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'suan/vim-instant-markdown'

  let g:vim_markdown_follow_anchor = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" YAML
Plug 'chase/vim-ansible-yaml'

" END PLUGIN DECLARATIONS
call plug#end()

colorscheme onedark

" ----------- GOOGLE CONFIG -----------
if filereadable("/usr/local/google/home/juliankatz/.config/nvim/additionalConfig.vim")
  source /usr/local/google/home/juliankatz/.config/nvim/additionalConfig.vim
endif
