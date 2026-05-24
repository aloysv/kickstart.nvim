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

  {
    'iagorrr/noctishc.nvim',
    priority = 1000,
  },

  { 'zitrocode/carvion.nvim', lazy = false, priority = 1000, opts = {} },

  {
    'ficcdaf/ashen.nvim',
    -- optional but recommended,
    -- pin to the latest stable release:
    tag = '*',
    lazy = false,
    priority = 1000,
    -- configuration is optional!
    opts = {
      -- your settings here
    },
  },

  {
    'xiantang/darcula-dark.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
  },

  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000000,
    opts = {
      transparent = true,
      borderless_pickers = false,
      saturation = 0.95,
      cache = false,
      highlights = {
        TroubleNormal = { bg = 'none' },
        TroubleNormalNC = { bg = 'none' },
        WinSeparator = { fg = '#3c4048', bg = 'none' },
        IndentBlanklineChar = { fg = '#7b8496' },
        TreesitterContext = { bg = '#232429' },
        TreesitterContextLineNumber = { bg = '#232429' },
        TreesitterContextBottom = { bg = '#232429', underline = true },
        CursorLineNr = { fg = '#ffffff' },
      },
    },
    config = function(_, opts) require('cyberdream').setup(opts) end,
  },

  -- lua/plugins/rose-pine.lua
  {
    'rose-pine/neovim',
    name = 'rose-pine',
  },

  { -- Colorscheme
    'vague-theme/vague.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    config = function()
      require('vague').setup {
        italic = false,
        on_highlights = function(hl, c)
          local white = '#ffffff'
          hl.Identifier = { fg = white }
          hl['@variable'] = { fg = white }
          hl['@variable.member'] = { fg = white }
          hl['@variable.parameter'] = { fg = white }
          hl['@lsp.type.variable'] = { fg = white }
          hl['@lsp.typemod.variable.definition'] = { fg = white }
          hl['@lsp.typemod.variable.defaultLibrary'] = { fg = white }
          hl['@function.call'] = { fg = c.func }
          hl['@lsp.type.function'] = { fg = c.func }
          hl.MatchParen = { fg = white, bg = '#5f5a8a', bold = true, underline = true }
        end,
      }
    end,
  },
}
