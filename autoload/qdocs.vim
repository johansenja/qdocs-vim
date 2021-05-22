function! qdocs#run(text) abort
  let l:escaped_text = system("ruby --disable=all -r cgi -e 'print CGI.escape(\"" . a:text . "\")'")
  let l:tmpfile = system("mktemp")
  let l:cmd = "curl 'http://localhost:7593/?input=" . l:escaped_text . "' > " . l:tmpfile
  call system(l:cmd)
  exe "sp " . l:tmpfile
  set buftype=nofile
endfunction

let s:server_pid = ''

function! qdocs#start_server() abort
  if s:server_pid ==# ''
    " allows us to do things asynchronously, while also knowing the pid
    let s:server_pid = system("ruby --disable=all -e 'pid=spawn(\"qdocs --server\"); Process.detach(pid); print pid'")
  else
    " No-op, server already running
  endif
endfunction

function! qdocs#stop_server() abort
  if s:server_pid ==# ''
    " No-op, server not running
  else
    call system("kill -9 " . s:server_pid)
    let s:server_pid = ''
  endif
endfunction
