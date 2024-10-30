local opt = vim.opt

-- 默认启动时不打开nvimtree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- 行号
opt.number=true

-- 缩进
opt.tabstop = 3
opt.shiftwidth = 3
opt.expandtab = true
opt.autoindent = true

-- 光标行
opt.cursorline = true

-- 启用鼠标
opt.mouse:append("a")

-- 系统剪贴板
opt.clipboard:append("unnamedplus")

-- 默认新窗口左下
opt.splitright = true
opt.splitbelow = true

-- 搜索
opt.smartcase = true
opt.ignorecase = true

-- 外观
opt.termguicolors = true
-- 获取当前时间
local hour = tonumber(os.date('%H'))
local minute = tonumber(os.date('%M'))

vim.cmd[[colorscheme catppuccin-mocha]]
