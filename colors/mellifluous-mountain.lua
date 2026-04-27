if vim.g.colors_name then
  vim.cmd 'hi clear'
end

vim.g.colors_name = 'mellifluous-mountain'

require('mellifluous').setup { colorset = 'mountain' }
require('mellifluous').apply()
