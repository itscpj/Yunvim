-- 自定义快捷键
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
vim.api.nvim_set_keymap('n', '<leader>$', ':BufferLineGoToBuffer -1<CR>', opts) -- 直接跳转到最后一个
vim.api.nvim_set_keymap('n', '<Tab>', ':bnext<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bprevious<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<C-w>', ':lua close_and_next_buffer()<CR>', { noremap = true, silent = true })

require("bufferline").setup {
    options = {
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            if context.buffer:current() then
               return ''
            end

            return ''
        end,
        themable = true,
        numbers = "ordinal",
        indicator = {
           style = 'icon',
        },
        -- 左侧让出 nvim-tree的位置
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }},
        color_icons = true,
        show_buffer_icons = true,
        show_tab_indicators = true,
        separator_stye = "thin",
        always_show_bufferline = true,
        auto_toggle_bufferline = true,
        sort_by = 'insert_at_end',
    }
}

-- 定义一个函数来关闭当前缓冲区并自动切换到下一个缓冲区
-- function close_and_next_buffer()
--   local api = vim.api
--   local current_buf = api.nvim_get_current_buf()
--   local buf_count = #api.nvim_list_bufs()
-- 
--   if buf_count > 1 then
--     -- 关闭当前缓冲区
--     api.nvim_command('bd ' .. current_buf)
--     -- 自动切换到下一个缓冲区
--     api.nvim_command('bnext')
--   else
--     -- 如果只有一个缓冲区，先关闭 nvim-tree
--     vim.cmd("NvimTreeClose")
--     -- 再关闭 Neovim
--     api.nvim_command('q!')
--   end
-- end
