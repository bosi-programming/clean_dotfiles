local wk = require("which-key")

wk.register({
  s = { ":%s/\\<<C-r><C-w>\\>/", "Substitute word under cursor" },
  cd = {":cd %:p:h<CR>", "Cd Vim to current buffer directory"},
  tt = {":tabnew<CR>", "New tab"},
  q = {":copen", "Open quickfix"},
}, { prefix = "<leader>" })

wk.register({
  yy = "which_key_ignore",
  ["<C-p>"] = "which_key_ignore",
  ["<C-n>"] = "which_key_ignore",
  ["<C-space>"] = "which_key_ignore",
  ["<CR>"] = "which_key_ignore",
}, {mode = "i"})
