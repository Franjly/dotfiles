"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CONF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

syntax on                       " enable syntax.
filetype plugin on              " enable plugins.
set number                      " enable absolute line numbers.
set relativenumber              " enable relative line numbers.
set noerrorbells                " sound off.
set autoindent                  " Indentation level for next line.
set smartindent                 " Indentation level for next line.
set smartcase
set backspace=indent,eol,start  " Be more flexible with backspace.
set autoread                    " reload files when changed.
set nowrap                      " Don't wrap lines.
set incsearch                   " Incremental search.
set ignorecase                  " Ignore case while searching.
set nocursorline                " Highlight current line.
set ruler                       " Show where we are.
set showmatch                   " Show matching brackets.
set shiftwidth=4                " 4 indents for tabs.
set expandtab                   " Expand tabs to spaces.
set tabstop=4                   " 4 column indents.
set softtabstop=4               " Insert mode tab and backspace use 4 spaces.
set complete-=i                 " Ignore included files in complete.
set smarttab                    " Use smarttabs. 
set nobackup                    " No need for backups.
set nowb                        " No autobackup.
set noswapfile                  " No swap.
set undodir=~/.config/nvim/undodir
set undofile

set cursorline                  " Highlight current line.
set colorcolumn=80              " Guideline at 80th column.
highlight ColorColumn ctermbg=0 guibg=lightgrey

set showtabline=2               " Allways show tabs

" set clipboard+=unnamed          " Yank and paste with system clipboard.
" set laststatus=2                " Show status line.
" set wildmenu                    " Wildcard searches.

" leader key
let mapleader = " "

" windows change mappings
nnoremap <Leader>h :wincmd h<CR>
nnoremap <Leader>j :wincmd j<CR>
nnoremap <Leader>k :wincmd k<CR>
nnoremap <Leader>l :wincmd l<CR>
nnoremap <Leader>p :wincmd p<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

" Declare the list of plugins.
" Custom operators
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-sort-motion'
" Plug 'christoomey/vim-titlecase'
" Plug 'christoomey/vim-system-copy'
" Plug 'vim-scripts/ReplaceWithRegister'

" Custom Text Objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'
Plug 'wellle/targets.vim'

" Tools
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mbbill/undotree'
Plug 'tpope/vim-fugitive'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jremmen/vim-ripgrep'
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-repeat'
" Plug 'vifm/vifm.vim'

" Visual tools
Plug 'itchyny/lightline.vim'
Plug 'ap/vim-css-color'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'machakann/vim-highlightedyank'

" Languages and file types
Plug 'ekalinin/Dockerfile.vim'
Plug 'stephpy/vim-yaml'
Plug 'towolf/vim-helm'
Plug 'wgwoods/vim-systemd-syntax'

" Themes
Plug 'morhetz/gruvbox'
Plug 'bluz71/vim-moonfly-colors'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'jacoborus/tender.vim'
Plug 'chriskempson/base16-vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GRUVBOX
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
set background=dark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LIGHTLINE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ] ]
      \ },
      \ 'component': {
      \   'charvaluehex': '0x%B'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'LightlineGitbranch',
      \   'cocstatus': 'coc#status'
      \ },
      \ }

let g:gitbranch_icon = ' '

function! LightlineGitbranch()
	let l:bname = fugitive#head()
	return l:bname != '' ? g:gitbranch_icon . ' ' . l:bname : ''
endfunction

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIFM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>vv :Vifm<CR>
map <Leader>vs :VsplitVifm<CR>
map <Leader>sp :SplitVifm<CR>
map <Leader>dv :DiffVifm<CR>
map <Leader>tv :TabVifm<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RIPGREP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable('rg')
    let g:rg_derive_root='true'
endif

nnoremap <Leader>ps :Rg<SPACE>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRLP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTREE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sync open file with NERDTree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
    if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
        NERDTreeFind
        wincmd p
    endif
endfunction

" Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree()

" Open a NERDTree automatically when vim starts up
" autocmd VimEnter * NERDTree
" Jump to the main window.
" autocmd VimEnter * wincmd p

" Open a NERDTree automatically when vim starts up if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Refresh NERDTree window
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeDirArrowExpandable  = "▶"
let g:NERDTreeDirArrowCollapsible = "◢"

let g:NERDTreeUpdateOnCursorHold = 0
let g:NERDTreeUpdateOnWrite      = 0

map <C-n> :NERDTreeToggle<CR>
noremap <silent> <Leader>n :NERDTreeToggle<CR> <C-w>=
noremap <silent> <Leader>f :NERDTreeFind<CR> <C-w>=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UNDOTREE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:undotree_HighlightChangedWithSign = 0
let g:undotree_WindowLayout             = 4

nnoremap <leader>u :UndotreeShow<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GITGUTTER
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set updatetime=300

let g:gitgutter_grep                    = 'rg'
let g:gitgutter_map_keys                = 0
let g:gitgutter_sign_added              = '▎'
let g:gitgutter_sign_modified           = '▎'
let g:gitgutter_sign_modified_removed   = '▶'
let g:gitgutter_sign_removed            = '▶'
let g:gitgutter_sign_removed_first_line = '◥'

nmap [g <Plug>GitGutterPrevHunkzz
nmap ]g <Plug>GitGutterNextHunkzz
nmap <Leader>ph <Plug>GitGutterPreviewHunk
nmap <Leader>+ <Plug>GitGutterStageHunk
nmap <Leader>- <Plug>GitGutterUndoHunk


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PEARTREE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_backspace   = 1
let g:pear_tree_smart_closers     = 1
let g:pear_tree_smart_openers     = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif 

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
