syntax enable 
set number

" incremental search
set incsearch
" highlighted search results
set hlsearch
" syntax highlight on
syntax on

set ttyfast                "Allow usage of mouse in iTerm
set mouse=a                "allow mose

set ts=4
set autoindent
set expandtab

set shiftwidth=4

set showmatch
let python_highlight_all = 1

" no vi-compatible
set nocompatible
" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on
filetype off
set ls=2                  " Shwo stutus bar


set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'frazrepo/vim-rainbow'

Bundle 'Valloric/YouCompleteMe'

" Better file browser
Plugin 'scrooloose/nerdtree'
" Class/module browser
Plugin 'majutsushi/tagbar'
" Search results counter
Plugin 'vim-scripts/IndexedSearch'
" Code and files fuzzy finder
Plugin'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin'junegunn/fzf.vim'
" Pending tasks list
Plugin'fisadev/FixedTaskList.vim'
" Async autocompletion
"if using_neovim && vim_plug_just_installed
Plugin'Shougo/deoplete.nvim', {'do': ':autocmd VimEnter * UpdateRemotePlugins'}
Plugin'roxma/nvim-yarp'
Plugin'roxma/vim-hug-neovim-rpc'
" Python autocompletion
Plugin'deoplete-plugins/deoplete-jedi'
" Completion from other opened files
Plugin'Shougo/context_filetype.vim'
" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
Plugin'davidhalter/jedi-vim'
" Automatically close parenthesis, etc
Plugin'Townk/vim-autoclose'
" Surround
Plugin'tpope/vim-surround'
" Indent text object
Plugin'michaeljsmith/vim-indent-object'
" Indentation based movements
Plugin'jeetsukumaran/vim-indentwise'
" Better language packs
Plugin'sheerun/vim-polyglot'

" Paint css colors with the real color
Plugin'lilydjwg/colorizer'
" Window chooser
Plugin't9md/vim-choosewin'
" Automatically sort python imports
Plugin'fisadev/vim-isort'
" Highlight matching html tags
Plugin'valloric/MatchTagAlways'
" Generate html in a simple way
Plugin'mattn/emmet-vim'
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative
" numbering every time you go to normal mode. Author refuses to add a setting
" to avoid that)
Plugin'myusuf3/numbers.vim'
" Nice icons in the file explorer and file type status line.
Plugin'ryanoasis/vim-devicons'
" XML/HTML tags navigation (neovim has its own)
Plugin'vim-scripts/matchit.zip'

call vundle#end()            " required

filetype plugin indent on    " required

" html <>
set matchpairs+=<:>

" remove ugly vertical lines on window division
set fillchars+=vert:\

" use 256 colors when possib
"colorscheme vim-monokai-tasty
colorscheme delek


set completeopt+=noinsert
set completeopt-=preview
set wildmode=list:longest

" tab navigation mappings
map tt :tabnew 
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" clear search results
nnoremap <silent> // :noh<CR>

" Tagbar -----------------------------

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" NERDTree -----------------------------

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Enable folder icons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1

" Fix directory colors
highlight! link NERDTreeFlags NERDTreeDir

" Remove expandable arrow
let g:WebDevIconsNerdTreeBeforeGlyphPadding = ""
let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"
let NERDTreeNodeDelimiter = "\x07"

" Autorefresh on tree focus
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()





