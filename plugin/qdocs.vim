" TODO: run this async,
" then ensure it stops once vim closes
if executable("qdocs") && executable("curl")
  autocmd BufNewFile,BufRead *.rb :call system("qdocs --server")
  command! -nargs=1 Qd :call qdocs#run(<f-args>)
else
  echom "Qdocs and curl are required for qdocs-vim"
endif
