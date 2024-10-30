require("project_nvim").setup {
   show_hidden = true, 
}

-- Customize Shortcuts
local kmp = vim.keymap
kmp.set("n", "<leader>pj", ":Telescope projects<CR>")
