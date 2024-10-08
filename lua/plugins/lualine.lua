local function get_theme()
    -- 获取当前时间
    local hour = tonumber(os.date('%H'))
    
    -- 判断时间并返回相应的主题
    if hour >= 8 and hour < 17 then
        return 'onelight'
    else
        return 'palenight'
    end
end

-- 设置lualine，使用get_theme函数来动态选择主题
require('lualine').setup({
    options = {
        theme = get_theme()
    }
})
