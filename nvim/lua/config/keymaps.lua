-- config/keymaps.lua
local map = vim.keymap.set

-- Neo-tree
map("n", "<leader><Tab>", "<cmd>Neotree toggle float<cr>")

-- Bufferline Navigation
map("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>")
map("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>")
map("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>")
map("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>")
map("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>")
map("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>")
map("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>")
map("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>")
map("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>")
map("n", "<leader>0", "<cmd>BufferLineGoToBuffer -1<cr>")

-- Bufferline Management
map("n", "<leader>x", "<cmd>BufferLinePickClose<cr>")

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
map("n", "<leader>of", "<cmd>Telescope oldfiles<cr>")

-- Codecompanion
map({ "n", "v" }, "<leader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
map("n", "<leader>cc", "<cmd>CodeCompanionActions Toggle<cr>", { noremap = true, silent = true })
map("n", "<leader>cd", "<cmd>CodeCompanionChat Cancel<CR>", { noremap = true, silent = true })

-- Flash
map({ "n", "x", "o" }, "s", function() require("flash").jump() end)

-- Trouble
map("n", "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>")
map("n", "<leader>tT", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>")

-- LSP
map("n", "gd", "<cmd>Telescope lsp_definitions<cr>")
map("n", "gr", "<cmd>Telescope lsp_references<cr>")
map("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>")
map("n", "gi", "<cmd>Telescope lsp_implementations<cr>")
map("n", "K", vim.lsp.buf.hover)
map("n", "<leader>la", vim.lsp.buf.code_action)
map("n", "<leader>lf", vim.lsp.buf.format)
map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>ws", "<cmd>Telescope lsp_workspace_symbols<cr>")
map("n", "<leader>ds", "<cmd>Telescope lsp_document_symbols<cr>")

--

map("n", "]d", function()
	vim.diagnostic.goto_next(); vim.diagnostic.open_float()
end)
map("n", "[d", function()
	vim.diagnostic.goto_prev(); vim.diagnostic.open_float()
end)
