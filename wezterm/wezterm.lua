local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

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

