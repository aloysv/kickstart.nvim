if vim.g.colors_name then
  vim.cmd 'hi clear'
end

vim.g.colors_name = 'mellifluous-alduin'

require('mellifluous').setup { colorset = 'alduin' }
require('mellifluous').apply()
