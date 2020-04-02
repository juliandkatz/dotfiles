" ---------------------------------------- GENERAL SETTINGS ---------------------------------------
filetype plugin indent on

let VIM_CONFIG_DIR=expand("$HOME/.config/nvim/vim-config")

execute "source" VIM_CONFIG_DIR . "/basic-settings.vim"
execute "source" VIM_CONFIG_DIR . "/mappings.vim"

" MISC

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
Plug 'honza/vim-snippets'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

Plug 'joshdick/onedark.vim'

  set notermguicolors

  " if (empty($TMUX))
  "   if (has("nvim"))
  "     "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  "     let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  "   endif
  "   "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "   "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  "   " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  "   if (has("termguicolors"))
  "     set termguicolors
  "   endif
  " endif

  augroup colorextend
    autocmd!

    " Make the main text lighter
    autocmd ColorScheme * call onedark#extend_highlight("Normal", { "fg": { "cterm": "253" } })

    " Make search results orange
    " autocmd ColorScheme * call onedark#extend_highlight("Search", { "fg": { "cterm": "214" }})
    " I apparently don't need this??? it's breaking vimrc source

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
  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

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
