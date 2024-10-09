require("plugins.packer")
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
require("plugins.indentblankline")

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

-- 阻止indentblankline插件在LICENSE中工作
-- 使用 vim.api.nvim_create_autocmd 创建自动命令
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    -- 指定模式匹配的文件名
    pattern = "LICENSE",
    -- 定义当触发自动命令时要执行的回调函数
    callback = function()
        -- 设置文件类型为 LICENSE
        vim.bo.filetype = "LICENSE"
    end,
})
