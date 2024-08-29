vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

   -- Packer 插件管理
   use "wbthomason/packer.nvim"

   -- Neovim主题
   use "folke/tokyonight.nvim"

   -- 状态栏
   use "nvim-lualine/lualine.nvim"

   -- 左侧文件树
   use "nvim-tree/nvim-tree.lua"

   -- 图标
   use 'nvim-tree/nvim-web-devicons'

   -- 快速注释
   use "numToStr/Comment.nvim"

   -- 用ctrl+hjkl来定位窗口
   use "christoomey/vim-tmux-navigator"

   -- 自动补全括号
   use {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
         require("nvim-autopairs").setup {}
      end
   }

   -- tab栏
   use "akinsho/bufferline.nvim"

   -- 左侧git提示
   use "lewis6991/gitsigns.nvim"

   -- 文件检索
   use {
      'nvim-telescope/telescope.nvim', tag = '0.1.6',  
   }

   -- telescope依赖
   use 'nvim-lua/plenary.nvim'

   -- 内置终端
   use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
   end}

   -- 优化nvim通知
   use 'folke/noice.nvim'
   use 'rcarriga/nvim-notify'

   -- notice依赖
   use 'MunifTanjim/nui.nvim'

   -- 启动封面
   use {
      'nvimdev/dashboard-nvim',
      config = function()
      require('plugins.dashboard')
      end
   }

   -- 保存对话
   use {
      "folke/persistence.nvim",
      event = "BufReadPre",
      module = "persistence",
      config = function()
         require("persistence").setup {
            dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),  -- 会话文件存储目录
            options = { "buffers", "curdir", "tabpages", "winsize" }
         }
      print("Persistence.nvim configured")
      end
   }

   -- 管理TODO
   use 'folke/todo-comments.nvim'

   -- treesitter
   use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate', -- 自动更新解析器
   }

   -- 自动补全
   use 'neovim/nvim-lspconfig' -- LSP配置管理器
   use 'williamboman/mason.nvim' -- LSP Manager
   use 'williamboman/mason-lspconfig.nvim'
   use 'onsails/lspkind-nvim' -- 补全项图标
   use 'hrsh7th/cmp-path' -- 路径补全
   use 'hrsh7th/cmp-buffer' -- 缓冲区补全
   use 'hrsh7th/nvim-cmp' -- 主要的补全引擎
   use 'hrsh7th/cmp-cmdline'
   use 'hrsh7th/cmp-nvim-lua'
   use 'hrsh7th/cmp-nvim-lsp' -- 用于nvim-cmp的LSP源

   -- snippet
   use({
	   "L3MON4D3/LuaSnip",
   	-- follow latest release.
	   tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	   -- install jsregexp (optional!:).
   	run = "make install_jsregexp"
   })
   use "saadparwaiz1/cmp_luasnip"

   -- 右侧面板查看代码总览
   use "stevearc/aerial.nvim"
   
   -- 函数签名
   use "ray-x/lsp_signature.nvim"

   -- 快速添加/删除括号和引号
   use "tpope/vim-surround"

   -- 快速编辑多行
   use "mg979/vim-visual-multi"
   
   -- trouble
   use "folke/trouble.nvim"

   -- 为nvim添加项目功能
   use {
      "ahmedkhalf/project.nvim",
      config = function()
         require("project_nvim").setup()
      end
   }

   -- debug
   use 'mfussenegger/nvim-dap'

   -- flash
   use "folke/flash.nvim"

   -- 图一乐
   use 'eandrju/cellular-automaton.nvim'

   -- 直接运行代码
   use { 'michaelb/sniprun', run = 'sh ./install.sh'}

   -- 更好的git视图
   use "sindrets/diffview.nvim"

   -- 刷题
   use {
   	'xeluxee/competitest.nvim',
	   requires = 'MunifTanjim/nui.nvim',
	   config = function() 
         require('competitest').setup() 
      end
   }

end)
