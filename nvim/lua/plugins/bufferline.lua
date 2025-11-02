-- plugins/bufferline.lua
return {
	"akinsho/bufferline.nvim",
	lazy = false,
	dependencies = "nvim-tree/nvim-web-devicons",
	priority = 998,
	after = "catppuccin",
	config = function()
		require("bufferline").setup {
			options = {
				close_command = "bp|sp|bn|bd! %d",

				indicator_icon = nil,
				indicator = { style = "icon", icon = "▎" },
				buffer_close_icon = '',
				modified_icon = "●",
				close_icon = "",
				right_trunc_marker = "",
				left_trunc_marker = "",

				max_name_length = 20,
				max_prefix_length = 15,
				tab_size = 15,

				view = "multiwindow",
				diagnostics = false,
				diagnostics_update_in_insert = false,
				themable = true,

				show_buffer_icons = true,
				show_buffer_close_icons = false,
				show_close_icon = false,
				show_tab_indicators = true,
				persist_buffer_sort = true,
				separator_style = "slant",
				enforce_regular_tabs = true,
				always_show_bufferline = true,
				offsets = {
					{
						filetype = "neo-tree",
						text = "File Explorer",
						highlight = "Directory",
						separator = true,
						text_align = "left",
					},
				},
			}
		}
	end,
}
