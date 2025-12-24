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
			strategies = {
				chat = { adapter = "deepseek" },
				inline = { adapter = "deepseek" },
				agent = { adapter = "deepseek" },
			},
			adapters = {
				deepseek = function()
					return require("codecompanion.adapters").extend("openai", {
						env = {
							api_key = "cmd:echo $DEEPSEEK_API_KEY",
						},
						url = "https://api.deepseek.com",
						model = "deepseek-coder",
						stream = false,
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
						}
					}
				},

				opts = {
					chat = {
						autoload = { "custom" },
					},
				},
			},
		})

		local map = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		map("n", "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>", opts)
		map("v", "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>", opts)

		map("n", "<leader>cc", "<cmd>CodeCompanionActions Toggle<cr>", opts)

		map("n", "<leader>cd", "<cmd>CodeCompanionChat Cancel<CR>", opts)
	end,
}
