local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.default_prog = { "/usr/bin/zsh" }

-- ==== Font ====
config.font = wezterm.font_with_fallback({
  "JetBrainsMono NF",      -- メイン
  "JetBrains Mono",        -- 念のため
})
config.font_size = 11
config.line_height = 1.05  -- 行間を少し詰めるとプロンプトがシャープに見える

-- ==== Theme ====
-- WezTerm の正しい設定キーは color_scheme
config.color_scheme = "Citrus Zest"
-- config.color_scheme = "Tokyonight Storm"

-- ==== 余白（Starship が少しゆったり見える） ====
config.window_padding = {
  left = 4,
  right = 4,
  top = 1,   --(original)4,
  bottom = 1, --(oroginal) 2,
}

-- ==== (任意) タブを見えるようにする ====
config.hide_tab_bar_if_only_one_tab = true

-- ==== Key bindings ====
local act = wezterm.action
-- ==== (任意) Fullscreen toggle ====
config.keys = {
  { key = "Enter", mods = "ALT", action = wezterm.action.ToggleFullScreen },

  -- ペイン分割（Ghostty互換）
  { key = "o", mods = "CTRL|SHIFT", action = act.SplitPane({ direction = "Right" }) },
  { key = "e", mods = "CTRL|SHIFT", action = act.SplitPane({ direction = "Down" }) },
  -- ペイン移動（Ghostty互換）
  { key = "UpArrow",    mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Up") },
  { key = "DownArrow",  mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Down") },
  { key = "LeftArrow",  mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Left") },
  { key = "RightArrow", mods = "CTRL|SHIFT", action = act.ActivatePaneDirection("Right") },
}

return config

