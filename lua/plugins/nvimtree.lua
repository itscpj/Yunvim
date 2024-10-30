-- refer to the configuration section below
-- nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Customize Shortcuts
local kmp = vim.keymap
kmp.set("n", "<leader>e", ":NvimTreeToggle<CR>")

require("nvim-tree").setup({
   --project.nvim related config
   respect_buf_cwd = true,
   update_focused_file = {
      enable = true,
      update_root = true
   },

   sort = {
      sorter = "case_sensitive",
   }, 
   view = {
      width = 30,
   },
   renderer = {
      group_empty = true, -- 当目录为空时，仍然显示目录项
      highlight_git = "all", -- 高亮git属性
      highlight_diagnostics = "all", -- 高亮诊断属性
      highlight_opened_files = "all", -- 高亮
   }, -- 当目录为空时，仍然显示目录项
   filters = {
      dotfiles = false,
   }, -- 显示隐藏文件
   git = {
      enable = true, -- 启用git支持
   },
})

-- nvim-tree auto close
vim.api.nvim_create_autocmd("QuitPre", {
   callback = function()
      local invalid_win = {}
      local wins = vim.api.nvim_list_wins()
      for _, w in ipairs(wins) do
         local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
         if bufname:match("NvimTree_") ~= nil then
            table.insert(invalid_win, w)
         end
      end
      if #invalid_win == #wins - 1 then
         -- Should quit, so we close all invalid windows.
         for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
      end
   end
})
