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

-- GP
-- Keymap for querying with yanked text
vim.keymap.set('n', '<leader>gq', function()
  local selection = vim.fn.getreg('"')
  local prompt = vim.fn.input('GP Prompt: ')
  vim.cmd('GP ' .. prompt .. ' ' .. selection)
end, { desc = 'GP Query with yanked text' })

-- Keymap for querying visual selection
vim.keymap.set('v', '<leader>gq', function()
  vim.cmd('GP ' .. vim.fn.input('GP Prompt: '))
end, { desc = 'GP Query on visual selection' })

-- Keymap for opening the chat window
vim.keymap.set('n', '<leader>gc', ':GP!<CR>', { desc = 'GP Chat' })
