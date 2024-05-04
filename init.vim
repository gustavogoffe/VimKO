let g:python3_host_prog='/Users/dggoffe/.pyenv/versions/3.12.2/bin/python'
let g:python_host_prog='/Users/dggoffe/.pyenv/versions/2.7.18/bin/python'

source $HOME/.config/nvim/config/plugins.vimrc
source $HOME/.config/nvim/config/theme.vimrc
source $HOME/.config/nvim/managed_mappings.vimrc

set encoding=UTF-8           "  Set encoding as UTF-8
set fileencoding=utf-8       "  The encoding written to file
set hidden                   "  Hide buffers when abandoned instead of unload
set synmaxcol=1000           "  Don't syntax highlight long lines
set colorcolumn=80,120       "  Draw column limit
set mmp=5000                 "  Maximum amount of memory (in Kbyte) to use for pattern matching
set scrolloff=3              "  Minimal number of screen lines to keep above and below the cursor

set cmdheight=2              "  Give more space for displaying messages

set tags=./.tags             "  Default tag folder

set updatetime=100           "  Smaller updatetime for CursorHold & CursorHoldI

set shortmess+=c             "  Don't pass messages to |ins-completion-menu|

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Behavior
set number                "  Enable numbers on scroll side
set relativenumber        "  Enable relative numbers on scroll side
set nowrap                "  Don't wrap too long line
set inccommand=nosplit    "  Shows the effects of a command incrementally, as you type
set list                  "  Show hidden characters
set listchars=tab:→\ ,nbsp:␣,trail:•,eol:\ ,precedes:«,extends:»

set clipboard=unnamed    " To ALWAYS use the clipboard for ALL operations

set foldmethod=indent    " Lines with equal indent form a fold
set foldlevelstart=99

" Appearance
set noshowmode          "  Don't show mode in cmd window
set showtabline=2       "  Always show the tabs line
set scrolloff=2         "  Keep at least 2 lines above/below
set sidescrolloff=5     "  Keep at least 5 lines left/right
set display=lastline    "  When included, as much as possible of the last line in a window will be displayed
set cursorline          "  Highlight the screen line of the cursor with CursorLine

" Javascript
" Pretifier configuration
autocmd FileType javascript set formatprg=prettier\ --stdin

" Tabs and Indents
set textwidth=80  "  Text width maximum chars before wrapping
set expandtab     "  Don't expand tabs to spaces
set tabstop=2     "  The number of spaces a tab is
set softtabstop=2 "  While performing editing operations
set shiftwidth=2  "  Number of spaces to use in auto(indent)
set smarttab      "  Tab insert blanks according to 'shiftwidth'
set autoindent    "  Use same indenting on new lines
set smartindent   "  Smart autoindenting on new lines
set shiftround    "  Round indent to multiple of 'shiftwidth'
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2

" Searching
set ignorecase      "  Search ignoring case
set smartcase       "  Keep case when searching with * set infercase
set incsearch       "  Incremental search
set hlsearch        "  Highlight search results
set wrapscan        "  Searches wrap around the end of the file
set showmatch       "  Jump to matching bracket
set matchpairs+=<:> "  Add HTML brackets to pair matching
set matchtime=1     "  Tenths of a second to show the matching paren
set cpoptions-=m    "  showmatch will wait 0.5s or until a char is typed

" AutoClose for vim erb
let g:AutoClosePairs = { '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

" switch to relative numbers in normal mode
autocmd BufLeave * :set norelativenumber
autocmd BufEnter * :set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" Groovy syntax highlighting for Jenkinsfiles
au BufNewFile,BufRead Jenkinsfile set filetype=groovy

" Treat words with dash as a word
set iskeyword+=-

" Coc
augroup mygroup
  autocmd!

  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

set timeoutlen=500

" Clean Parameters in parentheses: dp, cp
" :<c-u>normal! enable normal mode
" type: f(vi( - find next parameter, select all inside (vi(
" <cr> - execute normal command
onoremap p :<c-u>normal! f(vi(<cr>

" Load all functions
source $HOME/.config/nvim/functions.vim
