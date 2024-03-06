local wk = require("which-key")
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

wk.register({
  ["h"] = {
    name = " Harpoon",
    a = { function() mark.add_file() end, "Add file to harpoon" },
    e = { function() ui.toggle_quick_menu() end, "Toggle harpoon menu" },
    ["1"] = { function() ui.nav_file(1) end, "Navigate to file 1" },
    ["2"] = { function() ui.nav_file(2) end, "Navigate to file 2" },
    ["3"] = { function() ui.nav_file(3) end, "Navigate to file 3" },
    ["4"] = { function() ui.nav_file(4) end, "Navigate to file 4" },
  }
}, { prefix = "<leader>" })
