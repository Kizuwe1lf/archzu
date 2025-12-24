-- plugins/lsp.lua
return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"nvim-telescope/telescope.nvim",
	},
	config = function()
		vim.diagnostic.config({
			virtual_text = { source = "if_many", prefix = "●" },
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "󰠠",
				},
			},
		})

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
			callback = function(event)
				if vim.bo[event.buf].filetype == 'go' then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = event.buf,
						callback = function() vim.lsp.buf.format({ bufnr = event.buf }) end,
					})
				end

				if vim.bo[event.buf].filetype == 'rust' then
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = event.buf,
						callback = function() vim.lsp.buf.format({ bufnr = event.buf }) end,
					})
				end
			end,
		})

		local lspconfig = require("lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		local servers = {
			lua_ls = {},
			gopls = {
				settings = {
					gopls = {
						buildFlags = { "-tags=integration" },
					},
				},
			},
			rust_analyzer = {
				settings = {
					["rust-analyzer"] = {
						cargo = { allFeatures = true },
						checkOnSave = { command = "clippy" },
					},
				},
			},
		}

		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
			handlers = {
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
						settings = servers[server_name].settings,
					})
				end,
			},
		})
	end,
}
