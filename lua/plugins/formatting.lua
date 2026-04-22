return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function() require('conform').format { async = true } end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    ---@module 'conform'
    ---@type conform.setupOpts
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        if vim.bo[bufnr].buftype ~= '' or not vim.bo[bufnr].modifiable then return nil end
        return {
          timeout_ms = 1000,
          lsp_format = 'fallback',
        }
      end,
      default_format_opts = {
        lsp_format = 'fallback', -- Use external formatters if configured below, otherwise use LSP formatting. Set to `false` to disable LSP formatting entirely.
      },
      -- You can also specify external formatters in here.
      formatters_by_ft = {
        lua = { 'stylua' },
        c = { 'clang-format' },
        cmake = { 'cmake_format' },
        cpp = { 'clang-format' },
        python = { 'ruff_organize_imports', 'ruff_format' },
        sh = { 'shfmt' },
        bash = { 'shfmt' },
        zsh = { 'shfmt' },
        rust = { 'rustfmt' },
        go = { 'goimports', 'gofumpt' },
        make = { 'bake' },
        asm = { 'asmfmt' },
      },
      formatters = {
        ['clang-format'] = {
          prepend_args = { '--style=file' },
        },
        cmake_format = {
          command = 'cmake-format',
        },
        bake = {
          command = 'mbake',
        },
      },
    },
  },
}
