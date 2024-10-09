local function get_theme()
    -- 获取当前时间
    local hour = tonumber(os.date('%H'))
    local minute = tonumber(os.date('%M'))
    
    -- 判断时间并返回相应的主题
    if (hour > 8 or (hour == 8 and minute >= 0)) and (hour < 17 or (hour == 17 and minute <= 30)) then
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
