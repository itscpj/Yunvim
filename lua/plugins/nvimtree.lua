require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  }, -- 使用大小写敏感的排序方式
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
    dotfiles = true,
  }, -- 显示隐藏文件
  git = {
     enable = true, -- 启用git支持
  },
})
