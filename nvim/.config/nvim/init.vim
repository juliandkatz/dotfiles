" ----------------------------------------
" GENERAL SETTINGS
" ----------------------------------------
let mapleader = "\<Space>"

filetype plugin indent on

" MISC
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

Plug 'jacoborus/tender.vim' " THEME
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim'
Plug 'elzr/vim-json'
Plug 'easymotion/vim-easymotion' 
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'dyng/ctrlsf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'nhooyr/neoman.vim'
Plug 'itchyny/lightline.vim'
Plug 'djoshea/vim-autoread'
Plug 'tpope/vim-obsession'
" Plug 'ludovicchabant/vim-gutentags'
Plug 'google/vim-searchindex'

" GO
" Plug 'jnwhiteh/vim-golang'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Plug 'AndrewRadev/splitjoin.vim' " This didn't seem to work correctly... why?

" JAVASCRIPT
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" TYPESCRIPT
Plug 'leafgarland/typescript-vim'

" RUBY
Plug 'tpope/vim-endwise'

" PYTHON
" Plug 'tmhedberg/SimpylFold'
Plug 'hdima/python-syntax'

" MARKDOWN
Plug 'suan/vim-instant-markdown'

" YAML
" Plug 'avakhov/vim-yaml'
Plug 'chase/vim-ansible-yaml'

" END PLUGIN DECLARATIONS
call plug#end()

" THEME SETTINGS
set background=dark

if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable

" Make the search result color stick out from the colorscheme more
augroup changeSearchColor
  autocmd!
  autocmd ColorScheme * highlight Search guifg=Orange
  autocmd ColorScheme * highlight IncSearch guibg=Orange
augroup END

colorscheme tender

" ----------------------------------------
" PLUGIN SPECIFIC SETTINGS
" ----------------------------------------

" -------- NERDTREE --------
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

" -------- COC.NVIM --------
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

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

" Format code and add imports on save
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" -------- ALE --------
" Use gopls as the linting engine
let g:ale_linters = {'go': ['gopls']}
" let g:ale_go_bingo_executable = 'gopls'

" -------- VIM-JSX --------
let g:jsx_ext_required = 0

" -------- CTRLSF.VIM --------
nnoremap <Leader>f :CtrlSF<space>
vmap ?? <Plug>CtrlSFVwordExec

let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }

" let g:ctrlsf_default_view_mode = 'compact'
let g:ctrlsf_ackprg = 'rg'

" -------- fzf.VIM --------
nmap <silent> <c-p> :Files<CR>

" Make ripgrep the default command
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

"" -------- VIM-DEVICONS --------
let g:webdevicons_enable=1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_statusline = 1
set encoding=utf8

" -------- LIGHTLINE --------
" Includes changes knowledge of diagnostic info from coc.nvim
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

" -------- PYTHON-SYNTAX --------
let g:python_highlight_all = 1
let g:python_version_2 = 1

" -------- VIM-MARKDOWN --------
let g:vim_markdown_follow_anchor = 1

" -------- VIM-GO --------
" let g:go_fmt_experimental = 1
" let g:go_fmt_command = "goimports"

" autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')

let g:go_fmt_fail_silently = 1

" autocmd FileType go nmap <leader>b  <Plug>(go-build)
" autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <silent><leader>s :GoAlternate<cr>
" autocmd FileType go nmap <leader>t  <Plug>(go-test)
" autocmd FileType go nmap <Leader>i  <Plug>(go-info)

" Allows for vim-go to save the file when we run :GoBuild
set autowrite

" let g:gutentags_trace=1

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" ----------- GOOGLE CONFIG -----------
if filereadable("/usr/local/google/home/juliankatz/.config/nvim/additionalConfig.vim")
  source /usr/local/google/home/juliankatz/.config/nvim/additionalConfig.vim
endif
