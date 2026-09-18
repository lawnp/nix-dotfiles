require("vague").setup({
  -- Don't set background
  transparent = false,
  -- Disable bold/italic globally
  bold = true,
  italic = true,

  -- Override highlights or add new highlights
  on_highlights = function(highlights, colors) end,
})
