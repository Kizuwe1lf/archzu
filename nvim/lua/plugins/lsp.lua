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
					[vim.diagnostic.severity.WARN]  = "",
					[vim.diagnostic.severity.INFO]  = "",
					[vim.diagnostic.severity.HINT]  = "󰠠",
				},
			},
		})
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspAttach", { clear = true }),
			callback = function(event)
				local telescope_builtin = require("telescope.builtin")

				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end
				map("gd", telescope_builtin.lsp_definitions, "Go To Definition")
				map("gr", telescope_builtin.lsp_references, "Go To References")
				map("gt", telescope_builtin.lsp_type_definitions, "Go To Type Definition")
				map("gi", telescope_builtin.lsp_implementations, "Go To Implementation")
				map("K", vim.lsp.buf.hover, "Show Documentation")
				map("<leader>la", vim.lsp.buf.code_action, "Code Action")
				map("<leader>lf", vim.lsp.buf.format, "Format Code")
				map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
				map("<leader>ws", telescope_builtin.lsp_workspace_symbols, "Workspace Symbols")
				map("<leader>ds", telescope_builtin.lsp_document_symbols, "Document Symbols")

				vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {
					buffer = bufnr,
					noremap = true,
					silent = true,
					desc = "LSP Code Actions"
				})

				map("]d", function()
					vim.diagnostic.goto_next(); vim.diagnostic.open_float()
				end, "Next Diagnostic")
				map("[d", function()
					vim.diagnostic.goto_prev(); vim.diagnostic.open_float()
				end, "Previous Diagnostic")

				if vim.bo[event.buf].filetype == 'go' then
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
