require("aerial").setup({
   backends = { "treesitter", "lsp", "markdown", "asciidoc", "man" },
   -- optionally use on_attach to set keymaps when aerial has attached to a buffer
   on_attach = function(bufnr)
      -- Jump forwards/backwards with '{' and '}'
      vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
      vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
   end,
   layout = {
      max_width = { 40, 0.2 },
      width = nil,
      min_width = 20,

      -- key-value pairs of window-local options for aerial window (e.g. winhl)
      win_opts = {},

      -- Enum: prefer_right, prefer_left, right, left, float
      default_direction = "prefer_right",

      --   edge   - open aerial at the far right/left of the editor
      --   window - open aerial to the right/left of the current window
      placement = "window",

      -- When the symbols change, resize the aerial window (within min/max constraints) to fit
      resize_to_content = true,

      -- Preserve window size equality with (:help CTRL-W_=)
      preserve_equality = false,
  },

})

-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
