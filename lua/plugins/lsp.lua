return {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.4", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/nvim-cmp", -- completion engine
			"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
			-- "L3MON4D3/LuaSnip", -- snippet engine (optional but common)
			"saadparwaiz1/cmp_luasnip", -- snippets in completion
			"hrsh7th/cmp-cmdline",
		},
		config = function()
			local lspconfig = require("lspconfig")

			-- Setup completion
			local cmp = require("cmp")
			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}),
			})
			-- Cmdline completion (for ":")
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})

			-- Setup gopls
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			lspconfig.gopls.setup({
				capabilities = capabilities,
				on_attach = function(_, bufnr)
					local wk = require("which-key")
					wk.register({
						g = {
							d = { vim.lsp.buf.definition, "Go to Definition" },
							r = { vim.lsp.buf.references, "Go to References" },
							i = { vim.lsp.buf.implementation, "Go to Implementation" },
							h = { vim.lsp.buf.hover, "Hover Info" },
						},
					}, { buffer = bufnr })
					wk.register({
						["<leader>d"] = {
							name = "+diagnostics",
							d = { vim.diagnostic.open_float, "Show diagnostics in float" },
							l = { vim.diagnostic.setloclist, "Diagnostics to loclist" },
							n = { vim.diagnostic.goto_next, "Next diagnostic" },
							p = { vim.diagnostic.goto_prev, "Prev diagnostic" },
						},
					})
				end,
			})
		end,
	},
}
