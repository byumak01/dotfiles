local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.colors = {
  foreground = "#d4d4d4",
  background = "#1e1e1e",
  cursor_bg = "#d4d4d4",
  cursor_fg = "#1e1e1e",
  cursor_border = "#d4d4d4",
  selection_fg = "#d4d4d4",
  selection_bg = "#264f78",
  scrollbar_thumb = "#333333",
  split = "#333333",
  compose_cursor = "#cca700",

  ansi = {
    "#1e1e1e", -- black   (bg)
    "#f44747", -- red     (error)
    "#6a9955", -- green   (comment/hint)
    "#cca700", -- yellow  (warn)
    "#569cd6", -- blue    (accent)
    "#c586c0", -- magenta (accent2)
    "#3794ff", -- cyan    (info)
    "#d4d4d4", -- white   (fg)
  },
  brights = {
    "#808080", -- bright black  (fg_dim)
    "#f44747", -- bright red
    "#6a9955", -- bright green
    "#cca700", -- bright yellow
    "#569cd6", -- bright blue
    "#c586c0", -- bright magenta
    "#3794ff", -- bright cyan
    "#ffffff", -- bright white
  },

  tab_bar = {
    background = "#252526",
    active_tab = {
      bg_color = "#1e1e1e",
      fg_color = "#d4d4d4",
      intensity = "Bold",
    },
    inactive_tab = {
      bg_color = "#252526",
      fg_color = "#808080",
    },
    inactive_tab_hover = {
      bg_color = "#2d2d2d",
      fg_color = "#d4d4d4",
    },
    new_tab = {
      bg_color = "#252526",
      fg_color = "#808080",
    },
    new_tab_hover = {
      bg_color = "#2d2d2d",
      fg_color = "#d4d4d4",
    },
  },
}

config.font = wezterm.font_with_fallback({
  { family = "JetBrains Mono", weight = "Medium" },
  { family = "Cascadia Code",  weight = "Regular" },
  "Consolas",
})
config.font_size = 14.0
config.line_height = 1.15
config.cell_width = 1.0

config.window_background_opacity = 1.0
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_style = "Windows"
config.window_padding = {
  left   = 12,
  right  = 12,
  top    = 8,
  bottom = 8,
}
config.initial_cols = 100
config.initial_rows = 25

config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_max_width = 32
config.show_tab_index_in_tab_bar = false
config.switch_to_last_active_tab_when_closing_tab = true

config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.force_reverse_video_cursor = false

config.scrollback_lines = 10000
config.enable_scroll_bar = true

config.audible_bell = "Disabled"

config.default_prog = { "powershell.exe" }

config.launch_menu = {
  { label = "PowerShell",       args = { "powershell.exe" } },
  { label = "CMD",              args = { "cmd.exe" } },
  { label = "Git Bash",         args = { "C:/Program Files/Git/bin/bash.exe", "-l" } },
  { label = "Ubuntu (WSL)",  args = { "wsl.exe", "-d", "Ubuntu" } },
}

config.keys = {
  { key = "Space", mods = "CTRL|SHIFT", action = wezterm.action.ShowLauncher },
  { key = "x",    mods = "CTRL|SHIFT", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "z",     mods = "CTRL|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "h",     mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Left") },
  { key = "j",     mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Down") },
  { key = "k",     mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Up") },
  { key = "l",     mods = "CTRL|SHIFT", action = wezterm.action.ActivatePaneDirection("Right") },
  { key = "w",     mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = true }) },
  { key = "t",     mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("CurrentPaneDomain") },
  { key = "=",     mods = "CTRL",       action = wezterm.action.IncreaseFontSize },
  { key = "-",     mods = "CTRL",       action = wezterm.action.DecreaseFontSize },
  { key = "0",     mods = "CTRL",       action = wezterm.action.ResetFontSize },
}

config.mouse_bindings = {
  {
    event = { Down = { streak = 1, button = "Right" } },
    mods = "NONE",
    action = wezterm.action.PasteFrom("Clipboard"),
  },
}

config.front_end = "WebGpu"
config.webgpu_power_preference = "HighPerformance"
config.max_fps = 160
config.animation_fps = 60

return config
