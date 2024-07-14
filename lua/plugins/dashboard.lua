local logo = [[
     ██╗   ██╗██╗   ██╗███╗   ██╗██╗   ██╗██╗███╗   ███╗
     ╚██╗ ██╔╝██║   ██║████╗  ██║██║   ██║██║████╗ ████║
      ╚████╔╝ ██║   ██║██╔██╗ ██║██║   ██║██║██╔████╔██║
       ╚██╔╝  ██║   ██║██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
        ██║   ╚██████╔╝██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
        ╚═╝    ╚═════╝ ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═
]]
logo = string.rep("\n", 8) .. logo .. "\n\n"

local lazy = false

local opts = {
  theme = "doom",
  hide = {
    statusline = false,
  },
  config = {
    header = vim.split(logo, "\n"),
    center = {
      { action = 'lua require("telescope.builtin").find_files()',  desc = " Find File",       icon = " ", key = "f" },
      { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
      { action = 'lua require("telescope.builtin").oldfiles()',    desc = " Recent Files",    icon = " ", key = "r" },
      { action = 'lua require("telescope.builtin").live_grep()',   desc = " Find Text",       icon = " ", key = "g" },
      { action = 'edit ~/.config/nvim/init.lua',                   desc = " Config",          icon = " ", key = "c" },
      { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
      { action = 'lua require("telescope.builtin").buffers()',     desc = " Find Buffer",     icon = "󰮗 ", key = "b" },
      { action = 'lua require("telescope.builtin").help_tags()',   desc = " Help",            icon = "󰋗 ", key = "h" },
      { action = function() vim.api.nvim_input("<cmd>q!<cr>") end, desc = " Quit",            icon = " ", key = "q" },
    },
    footer = function()
      local startuptime = vim.fn.reltimefloat(vim.fn.reltime(vim.g.start_time))
      return { "⚡ Neovim loaded in  " .. string.format("%.2f", startuptime) .. "  ms" }
    end,
  },
}

for _, button in ipairs(opts.config.center) do
  button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
  button.key_format = "  %s"
end

-- open dashboard after closing lazy
if vim.o.filetype == "packer" then
  vim.api.nvim_create_autocmd("WinClosed", {
    pattern = tostring(vim.api.nvim_get_current_win()),
    once = true,
    callback = function()
      vim.schedule(function()
        vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
      end)
    end,
  })
end

require('dashboard').setup(opts)
