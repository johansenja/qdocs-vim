if executable("qdocs") && executable("curl")
  autocmd BufNewFile,BufRead *.rb,Gemfile,*.rake,*.ru,Rakefile :call qdocs#start_server()
  autocmd VimLeave * :call qdocs#stop_server()
  command! -nargs=1 Qd :call qdocs#run(<f-args>)
else
  echom "Qdocs and curl are required for qdocs-vim"
endif
