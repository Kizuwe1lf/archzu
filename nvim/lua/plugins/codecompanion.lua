-- plugins/codecompanion.lua
return {
	"olimorris/codecompanion.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-telescope/telescope.nvim",
	},

	config = function()
		require("codecompanion").setup({
			display = {
				chat = {
					show_reasoning = false,
					fold_reasoning = true,
					auto_scroll = false,
				},
			},

			interactions = {
				chat = {
					adapter = "deepseek",
				},
				inline = {
					adapter = "deepseek",
				},
				agent = {
					adapter = "deepseek",
				},
			},

			adapters = {
				deepseek = function()
					return require("codecompanion.adapters").extend("openai", {
						env = {
							api_key = "cmd:echo $DEEPSEEK_API_KEY",
						},
						url = "https://api.deepseek.com",
						opts = {
							stream = false,
						},
						schema = {
							model = {
								default = "deepseek-coder",
							},
						},
					})
				end,
			},

			rules = {
				custom = {
					description = "Cool description i guess",
					files = {
						{
							path = ".codecompanion.md",
							parser = "codecompanion",
						},
					},
				},

				opts = {
					chat = {
						autoload = { "custom" },
					},
				},
			},
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "CodeCompanionChatDone",
			callback = function()
				vim.cmd("normal! \\<Esc>")
			end,
		})
	end,
}
