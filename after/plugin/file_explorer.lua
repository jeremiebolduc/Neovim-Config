vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
end

-- pass to setup along with your other options
require("nvim-tree").setup {
  ---
  on_attach = my_on_attach,
  ---
}

vim.keymap.set("n", "<leader>et", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>ef", ":NvimTreeFocus<CR>", { silent = true })
