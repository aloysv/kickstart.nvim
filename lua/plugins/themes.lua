return {
  {
    'wtfox/jellybeans.nvim',
    priority = 1000,
    opts = {},
  },

  {
    'nickkadutskyi/jb.nvim',
    priority = 1000,
  },

  {
    'oskarnurm/koda.nvim',
    priority = 1000,
  },

  { -- Colorscheme
    'vague-theme/vague.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('vague').setup {
        italic = false,
        on_highlights = function(hl, _)
          local white = '#ffffff'
          hl.Identifier = { fg = white }
          hl['@variable'] = { fg = white }
          hl['@variable.member'] = { fg = white }
          hl['@variable.parameter'] = { fg = white }
          hl['@lsp.type.variable'] = { fg = white }
          hl['@lsp.typemod.variable.definition'] = { fg = white }
          hl['@lsp.typemod.variable.defaultLibrary'] = { fg = white }
        end,
      }
      vim.cmd.colorscheme 'vague'
    end,
  },
}
