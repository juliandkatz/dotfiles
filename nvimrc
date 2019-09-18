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
set clipboard=unnamed " Allows yank to pbcopy
set timeoutlen=1000   " Faster key response
set ttimeoutlen=0     " Faster key response
set cursorline        " Gently highlights line cursor is on

set laststatus=2

" SEARCH
set hlsearch          " highlight search matches
set incsearch         " incremental searching
set ignorecase        " Makes search case-insensitive
set smartcase         " Makes caps required

" Creates command for search for current visually selected text
vnoremap // y/<C-R>"<CR>

" clear search highlighting, use space bar, l
nnoremap <silent> <leader>l :nohlsearch<CR><C-l>
" with tmux

" Set swap files to go in their own directory
" set backupdir=~/.vim/.backup
" set directory=~/.vim/.backup

" Set default fold method
set foldmethod=indent
set nofoldenable

" Make yank/paste more like clipboard
xnoremap p pgvy


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
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
" Plug 'mileszs/ack.vim'
Plug 'AndrewRadev/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'nhooyr/neoman.vim'
Plug 'itchyny/lightline.vim'
Plug 'djoshea/vim-autoread'
Plug 'tpope/vim-obsession'
" Plug 'ludovicchabant/vim-gutentags'

" GO
Plug 'jnwhiteh/vim-golang'
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

nnoremap <leader>n :call OpenFind()<cr>
nnoremap <leader>a :NERDTreeTabsToggle<cr>

let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeWinSize=40
let NERDTreeShowHidden=1

" -------- DEOPLETE --------
call deoplete#enable()
let g:deoplete#enable_at_startup=1

" Closes the suggestion popup when we leave insert mode (i.e. when we've chosen something)
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Changes autocomplete button to TAB
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" deoplete-go settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'const', 'type', 'var']

" -------- ALE --------
let g:ale_linters = {
\   'javascript': ['standard'],
\   'python': ['pylint'],
\}
let g:ale_fix_on_save = 1

" -------- VIM-JSX --------
let g:jsx_ext_required = 0

" -------- ACK.VIM --------
if executable('ag')
  let g:ackprg = 'ag --vimgrep --path-to-ignore ~/.ignore'    " Use ag over ack
endif
nnoremap <Leader>f :Ack!<space>

" Double question mark searches the visually selected area in Ack.vim
vnoremap ?? y:Ack! <C-r>=fnameescape(@")<CR><CR>

" -------- CTRLP.VIM --------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " ignore files in .gitignore

" -------- VIM-DEVICONS --------
let g:webdevicons_enable=1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_statusline = 1
set encoding=utf8

" -------- LIGHTLINE --------
let g:lightline = { 'colorscheme': 'wombat' }
set noshowmode    " Remove the normal status line

" -------- PYTHON-SYNTAX --------
let g:python_highlight_all = 1
let g:python_version_2 = 1

" -------- VIM-MARKDOWN --------
let g:vim_markdown_follow_anchor = 1

" -------- VIM-GO --------
let g:go_fmt_experimental = 1
let g:go_fmt_command = "goimports"

autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  :GoAlternate<cr>

" Allows for vim-go to save the file when we run :GoBuild
set autowrite

let g:gutentags_trace=1

" ----------- GOOGLE CONFIG -----------
source /usr/local/google/home/juliankatz/.config/nvim/additionalConfig.vim
