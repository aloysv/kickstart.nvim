-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

local autosave_group = vim.api.nvim_create_augroup('kickstart-autosave', { clear = true })
local autosave_timer = assert((vim.uv or vim.loop).new_timer())
local pending_autosave_buf

local function can_autosave(bufnr)
  return vim.api.nvim_buf_is_valid(bufnr)
    and vim.bo[bufnr].buftype == ''
    and vim.bo[bufnr].modifiable
    and not vim.bo[bufnr].readonly
    and vim.bo[bufnr].modified
    and vim.api.nvim_buf_get_name(bufnr) ~= ''
end

local function autosave_buffer(bufnr)
  if not can_autosave(bufnr) then return end
  vim.api.nvim_buf_call(bufnr, function() vim.cmd 'silent! update' end)
end

local function schedule_autosave(bufnr, delay)
  pending_autosave_buf = bufnr
  autosave_timer:stop()
  autosave_timer:start(
    delay,
    0,
    vim.schedule_wrap(function()
      local target = pending_autosave_buf
      pending_autosave_buf = nil
      if target then autosave_buffer(target) end
    end)
  )
end

vim.api.nvim_create_autocmd({ 'TextChanged', 'TextChangedI' }, {
  desc = 'Autosave after edits settle',
  group = autosave_group,
  callback = function(args) schedule_autosave(args.buf, 1000) end,
})

vim.api.nvim_create_autocmd({ 'InsertLeave', 'BufLeave', 'FocusLost' }, {
  desc = 'Autosave immediately when leaving buffer focus',
  group = autosave_group,
  callback = function(args)
    autosave_timer:stop()
    pending_autosave_buf = nil
    autosave_buffer(args.buf)
  end,
})
