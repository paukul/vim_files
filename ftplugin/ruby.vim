fu! SpinUp()
  :silent execute "!bundle exec spin push % &>/dev/null &" | redraw!
endfunction

fu! s:SpinUpTest(testName)
  execute "!bundle exec spin push " . bufname("%") . ":" . a:testName . " &>/dev/null &" | redraw!
endfunction

fu! s:DetectTestName()
  let ln = a:firstline
  while ln > 0
    let line = getline(ln)
    if line =~ "test.*do"
      let testName = matchstr(line, "['\"].*['\"]")
      let testName = strpart(testName, 1, strlen(testName) - 2)
      return "test_" . substitute(testName, " ", "_", "g")
    endif
    let ln -= 1
  endwhile
  return 0
endfunction

fu! SpinUpSingle()
  let testName = s:DetectTestName()
  call s:SpinUpTest(testName)
endfunction

map <leader>r :call SpinUp()<cr>
" map <leader>rf :call SpinUpSingle()<cr>
