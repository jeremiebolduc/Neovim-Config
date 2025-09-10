local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },

		{
			"sphamba/smear-cursor.nvim",
			opts = {
				stiffness = 0.8, -- 0.6      [0, 1]
				trailing_stiffness = 0.6, -- 0.45     [0, 1]
				stiffness_insert_mode = 0.8, -- 0.6      [0, 1]
				trailing_stiffness_insert_mode = 0.6, -- 0.45     [0, 1]
				smear_between_buffers = true,
				smear_between_neighbor_lines = true,
				scroll_buffer_space = true,
				smear_insert_mode = true,
			},
		},

		-- I have a separate config.mappings file where I require which-key.
		-- With lazy the plugin will be automatically loaded when it is required somewhere
		{ "folke/which-key.nvim", lazy = true },

		{
			"nvim-neorg/neorg",
			-- lazy-load on filetype
			ft = "norg",
			-- options for neorg. This will automatically call `require("neorg").setup(opts)`
			opts = {
				load = {
					["core.defaults"] = {},
				},
			},
		},

		-- {
		-- 	"dstein64/vim-startuptime",
		-- 	-- lazy-load on a command
		-- 	cmd = "StartupTime",
		-- 	-- init is called during startup. Configuration for vim plugins typically should be set in an init function
		-- 	init = function()
		-- 		vim.g.startuptime_tries = 10
		-- 	end,
		-- },

		{
			"hrsh7th/nvim-cmp",
			-- load cmp on InsertEnter
			event = "InsertEnter",
			-- these dependencies will only be loaded when cmp loads
			-- dependencies are always lazy-loaded unless specified otherwise
			dependencies = {
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
			},
			config = function()
				-- ...
			end,
		},
	},
	-- automatically check for plugin updates
	checker = { enabled = false },
})
