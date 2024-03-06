local wk = require("which-key")

function _G.set_terminal_keymaps()
  local buffer = 0
  wk.register({
    ["<esc>"] = { [[<C-\><C-n>]], "which_key_ignore" },
    ["<C-h>"] = { [[<Cmd>wincmd h<CR>]], "which_key_ignore" },
    ["<C-j>"] = { [[<Cmd>wincmd j<CR>]], "which_key_ignore" },
    ["<C-k>"] = { [[<Cmd>wincmd k<CR>]], "which_key_ignore" },
    ["<C-l>"] = { [[<Cmd>wincmd l<CR>]], "which_key_ignore" },
    ["<C-w>"] = { [[<C-\><C-n><C-w>]], "which_key_ignore" },
  }, { mode = "t", buffer = buffer })
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

wk.register({
  name = "Terminal",
  t1 = { [[<Cmd>lua require('toggleterm').toggle()<CR>]], "Toggle terminal" },
  t2 = { [[<Cmd>lua require('toggleterm').toggle(2)<CR>]], "Toggle terminal" },
  ta = { [[<Cmd>lua require('toggleterm').toggle_all()<CR>]], "Toggle all terminals" },
}, { prefix = "<leader>" })
