" set nocompatible              " be iMproved, required
" filetype off                  " required
set tabstop=2
set shiftwidth=2
set expandtab
set colorcolumn=100
let mapleader = "\<Space>"

set ignorecase        " Makes search case-insensitive
set smartcase         " Makes caps required

set hlsearch          " highlight search matches
set incsearch         " incremental searching

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

" Some settings to enable the theme:
set number        " Show line numbers
set background=dark
syntax enable     " Use syntax highlighting
let g:solarized_termcolors = 256
colorscheme solarized

" ----------------------------------------
" @NeoBundle
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

" ----------------------------------------
" @NeoBundle Configuration
" ----------------------------------------

NeoBundleFetch "Shougo/neobundle.vim"

NeoBundle 'tpope/vim-surround'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'elzr/vim-json'
NeoBundle 'easymotion/vim-easymotion' 
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'marijnh/tern_for_vim', { 'build': { 'mac': 'npm install' } }
NeoBundle "Valloric/YouCompleteMe", { 'build' : { 'mac' : './install.py --tern-completer' } }
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'jelera/vim-javascript-syntax'
" NeoBundle 'pangloss/vim-polyglot'

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"""""""""""""""""
" Syntax Checking Setup
""""""""""""""""
let g:syntastic_javascript_checkers = ['standard']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_html_tidy_exec = 'tidy5'

"""""""""""""""""
" NERDTRee settings
"""""""""""""""""
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store$']
nnoremap <leader>n :NERDTreeFind<cr>
nnoremap <leader>a :NERDTreeToggle<cr>
