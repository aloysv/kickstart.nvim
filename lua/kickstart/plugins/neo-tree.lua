---@module 'lazy'
---@type LazySpec
return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    -- Changed from '\\' to '<leader>e'
    -- Using 'toggle' instead of 'reveal' allows the same key to close it if it's already open
    { '<leader>e', ':Neotree toggle<CR>', desc = 'NeoTree toggle', silent = true },
  },
  ---@module 'neo-tree'
  ---@type neotree.Config
  opts = {
    filesystem = {
      window = {
        mappings = {
          -- Update this so '<leader>e' also closes the window when you are inside the tree
          ['<leader>e'] = 'close_window',
        },
      },
    },
  },
}
