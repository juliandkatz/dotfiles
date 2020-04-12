" ---------------------------------------- GENERAL SETTINGS ---------------------------------------
filetype plugin indent on

let VIM_CONFIG_DIR=expand("$HOME/.config/nvim/vim-config")

execute "source" VIM_CONFIG_DIR . "/basic-settings.vim"

" WIP Settings
set nowrapscan

execute "source" VIM_CONFIG_DIR . "/mappings.vim"

" WIP Mappings

" Create movements for 'in/at next parens' and 'in/at last parens'
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap an( :<c-u>normal! f(va(<cr>
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap al( :<c-u>normal! F)va(<cr>

" Do the same for curly braces... we need searching for this!  Will come in
" Chapter 30
" onoremap in{ :<c-u>normal! /{<cr>vi{<cr>
" onoremap an{ :<c-u>normal! /{<cr>va{<cr>
" onoremap il{ :<c-u>normal! ?}<cr>vi{<cr>
" onoremap al{ :<c-u>normal! ?}<cr>va{<cr>

" MISC

" Make help pages open as a vertical split
" Stolen From: https://vi.stackexchange.com/a/4464
augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END

" Turn on spellchecking for .txt, markdown files
augroup filetype_based_spelling
  autocmd!
  autocmd FileType text,markdown :setlocal spell spelllang=en_us
augroup END

" ----------------------------------------
" PLUGINS
" ----------------------------------------

" BEGIN PLUGIN DECLARATIONS
call plug#begin('~/.config/nvim/plugged')

Plug 'flwyd/vim-conjoin'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tomtom/tcomment_vim'
Plug 'elzr/vim-json'
Plug 'christoomey/vim-tmux-navigator'
Plug 'nhooyr/neoman.vim'
Plug 'djoshea/vim-autoread'
Plug 'google/vim-searchindex'
Plug 'psliwka/vim-smoothie'
Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion' 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'haya14busa/incsearch.vim'

  " Basic Usage
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)

  " Advanced Usage
  map n  <Plug>(incsearch-nohl-n)
  map N  <Plug>(incsearch-nohl-N)
  map *  <Plug>(incsearch-nohl-*)
  map #  <Plug>(incsearch-nohl-#)
  map g* <Plug>(incsearch-nohl-g*)
  map g# <Plug>(incsearch-nohl-g#)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'haya14busa/incsearch-easymotion.vim'

  " Basic Usage
  map z/ <Plug>(incsearch-easymotion-/)
  map z? <Plug>(incsearch-easymotion-?)
  map zg/ <Plug>(incsearch-easymotion-stay)

  " Julian Usage
  map <space><space>/ <Plug>(incsearch-easymotion-/)
  map <space><space>? <Plug>(incsearch-easymotion-?)

  " Advanced Usage

  " incsearch.vim x fuzzy x vim-easymotion

  " function! s:config_easyfuzzymotion(...) abort
  "   return extend(copy({
  "   \   'converters': [incsearch#config#fuzzy#converter()],
  "   \   'modules': [incsearch#config#easymotion#module()],
  "   \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  "   \   'is_expr': 0,
  "   \   'is_stay': 1
  "   \ }), get(a:, 1, {}))
  " endfunction
  "
  " noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'joshdick/onedark.vim'

  set notermguicolors

  augroup colorextend
    autocmd!

    " Make the main text lighter
    autocmd ColorScheme * call onedark#extend_highlight("Normal", { "fg": { "cterm": "253" } })

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
  let g:NERDTreeWinSize=60
  let NERDTreeShowHidden=1

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

  nnoremap <c-p> :Files<CR>

  " Make ripgrep the default command
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --no-ignore --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
    \   <bang>0 ? fzf#vim#with_preview('up:60%')
    \           : fzf#vim#with_preview('right:50%:hidden', '?'),
    \   <bang>0)

  " Have to declare all actions to override some actions
  let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-i': 'split',
      \ 'ctrl-v': 'vsplit'
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
  augroup lightline-coc
    autocmd!
    autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
  augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" GO
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
"
"   " let g:go_fmt_fail_silently = 1
"   " let g:go_fmt_experimental = 1
"
"   " autocmd FileType go nmap <leader>b  <Plug>(go-build)
"   autocmd FileType go nnoremap <leader>R  <Plug>(go-run)
"   autocmd FileType go nnoremap <silent><leader>s :GoAlternate<cr>
"   autocmd FileType go nnoremap <leader>t  <Plug>(go-test)
"   " autocmd FileType go nmap <Leader>i  <Plug>(go-info)
"
"   " Allows for vim-go to save the file when we run :GoBuild
"   set autowrite
"
"   " disable vim-go :GoDef short cut (gd)
"   " this is handled by LanguageClient [LC]
"   let g:go_def_mapping_enabled = 0
"
"   let g:go_auto_type_info = 1
"
"   let g:go_diagnostics_enabled = 0
"
"   let g:go_gopls_enabled = 0
"
"   let g:go_info_mode = "guru"
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'neoclide/coc.nvim', {'branch': 'release' }

  execute "source" VIM_CONFIG_DIR . "/cocnvim.vim"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" YAML
Plug 'chase/vim-ansible-yaml'

" END PLUGIN DECLARATIONS
call plug#end()

colorscheme onedark

" ----------- GOOGLE CONFIG -----------
if filereadable("/usr/local/google/home/juliankatz/.config/nvim/google-specific.vim")
  source /usr/local/google/home/juliankatz/.config/nvim/google-specific.vim
endif

" Vimscript exercises
if filereadable("/Users/juliankatz/dev/vimscript-the-hard-way/exercises.vim")
  source /Users/juliankatz/dev/vimscript-the-hard-way/exercises.vim
endif

" A fix for nerdtree devicons having brackets after vimrc source
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
