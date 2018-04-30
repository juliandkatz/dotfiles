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

set laststatus=2

set termguicolors     " Something to enable colors later on

" SEARCH
set hlsearch          " highlight search matches
set incsearch         " incremental searching
set ignorecase        " Makes search case-insensitive
set smartcase         " Makes caps required

" Creates command for search for current visually selected text
vnoremap // y/<C-R>"<CR>

" clear search highlighting, use space bar -> l
nnoremap <silent> <leader>l :nohlsearch<CR><C-l>

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

Plug 'iCyMind/NeoSolarized'
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
Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'nhooyr/neoman.vim'
Plug 'itchyny/lightline.vim'
Plug 'djoshea/vim-autoread'
Plug 'tpope/vim-obsession'

" JAVASCRIPT
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" RUBY
Plug 'tpope/vim-endwise'

" PYTHON
Plug 'tmhedberg/SimpylFold'
Plug 'hdima/python-syntax'

" MARKDOWN
Plug 'suan/vim-instant-markdown'

" YAML
" Plug 'avakhov/vim-yaml'
Plug 'chase/vim-ansible-yaml'

" END PLUGIN DECLARATIONS
call plug#end()

" THEME SETTINGS
set termguicolors
colorscheme NeoSolarized
set background=dark

" ----------------------------------------
" PLUGIN SPECIFIC SETTINGS
" ----------------------------------------

" -------- NERDTREE --------
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store$']
nnoremap <leader>n :NERDTreeFind<cr>
nnoremap <leader>a :NERDTreeToggle<cr>
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeWinSize=40

" -------- DEOPLETE --------
call deoplete#enable()
let g:deoplete#enable_at_startup=1
let g:python3_host_prog = '/Users/A780976/.pyenv/versions/neovim3/bin/python'

" Changes autocomplete button to TAB
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" -------- ALE --------
let g:ale_linters = {
\   'javascript': ['standard'],
\   'python': ['pylint']
\}
" let g:ale_lint_on_text_changed = 1
" let g:ale_lint_on_enter = 1
"
" let g:ale_fixers = {
" \   'javascript': ['standard', 'eslint']
" \}
" let g:ale_fix_on_save = 1

" autocmd bufwritepost *.js silent !standard --fix %
" set autoread

" -------- VIM-JSX --------
let g:jsx_ext_required = 0

" -------- ACK.VIM --------
if executable('ag')
  let g:ackprg = 'ag --vimgrep'    " Use ag over ack
endif
nnoremap <Leader>f :Ack!<space>

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
