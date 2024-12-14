vim.cmd([[
  function! OpenMessagesInVerticalSplit()
    redir => messages
    silent messages
    redir END
    vnew
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted
    silent put=messages
    normal! gg
    setlocal nomodifiable
  endfunction
  command! VMessages call OpenMessagesInVerticalSplit()
]])

vim.keymap.set("n", "<leader>msg", "<CMD>VMessages<CR>", {
	noremap = true,
	silent = true,
})
