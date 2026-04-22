return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    ft = { 'rust' },
    dependencies = { 'saghen/blink.cmp' },
    init = function()
      vim.g.rustaceanvim = {
        server = {
          capabilities = require('blink.cmp').get_lsp_capabilities(),
          settings = {
            ['rust-analyzer'] = {
              procMacro = { enable = true },
              cargo = {
                buildScripts = { enable = true },
                features = 'all',
              },
              diagnostics = {
                enable = true,
                experimental = { enable = true },
              },
              check = {
                command = 'clippy',
                extraArgs = { '--no-deps' },
              },
            },
          },
        },
      }
    end,
  },
}
