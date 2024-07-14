vim.g.mapleader = " "

local kmp = vim.keymap

kmp.set("n", "<leader>pv", ":qa!<CR>")
-- 插件
-- nvim-tree
kmp.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- bufferline
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<leader>1', ':BufferLineGoToBuffer 1<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>2', ':BufferLineGoToBuffer 2<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>3', ':BufferLineGoToBuffer 3<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>4', ':BufferLineGoToBuffer 4<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>5', ':BufferLineGoToBuffer 5<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>6', ':BufferLineGoToBuffer 6<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>7', ':BufferLineGoToBuffer 7<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>8', ':BufferLineGoToBuffer 8<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>9', ':BufferLineGoToBuffer 9<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>$', ':BufferLineGoToBuffer -1<CR>', opts)

-- packersync
kmp.set('n', '<leader>psc', function()
   vim.cmd('PackerSync')
end, { noremap=true, silent=true, expr=true })
