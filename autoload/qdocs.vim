function! qdocs#run(text) abort
  let l:escaped_text = system("ruby --disable=gems -r cgi -e 'print CGI.escape(\"" . a:text . "\")'")
  let l:tmpfile = system("mktemp")
  let l:cmd = "curl 'http://localhost:7593/?input=" . l:escaped_text . "' > " . l:tmpfile
  call system(l:cmd)
  exe "sp " . l:tmpfile
  set buftype=nofile
endfunction
