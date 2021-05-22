" TODO: run this async,
" then ensure it stops once vim closes
autocmd BufNewFile,BufRead *.rb :call system("qdocs --server")

command! -nargs=1 Qd :call qdocs#run(<f-args>)
