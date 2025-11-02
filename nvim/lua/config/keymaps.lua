-- config/keymaps.lua

-- Neo-tree
vim.keymap.set("n", "<leader><Tab>", "<cmd>Neotree toggle float<cr>")

-- Bufferline
-- BL Navigation
vim.keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>")
vim.keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>")
vim.keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>")
vim.keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>")
vim.keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>")
vim.keymap.set("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>")
vim.keymap.set("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>")
vim.keymap.set("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>")
vim.keymap.set("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>")
vim.keymap.set("n", "<leader>0", "<cmd>BufferLineGoToBuffer -1<cr>")

-- BL Buffer Management
vim.keymap.set("n", "<leader>x", "<cmd>BufferLinePickClose<cr>")

-- Telescope
vim.keymap.set('n', '<leader>ff', "<cmd>Telescope find_files<cr>")
vim.keymap.set('n', '<leader>fg', "<cmd>Telescope live_grep<cr>")
vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<cr>")
vim.keymap.set('n', '<leader>fh', "<cmd>Telescope help_tags<cr>")
vim.keymap.set('n', '<leader>of', "<cmd>Telescope oldfiles<cr>")



-- Keymaps from lsp.lua

-- map("gd", telescope_builtin.lsp_definitions, "Go To Definition")
-- map("gr", telescope_builtin.lsp_references, "Go To References")
-- map("gt", telescope_builtin.lsp_type_definitions, "Go To Type Definition")
-- map("gi", telescope_builtin.lsp_implementations, "Go To Implementation")
--
-- map("K", vim.lsp.buf.hover, "Show Documentation")
--
-- map("<leader>la", vim.lsp.buf.code_action, "Code Action")
-- map("<leader>lf", vim.lsp.buf.format, "Format Code")
-- map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")
--
-- map("<leader>ws", telescope_builtin.lsp_workspace_symbols, "Workspace Symbols")
-- map("<leader>ds", telescope_builtin.lsp_document_symbols, "Document Symbols")
--
-- map("]d", function() vim.diagnostic.goto_next(); vim.diagnostic.open_float() end, "Next Diagnostic")
-- map("[d", function() vim.diagnostic.goto_prev(); vim.diagnostic.open_float() end, "Previous Diagnostic")


-- Keymaps from dap.lua
-- keys = {
-- 	{ "<F5>",       function() require("dap").continue() end,                                             desc = "Debug: Continue" },
-- 	{ "<F6>",       function() require("dap").step_over() end,                                            desc = "Debug: Step Over" },
-- 	{ "<F7>",       function() require("dap").step_into() end,                                            desc = "Debug: Step Into" },
-- 	{ "<F8>",       function() require("dap").step_out() end,                                             desc = "Debug: Step Out" },
-- 	{ "<Leader>b",  function() require("dap").toggle_breakpoint() end,                                    desc = "Debug: Toggle Breakpoint" },
-- 	{ "<Leader>B",  function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end, desc = "Debug: Set Conditional Breakpoint" },
-- 	{ "<Leader>du", function() require("dapui").toggle() end,                                             desc = "Debug: Toggle UI" },
-- 	{ "<Leader>dr", function() require("dap").repl.open() end,                                            desc = "Debug: Open REPL" },
-- }
