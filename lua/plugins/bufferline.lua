vim.opt.termguicolors = true

require("bufferline").setup {
    options = {
        -- 使用 nvim 内置lsp
        diagnostics = "coc",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            if context.buffer:current() then
               return ''
            end

            return ''
        end,
        themable = true,
        numbers = "ordinal",
        indicator = {
           style = 'icon',
        },
        -- 左侧让出 nvim-tree的位置
        offsets = {{
            filetype = "NvimTree",
            text = "File Explorer",
            highlight = "Directory",
            text_align = "left"
        }},
        color_icons = true,
        show_buffer_icons = true,
        show_tab_indicators = true,
        separator_stye = "thin",
        always_show_bufferline = true,
        auto_toggle_bufferline = true,
        sort_by = 'insert_at_end',
    }
}
