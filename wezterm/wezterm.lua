local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}

config.leader = {
    -- prefixを設定した
    key = 'g',
    mods = 'CTRL',
    timeout_milliseconds = 1000,
}


config.keys = {
    {
    -- paneのzoomを切り替える
        key = 'z',
        mods = 'LEADER',
        action = act.TogglePaneZoomState,
    },
    {
    -- paneを垂直分割する
        key = '\\',
        mods = 'LEADER',
        action = act.SplitHorizontal {
            domain = 'CurrentPaneDomain'
        },
    },
    {
    -- paneを水平分割する
        key = '-',
        mods = 'LEADER',
        action = act.SplitVertical {
            domain = 'CurrentPaneDomain'
        },
    },
    {
    -- paneを移動する
        key = 'o',
        mods = 'CTRL',
        action = act.ActivatePaneDirection 'Next',
    },
    {
        key = '[',
        mods = 'LEADER',
        action = act.ActivateCopyMode,
    },
}

-- 表示設定(時刻, バッテリー)
wezterm.on('update-right-status', function(window, pane)
    local date = wezterm.strftime '%Y/%m/%d(%a) %H:%M:%S'
    for _, b in ipairs(wezterm.battery_info()) do
        bat = wezterm.nerdfonts.md_battery .. string.format('%.0f%%', b.state_of_charge * 100)
    end
    window:set_right_status(wezterm.format {
        { Text = bat .. '  ' .. date},
    })
end)


-- カラースキームの設定
config.color_scheme = 'tokyonight'  -- なんか青

-- font
config.font = wezterm.font('JetBrains Mono')
config.font_size = 13.0

-- 背景透過
config.window_background_opacity = 0.85

-- ファイルの最後に記述する
-- これ以降に記述したものは反映されない
return config

