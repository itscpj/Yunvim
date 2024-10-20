vim.g.mapleader = " "

local kmp = vim.keymap

-- 各插件的自定义按键放在各插件对应的配置文件中，这里的自定义快捷键是供neovim整体使用的
kmp.set("n", "<leader>pv", ":qa!<CR>")

