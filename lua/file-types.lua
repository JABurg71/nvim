-- Set specific settings for .txt files
vim.cmd[[
    autocmd BufRead,BufNewFile *.txt echom "Setting local options for .txt files"
    autocmd BufRead,BufNewFile *.txt setlocal wrap
    autocmd BufRead,BufNewFile *.txt setlocal linebreak
    autocmd BufRead,BufNewFile *.txt setlocal nolist
    autocmd BufRead,BufNewFile *.txt setlocal textwidth=80
    autocmd BufRead,BufNewFile *.txt setlocal spell
]]
