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

" Set default fold method
set foldmethod=indent
set nofoldenable

" Make neovim (only) preview substitutions on the fly
set inccommand=nosplit
