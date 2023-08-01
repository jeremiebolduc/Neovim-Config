vim.g.OmniSharp_server_use_mono = 1

vim.g.OmniSharp_server_use_net6 = 1
vim.g.OmniSharp_keep_open = 0
vim.g.OmniSharp_auto_close_solution = 1
vim.g.OmniSharp_complete_empty_members = 1
vim.g.OmniSharp_assembly_search_paths = {

}

vim.keymap.set("n", "<leader>ogd", ":OmniSharpGotoDefinition<CR>", { silent = true })
