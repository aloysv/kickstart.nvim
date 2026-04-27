if vim.g.colors_name then
  vim.cmd 'hi clear'
end

vim.g.colors_name = 'mellifluous-tender'

require('mellifluous').setup { colorset = 'tender' }
require('mellifluous').apply()
