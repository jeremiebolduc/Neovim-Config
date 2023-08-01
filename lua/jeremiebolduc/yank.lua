-- Define the autocmd group
vim.cmd("augroup highlight_yank")
vim.cmd("autocmd!")

-- Set up the TextYankPost autocmd to trigger the highlighting function
vim.cmd("autocmd TextYankPost * lua vim.highlight.on_yank({higroup='IncSearch', timeout=150})")

-- End the autocmd group
vim.cmd("augroup END")
