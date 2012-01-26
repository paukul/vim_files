fu! SpinUp()
  :silent execute "!bundle exec spin push % &>/dev/null &" | redraw!
endfunction

map <leader>r :call SpinUp()<cr>
