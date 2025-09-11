vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode with jk" })
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- System clipboard
vim.keymap.set("n", "<S-p>", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("v", "<S-p>", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("n", "<S-y>", '"+y', { desc = "Yank motion/line to clipboard" })
vim.keymap.set("v", "<S-y>", '"+y', { desc = "Yank motion/line to clipboard" })
vim.keymap.set("n", "<S-d>", '"+d', { desc = "Delete motion/line to clipboard" })
vim.keymap.set("v", "<S-d>", '"+d', { desc = "Delete motion/line to clipboard" })

-- LSP
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })

-- Toggle relative line numbers
vim.keymap.set("n", "<leader>rl", function()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
    vim.wo.number = true
  else
    vim.wo.relativenumber = true
    vim.wo.number = true
  end
end, { desc = "Toggle relative line numbers" })

-- Go in Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
