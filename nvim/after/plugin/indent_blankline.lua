require("indent_blankline").setup({
  -- char = "┊",
  filetype_exclude = { "help", "packer" },
  buftype_exclude = { "terminal", "nofile" },
  char_highlihgt = "LineNr",
  show_current_context = true,
  show_current_context_start = true
})
