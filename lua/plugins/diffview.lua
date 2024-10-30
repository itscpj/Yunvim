-- Customize Shortcuts
local kmp = vim.keymap
kmp.set("n", "<leader>do", ":DiffviewOpen<CR>")
kmp.set("n", "<leader>dc", ":DiffviewClose<CR>")
kmp.set("n", "<leader>dfh", ":DiffviewFileHistory<CR>")
kmp.set("n", "<leader>dfh1", ":DiffviewFileHistory %<CR>")
