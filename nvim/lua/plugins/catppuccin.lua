-- plugins/catppuccin.lua
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "auto", -- latte, frappe, macchiato, mocha
			transparent_background = false, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = {},
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			color_overrides = {
				mocha = {
					rosewater = "#ffc6be",
					flamingo = "#fb4934",
					pink = "#ff75a0",
					mauve = "#f2594b",
					red = "#f2594b",
					peach = "#FFAD7D",
					yellow = "#e9b143",
					green = "#b0b846",
					teal = "#8bba7f",
					sky = "#7daea3",
					blue = "#80aa9e",
					lavender = "#e2cca9",
					text = "#e2cca9",
					subtext1 = "#e2cca9",
					subtext0 = "#e2cca9",
					surface2 = "#665c54",
					base = "#282828",
					mantle = "#1d2021",
					maroon = "#fe8019",
					sapphire = "#689d6a",
					overlay2 = "#8C7A58",
					overlay1 = "#735F3F",
					overlay0 = "#806234",
					surface1 = "#3c3836",
					surface0 = "#32302f",
					crust = "#1b1b1b",
				}
			},
			custom_highlights = {},
			default_integrations = true,
			integrations = {
				mason = false,
				cmp = true,
				gitsigns = true,
				neotree = true,
				telescope = {
					enabled = true,
					style = "nvchad"
				},
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
						ok = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
						ok = { "underline" },
					},
					inlay_hints = {
						background = true,
					},

					bufferline = {
						enabled = true,
						styles = { "italic", "bold" },
						custom = {
							mocha = {
								background = { fg = "#CDD6F4" },
							},
						},
					},
				},
			},
		})

		vim.cmd.colorscheme "catppuccin"
	end
}
