return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				-- use ripgrep for better performance
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
			},
		})

		telescope.load_extension("fzf")

		-- keymaps
		vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "Telescope help tags" })
	end,
}
