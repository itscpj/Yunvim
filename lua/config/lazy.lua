-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
   local lazyrepo = "https://github.com/folke/lazy.nvim.git"
   local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
   if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
         { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
         { out, "WarningMsg" },
         { "\nPress any key to exit..." },
      }, true, {})
       vim.fn.getchar()
      os.exit(1)
   end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
   spec = {
      -- import your plugins

      -- File Search
      { 
         'nvim-telescope/telescope.nvim', branch = '0.1.x',
         dependencies = { 'nvim-lua/plenary.nvim' }
      },

      { 
         'nvim-telescope/telescope-fzf-native.nvim', 
         build = 'make' 
      },
      
      {
         "nvim-telescope/telescope-file-browser.nvim",
      },

      -- Dashboard
      {
         'nvimdev/dashboard-nvim',
         event = 'VimEnter',
         config = function()
         require('dashboard').setup {
            -- config
         }
         end,
         dependencies = { {'nvim-tree/nvim-web-devicons'}}
      },

      -- Bufferline
      {
         'akinsho/bufferline.nvim', 
         version = "*", 
         dependencies = 'nvim-tree/nvim-web-devicons'
      },

      -- Lualine
      {
         'nvim-lualine/lualine.nvim',
          dependencies = { 'nvim-tree/nvim-web-devicons' }
      },

      -- file browser
      {
         "mikavilpas/yazi.nvim",
         event = "VeryLazy",
         keys = {
            -- 👇 in this section, choose your own keymappings!
            {
               "<leader>-",
               "<cmd>Yazi<cr>",
               desc = "Open yazi at the current file",
            },
            {
               -- Open in the current working directory
               "<leader>cw",
               "<cmd>Yazi cwd<cr>",
               desc = "Open the file manager in nvim's working directory" ,
            },
            {
               -- NOTE: this requires a version of yazi that includes
               -- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
               '<c-up>',
               "<cmd>Yazi toggle<cr>",
               desc = "Resume the last yazi session",
            },
         },
         ---@type YaziConfig
         opts = {
            -- if you want to open yazi instead of netrw, see below for more info
            open_for_directories = false,
            keymaps = {
            show_help = '<f1>',
            },
         },
      },

      -- Catppuccin Theme
      { 
         "catppuccin/nvim", 
         name = "catppuccin", 
         priority = 1000 
      },

      -- Terminal window
      {
         'akinsho/toggleterm.nvim', 
         version = "*", 
         config = true
      },

      -- Enhance comment
      {
         'numToStr/Comment.nvim',
         opts = {
            -- add any options here
         }
      },

      -- Switch windows
      {
         "https://git.sr.ht/~swaits/zellij-nav.nvim",
         lazy = true,
         event = "VeryLazy",
         keys = {
            { "<c-h>", "<cmd>ZellijNavigateLeftTab<cr>",  { silent = true, desc = "navigate left or tab"  } },
            { "<c-j>", "<cmd>ZellijNavigateDown<cr>",  { silent = true, desc = "navigate down"  } },
            { "<c-k>", "<cmd>ZellijNavigateUp<cr>",    { silent = true, desc = "navigate up"    } },
            { "<c-l>", "<cmd>ZellijNavigateRightTab<cr>", { silent = true, desc = "navigate right or tab" } },
         },
         opts = {},
      },

      {
         "hiasr/vim-zellij-navigator.nvim",
         config = function()
            require('vim-zellij-navigator').setup()
         end
      },

      -- Autopair
      {
         'windwp/nvim-autopairs',
         event = "InsertEnter",
         config = true
         -- use opts = {} for passing setup options
         -- this is equivalent to setup({}) function
      },

      -- Save previous windows
      {
         "folke/persistence.nvim",
         event = "BufReadPre", -- this will only start session saving when an actual file was opened
         opts = {
         -- add any custom options here
         }
      },

      -- Enhance TODO comments
      {
         "folke/todo-comments.nvim",
         dependencies = { "nvim-lua/plenary.nvim" },
         opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
         }
      },

      -- Tree siiter
      {
         "nvim-treesitter/nvim-treesitter", 
         build = ":TSUpdate"
      },

      -- Preview Code Structure
      {
         'stevearc/aerial.nvim',
         opts = {},
         -- Optional dependencies
         dependencies = {
         "nvim-treesitter/nvim-treesitter",
         "nvim-tree/nvim-web-devicons"
         },
      },

      -- Better error notice
      {
         "folke/trouble.nvim",
         opts = {}, -- for default options, refer to the configuration section for custom setup.
         cmd = "Trouble",
         keys = {
            {
               "<leader>xx",
               "<cmd>Trouble diagnostics toggle<cr>",
               desc = "Diagnostics (Trouble)",
            },
            {
               "<leader>xX",
               "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
               desc = "Buffer Diagnostics (Trouble)",
            },
            {
               "<leader>cs",
               "<cmd>Trouble symbols toggle focus=false<cr>",
               desc = "Symbols (Trouble)",
            },
            {
               "<leader>cl",
               "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
               desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
               "<leader>xL",
               "<cmd>Trouble loclist toggle<cr>",
               desc = "Location List (Trouble)",
            },
            {
               "<leader>xQ",
               "<cmd>Trouble qflist toggle<cr>",
               desc = "Quickfix List (Trouble)",
            },
         },
      },

      -- More UI compoinents
      {
         "MunifTanjim/nui.nvim"
      },

      -- Project
      {
         "ahmedkhalf/project.nvim"
      },

      -- Better notice
      {
         "folke/noice.nvim",
         event = "VeryLazy",
         opts = {
         -- add any options here
         },
         dependencies = {
         -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
         "MunifTanjim/nui.nvim",
         -- OPTIONAL:
         --   `nvim-notify` is only needed, if you want to use the notification view.
         --   If not available, we use `mini` as the fallback
         "rcarriga/nvim-notify",
         }
      },

      -- Better Search
      {
         "folke/flash.nvim",
         event = "VeryLazy",
         ---@type Flash.Config
         opts = {},
         -- stylua: ignore
         keys = {
            { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
         },
      },

      -- Animation
      {
         "eandrju/cellular-automaton.nvim"
      },

      -- Run Code
      {
         "michaelb/sniprun",
         branch = "master",

         build = "sh install.sh",
         -- do 'sh install.sh 1' if you want to force compile locally
         -- (instead of fetching a binary from the github release). Requires Rust >= 1.65

         config = function()
            require("sniprun").setup({
               -- your options
            })
         end,
      },

      -- Compare two files
      {
         "sindrets/diffview.nvim"
      },

      -- Competitest
      {
	      'xeluxee/competitest.nvim',
	      dependencies = 'MunifTanjim/nui.nvim',
	      config = function() require('competitest').setup() end,
      },

      -- Multi lines edit
      {
         "mg979/vim-visual-multi"
      },

      -- Indent highlight
      {
         "lukas-reineke/indent-blankline.nvim",
         main = "ibl",
         ---@module "ibl"
         ---@type ibl.config
         opts = {},
      },

      -- Lazygit
      {
         "kdheepak/lazygit.nvim",
         lazy = true,
         cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
         },
         -- optional for floating window border decoration
         dependencies = {
            "nvim-lua/plenary.nvim",
         },
         -- setting the keybinding for LazyGit with 'keys' is recommended in
         -- order to load the plugin when the command is run for the first time
         keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
         }
      },

      -- Nvim tree git highlight
      {
         "lewis6991/gitsigns.nvim"
      },
      
      -- Debug
      {
         "mfussenegger/nvim-dap"
      },

      -- Nvim LSP
      {
         "williamboman/mason.nvim",
         "williamboman/mason-lspconfig.nvim",
         "neovim/nvim-lspconfig",
         "onsails/lspkind.nvim"
      },

      {
	      "L3MON4D3/LuaSnip",
         dependencies = { "rafamadriz/friendly-snippets" },
	      -- follow latest release.
	      version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	      -- install jsregexp (optional!).
	      build = "make install_jsregexp"
      },

      {
         "ray-x/lsp_signature.nvim",
         event = "VeryLazy",
      },

      -- Cmp
      {
         "saadparwaiz1/cmp_luasnip",
         "hrsh7th/cmp-cmdline",
         "hrsh7th/cmp-buffer",
         "hrsh7th/cmp-nvim-lua",
         "hrsh7th/cmp-nvim-lsp",
         "hrsh7th/cmp-path",
         "hrsh7th/nvim-cmp"
      },

      -- AI code copilot
      {
         'Exafunction/codeium.vim',
         event = 'BufEnter'
      },

   },
   -- Configure any other settings here. See the documentation for more details.
   -- colorscheme that will be used when installing plugins.
   install = { colorscheme = { "catppuccin-mocha" } },
   -- automatically check for plugin updates
   checker = { enabled = true },
})
