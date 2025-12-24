-- plugins/telescope.lua
return {
	'nvim-telescope/telescope.nvim',
	dependencies = { 'nvim-lua/plenary.nvim', 'folke/trouble.nvim' },
	config = function()
		local telescope = require("telescope")
		local trouble = require("trouble.sources.telescope")

		telescope.setup {
			defaults = {
				file_ignore_patterns = {
					"node_modules",
					"vendor",
					".git",
					"%.ni",
					"%.lock",
				},
				mappings = {
					i = { ["<c-t>"] = trouble.open },
					n = { ["<c-t>"] = trouble.open },
				},
			},
			pickers = {
				find_files = {
					theme = "ivy",
					hidden = true,
				},
				live_grep = {
					theme = "ivy",
					additional_args = function(_)
						return { "--hidden" }
					end
				},
				help_tags = {
					theme = "ivy"
				},
			},
		}
	end,
}
