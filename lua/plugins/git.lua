return {
	{
		"tpope/vim-fugitive",
		config = function()
			vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })
			vim.keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
			vim.keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
			vim.keymap.set("n", "<leader>gl", ":Git log<CR>", { desc = "Git log" })
			vim.keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame" })
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		lazy = true,
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
			"LazyGitFilter",
			"LazyGitFilterCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>gv", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		},
	},
}
