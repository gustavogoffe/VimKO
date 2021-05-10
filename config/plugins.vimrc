"automated installation of vimplug if not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin()

" -----------------------------------------------------------------------------
" Quick Jumps
" -----------------------------------------------------------------------------
  " Lightning fast left-right movement in Vim
  Plug 'unblevable/quick-scope'

  " Vim cursor word
  Plug 'itchyny/vim-cursorword'

  " Better motion
  Plug 'justinmk/vim-sneak'
  let g:sneak#label = 1

  " " Fuzzy finder for lines in the current file
  Plug 'ripxorip/aerojump.nvim', { 'do': ':UpdateRemotePlugins' }

" " -----------------------------------------------------------------------------
" " General
" " -----------------------------------------------------------------------------
  " " Insert and delete brakets, parens, quotes.
  Plug 'jiangmiao/auto-pairs'

  Plug 'mileszs/ack.vim'

  " " Rainbow Parentheses
  Plug 'luochen1990/rainbow'

  " " Smooth scrolling
  " Plug 'yuttie/comfortable-motion.vim'
  "   let g:comfortable_motion_no_default_key_mappings = 1
  "   let g:comfortable_motion_impulse_multiplier = 1

  Plug 'drzel/vim-line-no-indicator'

  " " Vim plugin that shows keybindings in popup
  Plug 'leoatchina/vim-which-key'

  " " Mapping manager
  " Plug 'AlexVKO/vim-mapping-manager', { 'do' : ':UpdateRemotePlugins' }
  Plug 'file://'.expand('~/.config/vim_mapping_manager'), { 'do' : ':UpdateRemotePlugins', 'as': 'vim-mapping-manager-dev' }


  " " Highligh the cursor word
  Plug 't9md/vim-quickhl'

  " " Tmux tabs integration
  Plug 'christoomey/vim-tmux-navigator'

  " " Send commands to other tmux tabs from vim
  Plug 'benmills/vimux'
  "   let g:VimuxOrientation = "h"
  "   let g:VimuxHeight = "40"
  "   let g:VimuxPromptString = "> "

  " " Highligh cursor word
  Plug 'itchyny/vim-cursorword'

  " " Multiple cursors
  Plug 'terryma/vim-multiple-cursors'

  " " Alig code
  Plug 'godlygeek/tabular',{  'on': 'Tabularize'}

  " " Comments
  Plug 'tpope/vim-commentary'

  " " Find and Replace
  Plug 'jremmen/vim-ripgrep'

  " " Allow repeat to work with plugins
  Plug 'tpope/vim-repeat'

  " " Visual indentation
  Plug 'Yggdroot/indentLine'

  " " Bookmarks
  Plug 'MattesGroeger/vim-bookmarks'

  " " Nice foldings
  Plug 'tmhedberg/SimpylFold'

  " "A collection of language packs for Vim.
  Plug 'sheerun/vim-polyglot'
  "
  " " -----------------------------------------------------------------------------
" " Theme
" " -----------------------------------------------------------------------------
  Plug 'rakr/vim-one'

" " -----------------------------------------------------------------------------
" " Fuzzy finder
" " -----------------------------------------------------------------------------
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  source $HOME/.config/nvim/config/plugins/fzf.vimrc
  let g:fzf_layout = { 'down': '~40%' }

  Plug 'alexvko/fzf-to-functions.vim'

" " -----------------------------------------------------------------------------
" " Sidebar
" " -----------------------------------------------------------------------------
    Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
    " Plug 'ryanoasis/vim-devicons',{ 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
    "   autocmd! User nerdtree exe 'source' '$HOME/.config/nvim/config/plugins/nerdtree.vim'

" " -----------------------------------------------------------------------------
" " Airline
" " -----------------------------------------------------------------------------
    Plug 'vim-airline/vim-airline'

    let g:airline_section_a = ''
    let g:airline_section_b = ''
    " let g:airline_section_z = '%3p%%/%L'
    let g:airline_section_y = '%#__accent_bold#%{LineNoIndicator()}%#__restore__#'
    " let g:airline_section_x = ''
    " let g:airline#extensions#tagbar#enabled = 1
    let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" " -----------------------------------------------------------------------------
" " Autocomplete and Snippets
" " -----------------------------------------------------------------------------
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
  "   let g:coc_global_extensions = ['coc-solargraph', 'coc-tsserver']

  " Plug 'neoclide/coc-snippets'
  " Plug 'SirVer/ultisnips'
  " "   let g:UltiSnipsEditSplit="vertical"
  " "   let g:UltiSnipsExpandTrigger="<C-l>"
  " "   " let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/nvim/config/snippets']
  " "   let g:UltiSnipsJumpForwardTrigger="<c-n>"
  " "   let g:UltiSnipsJumpBackwardTrigger="<c-z>"

  Plug 'honza/vim-snippets'
  Plug 'ervandew/supertab'

" " -----------------------------------------------------------------------------
" " Text Objects
" " -----------------------------------------------------------------------------
  " Plug 'kana/vim-textobj-user'
  " Plug 'kana/vim-textobj-entire'
  " Plug 'lucapette/vim-textobj-underscore'
  " Plug 'rhysd/vim-textobj-ruby'
  " Plug 'kana/vim-textobj-indent'
  " Plug 'thinca/vim-textobj-function-javascript'
  " Plug 'inside/vim-textobj-jsxattr'
  " Plug 'whatyouhide/vim-textobj-erb'
  " Plug 'kana/vim-textobj-function'
  " Plug 'mxw/vim-jsx'
  "
  Plug 'tpope/vim-surround'
    let g:surround_35  = "#{\r}"    " #
    let g:surround_45 = "<% \r %>"  " -
    let g:surround_61 = "<%= \r %>" " =

" " -----------------------------------------------------------------------------
" " Ctags
" " -----------------------------------------------------------------------------
  Plug 'junegunn/vim-peekaboo'
  Plug 'junegunn/goyo.vim'
    let g:goyo_height='95%'
    let g:goyo_width='120'
    autocmd! User GoyoLeave nested exec ':so ~/.config/nvim/init.vim'

" " -----------------------------------------------------------------------------
" " Git
" " -----------------------------------------------------------------------------
  " Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'Xuyuanp/nerdtree-git-plugin',{  'on': ['NERDTreeToggle', 'NERDTreeFind'] }
  Plug 'jreybert/vimagit'

" " -----------------------------------------------------------------------------
" " Ruby
" " -----------------------------------------------------------------------------
" " -----------------------------------------------------------------------------
" " -----------------------------------------------------------------------------
" " Javascript
" " -----------------------------------------------------------------------------

" " -----------------------------------------------------------------------------
" " HTML
" " -----------------------------------------------------------------------------
  Plug 'mattn/emmet-vim'

" " -----------------------------------------------------------------------------
" " Ansible
" " -----------------------------------------------------------------------------
  Plug 'pearofducks/ansible-vim', { 'for': 'yaml.ansible' }

" " -----------------------------------------------------------------------------
" " -----------------------------------------------------------------------------
" " PSQL
" " -----------------------------------------------------------------------------
  Plug 'lifepillar/pgsql.vim'

call plug#end()

  " TODO: create new pluggin:
  " - switches case between snake_case and CamelCase
  " - Gets the last typed text and converts to the target case
  " - Autocomplete only classses(or models, controllers)
