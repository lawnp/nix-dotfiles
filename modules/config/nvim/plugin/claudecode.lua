require("claudecode").setup({
  port_range = { min = 10000, max = 65535 },
  auto_start = true,
  log_level = "info",
  terminal_cmd = nil,
  focus_after_send = false,
  track_selection = true,
  visual_demotion_delay_ms = 50,
  terminal = {
    split_side = "right",
    split_width_percentage = 0.30,
    provider = "auto",
    auto_close = true,
    snacks_win_opts = {},
    provider_opts = {
      external_terminal_cmd = nil,
    },
  },
  diff_opts = {
    auto_close_on_accept = true,
    vertical_split = true,
    open_in_current_tab = true,
    keep_terminal_focus = false,
  },
})
