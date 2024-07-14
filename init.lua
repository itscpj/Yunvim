require("plugins.plugins-setup")
require("core.options")
require("core.keymap")

-- 插件

require("plugins.lualine")
require("plugins.nvimtree")
require("plugins.bufferline")
require("plugins.gitsigns")
require("plugins.telescope")
require("plugins.toggleterm")
require("plugins.comment")
require("plugins.autopairs")
require("plugins.dashboard")
require("plugins.treesitter")
require("plugins.nvimcmp")
require("plugins.mason")
require("plugins.aerial")
require("plugins.cmdline")
require("plugins.notice")

-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- 启动时间
vim.g.start_time = vim.fn.reltime()

-- 确保nvim-cmp被第一时间加载
-- 这里如果要用需要把所有的插件全部写进来
--require('packer').startup(function(use)
--    use 'hrsh7th/nvim-cmp'
    -- 添加你的其他插件
--end)

-- Restore Session
vim.cmd([[
  augroup persistence_save
    autocmd!
    autocmd VimLeavePre * lua require("persistence").save()
  augroup END
]])

-- nvim-tree auto close
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local tree_wins = {}
    local floating_wins = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") ~= nil then
        table.insert(tree_wins, w)
      end
      if vim.api.nvim_win_get_config(w).relative ~= '' then
        table.insert(floating_wins, w)
      end
    end
    if 1 == #wins - #floating_wins - #tree_wins then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(tree_wins) do
        vim.api.nvim_win_close(w, true)
      end
    end
  end
})
