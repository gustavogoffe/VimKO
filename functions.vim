" Checkbox toogler
fu! ToogleCheckbox()
  let line = getline('.')

  if(match(line, '\[.*\]') != -1)
    let states = [' ', 'x', 'n/a']

    if(match(line, '\[\]') != -1)
      let line = substitute(line, '\[\]', '[ ]', '')
    end

    for state in states
      if(match(line, '\[' . state . '\]') != -1)
        if state == 'n/a'
          let next_state = states[0]
        else
          let next_state = states[index(states, state) + 1]
        endif
        let line = substitute(line, '\[' . state . '\]', '[' . next_state . ']', '')
        break
      endif
    endfor
  else
    let line = substitute(line, '\<', '' . '[ ]' . ' ', '')
  endif

  call setline('.', line)
endf

function! RunTestsOnLeftPane(file_name)
  if(match(a:file_name, '_spec.rb') != -1)
    VimuxRunCommand("bundle exec rspec " . a:file_name)
  elseif(match(a:file_name, '.feature') != -1)
    VimuxRunCommand("clear; bin/spring cucumber " . a:file_name . " --fail-fast --profile")
  elseif(match(a:file_name, 'test/.*_test.exs') != -1)
    VimuxRunCommand("clear; mix test " . a:file_name)
  elseif(match(a:file_name, 'test/.*_test.rb') != -1)
    VimuxRunCommand("clear; be rake test TEST=" . a:file_name)
  elseif(match(a:file_name, 'tests/flows/.*_process.rb') != -1)
    VimuxRunCommand("clear; bundle exec flows test " . a:file_name)
  endif
endfunction

function! VimuxSlime()
  call VimuxSendText(@v)
  call VimuxSendKeys("Enter")
endfunction

function! OpenCurrentFileOnGithub()
  let branch_url = system('git remote get-url --all origin | grep github | head -1')
  let branch_path = substitute(split(branch_url, ':')[1], '.git', '', 'g')

  let repo_url = "https://github.com/" .  substitute(branch_path, '\n\+$', '', '') . "/blob/master/" . expand('%') . '\#L' . line('.')
  exec "! open " . repo_url
endfunction

function! CutAndPasteByLineNumber(relative_line_number)
  let cursor_position = getpos('.')

  exec a:relative_line_number . 'd'
  call setpos(".", cursor_position)
  normal P
  call setpos(".", cursor_position)
endfunction

" Print the current date as ## Thu 28 Apr 2022
function! DateFunc()
  put =strftime(\"## %a %d %b %Y \")
endfunction
command! Date call DateFunc()

" set working directory to git project root
" or directory of current file if not git project
function! SetProjectRoot()
  " default to the current file's directory
  lcd %:p:h
  let git_dir = system("git rev-parse --show-toplevel")
  " See if the command output starts with 'fatal' (if it does, not in a git repo)
  let is_not_git_dir = matchstr(git_dir, '^fatal:.*')
  " if git project, change local directory to git project root
  if empty(is_not_git_dir)
    lcd `=git_dir`
  endif
endfunction
command! Root call SetProjectRoot()
