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
    'ramojus/mellifluous.nvim',
    priority = 1000,
    config = function()
      local colorsets = { 'mellifluous', 'alduin', 'mountain', 'tender', 'kanagawa_dragon' }

      vim.api.nvim_create_user_command('MellifluousVariant', function(opts)
        require('mellifluous').setup { colorset = opts.args }
        vim.cmd.colorscheme 'mellifluous'
      end, {
        nargs = 1,
        complete = function(arg_lead)
          return vim.tbl_filter(function(colorset) return vim.startswith(colorset, arg_lead) end, colorsets)
        end,
      })
    end,
  },

  -- lua/plugins/rose-pine.lua
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    config = function() vim.cmd 'colorscheme rose-pine' end,
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
      vim.cmd.colorscheme 'vague'
    end,
  },
}
