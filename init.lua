-- Load settings
require("config.lazy")
require("config.options")
require("config.keymap")

-- Load plugins 
require("plugins.lualine")
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
require("plugins.indentblankline")
require("plugins.persistence")
require("plugins.todocomment")
require("plugins.project") 
require("plugins.noice")
require("plugins.automaton")
require("plugins.diffview") -- TODO config
require("plugins.lazygit") --TODO config
require("plugins.lspconfig") -- TODO config
require("plugins.luasnip")
require("plugins.lspsignature")
require("plugins.lspkind")
require("plugins.codeium")

-- Start time 
vim.g.start_time = vim.fn.reltime()

-- Restore Session
vim.cmd([[
   augroup persistence_save
      autocmd!
      autocmd VimLeavePre * lua require("persistence").save()
   augroup END
]])

-- Prevent indentblankline.nvim from working in LICENSE
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "LICENSE",
    callback = function()
        vim.bo.filetype = "LICENSE"
    end,
})
