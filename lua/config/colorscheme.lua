local M = {}

local state_file = vim.fn.stdpath 'state' .. '/colorscheme.txt'

local function read_saved_colorscheme()
  if not (vim.uv or vim.loop).fs_stat(state_file) then return nil end
  local lines = vim.fn.readfile(state_file)
  return lines[1]
end

local function apply_colorscheme(name)
  if not name or name == '' then return false end
  return pcall(vim.cmd.colorscheme, name)
end

function M.save(name)
  if not name or name == '' then return end
  vim.fn.mkdir(vim.fn.fnamemodify(state_file, ':h'), 'p')
  vim.fn.writefile({ name }, state_file)
end

function M.setup(opts)
  opts = opts or {}
  local default = opts.default or 'default'
  local colorscheme = read_saved_colorscheme() or default

  if not apply_colorscheme(colorscheme) and colorscheme ~= default then apply_colorscheme(default) end

  vim.api.nvim_create_autocmd('VimLeavePre', {
    group = vim.api.nvim_create_augroup('persist-colorscheme', { clear = true }),
    callback = function()
      local current = vim.g.colors_name
      if current and current ~= '' then M.save(current) end
    end,
  })
end

return M
