local wk = require("which-key")
local hop = require('hop')
local directions = require('hop.hint').HintDirection

wk.register({
  name = ' Hop',
  s = { function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false }) end, 'Hop to letter after cursor' },
  S = { function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false }) end, 'Hop to letter before cursor' },
})

wk.register({
  name = ' Hop',
  s = { function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = false }) end, 'Hop to letter after cursor' },
  S = { function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = false }) end, 'Hop to letter before cursor' },
}, { mode = 'v' })
