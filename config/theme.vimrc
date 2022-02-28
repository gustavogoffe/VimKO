" Theme configuration
" https://github.com/rakr/vim-one/blob/master/colors/one.vim - All colors config.
function SetCustomColors()
  " Editor
  call one#highlight('Normal',             'e8eaeb',  '',        '')

  " make vim comments lighter than before.
  call one#highlight('vimCommentTitle',     '91969e',  '',        '')
  call one#highlight('vimLineComment',      '91969e',  '',        '')
  call one#highlight('Comment',             '91969e',  '',        '')

  " Ruby
  " call one#highlight('rubyFunction', '',        '',        'bold')
  "
  " Markdown
  " call one#highlight('markdownUrl',               '000000',  '', '')
  " call one#highlight('markdownBold',              '000000',  '', '')
  " call one#highlight('markdownItalic',            '000000',  '', '')
  " call one#highlight('markdownCode',              '000000',  '', '')
  " call one#highlight('markdownCodeBlock',         '000000',  '', '')
  " call one#highlight('markdownCodeDelimiter',     '000000',  '', '')
  " call one#highlight('markdownHeadingDelimiter',  '000000',  '', '')
  " call one#highlight('markdownH1',                '000000',  '', '')
  " call one#highlight('markdownH2',                '000000',  '', '')
  " call one#highlight('markdownH3',                '000000',  '', '')
  " call one#highlight('markdownH3',                '000000',  '', '')
  " call one#highlight('markdownH4',                '000000',  '', '')
  " call one#highlight('markdownH5',                '000000',  '', '')
  " call one#highlight('markdownH6',                '000000',  '', '')
  " call one#highlight('markdownListMarker',        '000000',  '', '')
endfunc

set termguicolors
colorscheme one
set background=dark

let g:one_allow_italics = 1

highlight Normal guibg=none

call SetCustomColors()
