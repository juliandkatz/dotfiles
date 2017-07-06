" ----------------------------------------
" GENERAL SETTINGS
" ----------------------------------------
let mapleader = "\<Space>"

" MISC
set number            " Show line numbers
set expandtab         " Use spaces instead of tabs
set tabstop=2         " Set tab to two spaces
set shiftwidth=2      " Number of auto-indent spaces
set colorcolumn=100   " Add column n characters from left
set linebreak         " Break line on whole word
set ttyfast           " Improves drawing of screen when scrolling
set hidden            " Changes buffer behavior to hide rather than overrite
set history=100       " Lengthens vim history
set scrolloff=10      " Can't scroll within 10 lines of top of window
set rnu               " Use relative line numbers

" SEARCH
set hlsearch          " highlight search matches
set incsearch         " incremental searching
set ignorecase        " Makes search case-insensitive
set smartcase         " Makes caps required

" THEME SETTINGS
set background=dark
syntax enable          " Use syntax highlighting
let g:solarized_termcolors = 256
colorscheme solarized

" Mouse support
set mouse=a
set ttymouse=xterm2

" Allows yank to pbcopy
set clipboard=unnamed

" Creates command for search for current visually selected text
vnoremap // y/<C-R>"<CR>

" clear search highlighting, use space bar -> l
nnoremap <silent> <leader>l :nohlsearch<CR><C-l>

" Set swap files to go in their own directory
set backupdir=~/.vim/.backup
set directory=~/.vim/.backup

" Set default fold method
set foldmethod=indent
set nofoldenable

" Make yank/paste more like clipboard
xnoremap p pgvy


" ----------------------------------------
" PLUGINS
" ----------------------------------------

if has('vim_starting')
 if &compatible
   " Be iMproved
   set nocompatible
 endif

 " Required:
 set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" @NeoBundle Configuration

NeoBundleFetch "Shougo/neobundle.vim"

NeoBundle 'tpope/vim-surround'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'elzr/vim-json'
NeoBundle 'easymotion/vim-easymotion' 
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'scrooloose/nerdtree'
" NeoBundle 'scrooloose/syntastic'
NeoBundle 'marijnh/tern_for_vim', { 'build': { 'mac': 'npm install' } }
NeoBundle "Valloric/YouCompleteMe", { 'build' : { 'mac' : './install.sh --tern-completer' } }
" NeoBundle 'jelera/vim-javascript-syntax'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'ryanoasis/vim-devicons'
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'jez/vim-superman'

" JAVASCRIPT
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mxw/vim-jsx'

" RUBY
NeoBundle 'tpope/vim-endwise'

" PYTHON
NeoBundle 'tmhedberg/SimpylFold'
" NeoBundle 'hdima/python-syntax'

" MARKDOWN
NeoBundle 'suan/vim-instant-markdown'

" YAML
" NeoBundle 'avakhov/vim-yaml'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" ----------------------------------------
" PLUGIN SPECIFIC SETTINGS
" ----------------------------------------

" SYNTASTIC
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_javascript_standard_args = '--parser babel-eslint'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_html_tidy_exec = 'tidy5'

" NERDTREE
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store$']
nnoremap <leader>n :NERDTreeFind<cr>
nnoremap <leader>a :NERDTreeToggle<cr>

" YOUCOMPLETEME
let g:ycm_autoclose_preview_window_after_insertion = 1

" VIM-JSX
let g:jsx_ext_required = 0

" ACK.VIM
if executable('ag')
  let g:ackprg = 'ag --vimgrep'    " Use ag over ack
endif
nnoremap <Leader>f :Ack!<space>

" CTRLP.VIM
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard'] " ignore files in .gitignore

" VIM-DEVICONS
let g:webdevicons_enable=1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_statusline = 1
set encoding=utf8
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete:h11
