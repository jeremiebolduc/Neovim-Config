require("config.lazy")
require("keymaps.keymaps")
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Absolute line numbers
vim.opt.number = true
-- Show relative numbers
vim.opt.relativenumber = true

-- Keep 12 lines visible above/below cursor when scrolling
vim.opt.scrolloff = 12
-- Keep 10 lines visible on the side of the cursor when scrolling
vim.opt.sidescrolloff = 10

vim.opt.ttimeout = false
