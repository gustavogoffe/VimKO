" Theme configuration
" https://github.com/rakr/vim-one/blob/master/colors/one.vim - All colors config.
function SetCustomColors()
  " Editor
  call one#highlight('Normal',             'e8eaeb',  '',        '')

  " make vim comments lighter than before.
  call one#highlight('vimCommentTitle',     '91969e',  '',        '')
  call one#highlight('vimLineComment',      '91969e',  '',        '')
  call one#highlight('Comment',             '91969e',  '',        '')
endfunc

set termguicolors
set background=dark
colorscheme one

let g:one_allow_italics = 1

" Remove the background color and let the iTerm background color.
highlight Normal guibg=none

" Markdown styles
highlight htmlH1 guifg=#ffd01b gui=bold
highlight htmlH2 guifg=#8be9fd gui=bold
highlight htmlH3 guifg=#ff79c6 gui=bold
highlight htmlH4 guifg=#ffb86c gui=bold
highlight htmlH5 guifg=#f1fa8c gui=bold

call SetCustomColors()
