-- plugins/neotree.lua
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	priority = 999,
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			popup_border_style = "single",
			enable_git_status = true,
			enable_modified_markers = true,
			enable_diagnostics = true,
			sort_case_insensitive = true,
			default_component_configs = {
				indent = {
					with_markers = true,
					with_expanders = true,
				},
				modified = {
					symbol = " ",
					highlight = "NeoTreeModified",
				},
				git_status = {
					symbols = {
						-- Change type
						added = "",
						deleted = "",
						modified = "",
						renamed = "",
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "",
						staged = "",
						conflict = "",
					},
				},
			},

			window = {
				position = "float",
				width = 35,
			},

			filesystem = {
				window = {
					-- disable annoying fuzzy finder
					mappings = {
						["/"] = "noop"
					},
				},
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},

			source_selector = {
				winbar = true,
				sources = {
					{ source = "filesystem", display_name = "   Files " },
					{ source = "buffers", display_name = "   Bufs " },
					{ source = "git_status", display_name = "   Git " },
				},
			},
		})
	end,
}
