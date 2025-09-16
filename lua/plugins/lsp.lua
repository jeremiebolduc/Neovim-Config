return {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.4",
		-- install jsregexp.
		build = "make install_jsregexp",
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"gopls",
					"terraformls",
				},
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"hrsh7th/nvim-cmp", -- completion engine
			"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
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

			local wk = require("which-key")
			wk.register({
				["<leader>c"] = {
					name = "+code",
					a = { vim.lsp.buf.code_action, "Code Action" },
				},
			}, { buffer = bufnr })

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- Setup Go
			lspconfig.gopls.setup({
				capabilities = capabilities,
				on_attach = function(_, bufnr)
					wk.register({
						g = {
							d = { vim.lsp.buf.definition, "Go to Definition" },
							r = { vim.lsp.buf.references, "Go to References" },
							i = { vim.lsp.buf.implementation, "Go to Implementation" },
							h = { vim.lsp.buf.hover, "Hover Info" },
						},
					}, { buffer = bufnr })
				end,
			})
			-- Setup Terraform
			lspconfig.terraformls.setup({
				cmd = { "terraform-ls", "serve" },
				filetypes = { "terraform", "hcl" },
				root_dir = lspconfig.util.root_pattern(".terraform", ".git"),
			})
		end,
	},
}
