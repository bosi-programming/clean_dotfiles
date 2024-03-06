local wk = require("which-key")
local builtin = require('telescope.builtin')

wk.register({
  name = "Find",
  ["<c-f>"] = { builtin.find_files, "Find files" },
  ["<c-g>"] = { builtin.git_files, "Find git files" },
  ["<c-gg>"] = { builtin.live_grep, "Live grep" }
})
