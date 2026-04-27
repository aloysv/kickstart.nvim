if vim.g.colors_name then
  vim.cmd 'hi clear'
end

vim.g.colors_name = 'mellifluous-kanagawa_dragon'

require('mellifluous').setup { colorset = 'kanagawa_dragon' }
require('mellifluous').apply()
