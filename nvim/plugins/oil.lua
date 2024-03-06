local wk = require("which-key")
local oil = require("oil")

oil.setup({
  columns = {
    "icon",
  },
  skip_confirm_for_simple_edits = true,
  float = {
    max_width = 80,
    max_height = 40,
  },
  preview = {
    max_width = 0.5,
    max_height = 0.5,
  },
  view_options = {
    show_hidden = true,
  }
})

wk.register({
  name = ' Oil - Explorer',
  e = { function() oil.open_float() end, 'Open file explorer on float' },
  o = { function() oil.open() end, 'Open file explorer on tab' },
}, { prefix = "<leader>" })
