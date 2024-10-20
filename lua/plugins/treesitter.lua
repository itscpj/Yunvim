require'nvim-treesitter.configs'.setup {
   -- A list of parser names, or "all" (the listed parsers MUST always be installed)
   ensure_installed = {"vim", "regex", "lua", "bash", "markdown", "markdown_inline", "c", "cpp", "python"},

   -- Install parsers synchronously (only applied to `ensure_installed`)
   sync_install = true,

   -- Automatically install missing parsers when entering buffer
   -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
   auto_install = false,

   highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
   },
}
