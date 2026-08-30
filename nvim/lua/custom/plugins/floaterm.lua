-- Inspired by https://github.com/tjdevries/advent-of-nvim/blob/master/nvim/plugin/floaterminal.lua

local max_terminals = 9
local tabline_namespace = vim.api.nvim_create_namespace 'floaterm-tabline'

local state = {
  floating = {
    frame = -1,
    win = -1,
  },
  terminals = {},
  current = 0,
  next_id = 1,
}

local function prune_terminals()
  local terminals = {}

  for _, buf in ipairs(state.terminals) do
    if vim.api.nvim_buf_is_valid(buf) then table.insert(terminals, buf) end
  end

  state.terminals = terminals
  state.current = math.min(state.current, #terminals)
end

local function update_tabline()
  if not vim.api.nvim_win_is_valid(state.floating.frame) then return end

  local labels = {}
  for index in ipairs(state.terminals) do
    table.insert(labels, string.format(' %d ', index))
  end

  local buf = vim.api.nvim_win_get_buf(state.floating.frame)
  local line = table.concat(labels, ' ')
  vim.bo[buf].modifiable = true
  vim.api.nvim_buf_set_lines(buf, 0, 1, false, { line })
  vim.bo[buf].modifiable = false

  vim.api.nvim_buf_clear_namespace(buf, tabline_namespace, 0, -1)

  local col = 0
  for index, label in ipairs(labels) do
    vim.api.nvim_buf_set_extmark(buf, tabline_namespace, 0, col, {
      end_col = col + #label,
      hl_group = index == state.current and 'TabLineSel' or 'TabLine',
    })
    col = col + #label + 1
  end
end

local function create_terminal()
  prune_terminals()
  if #state.terminals >= max_terminals then
    vim.notify(string.format('Floaterm supports up to %d terminals', max_terminals), vim.log.levels.WARN)
    return nil
  end

  local buf = vim.api.nvim_create_buf(false, true)
  vim.bo[buf].bufhidden = 'hide'
  vim.api.nvim_buf_set_name(buf, string.format('floaterm://%d', state.next_id))
  state.next_id = state.next_id + 1

  vim.api.nvim_buf_call(buf, function()
    local job = vim.fn.jobstart(vim.o.shell, { term = true })
    if job <= 0 then error 'Failed to start terminal shell' end
  end)

  table.insert(state.terminals, buf)
  state.current = #state.terminals
  return buf
end

local function create_floating_window(buf)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  local frame_buf = vim.api.nvim_create_buf(false, true)
  vim.bo[frame_buf].bufhidden = 'wipe'
  vim.bo[frame_buf].modifiable = false

  local frame = vim.api.nvim_open_win(frame_buf, false, {
    relative = 'editor',
    width = width,
    height = height,
    col = col,
    row = row,
    style = 'minimal',
    border = 'rounded',
    focusable = false,
    zindex = 49,
  })

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'win',
    win = frame,
    width = width,
    height = height - 2,
    col = 0,
    row = 2,
    style = 'minimal',
    zindex = 50,
  })

  vim.wo[frame].winhighlight = 'Normal:TabLineFill'
  state.floating.frame = frame
  state.floating.win = win
  update_tabline()
end

local function hide_floating_window()
  if vim.api.nvim_win_is_valid(state.floating.win) then vim.api.nvim_win_hide(state.floating.win) end
  if vim.api.nvim_win_is_valid(state.floating.frame) then vim.api.nvim_win_hide(state.floating.frame) end
  state.floating.win = -1
  state.floating.frame = -1
end

local function show_terminal(buf)
  if vim.api.nvim_win_is_valid(state.floating.win) then
    vim.api.nvim_set_current_win(state.floating.win)
    vim.api.nvim_win_set_buf(state.floating.win, buf)
    update_tabline()
  else
    create_floating_window(buf)
  end
end

local function switch_terminal(index)
  prune_terminals()
  local buf = state.terminals[index]
  if not buf then
    vim.notify(string.format('Floaterm %d does not exist', index), vim.log.levels.WARN)
    return
  end

  state.current = index
  show_terminal(buf)
end

local function new_terminal()
  local buf = create_terminal()
  if buf then show_terminal(buf) end
end

local function delete_terminal()
  prune_terminals()
  local buf = state.terminals[state.current]
  if not buf then return end

  table.remove(state.terminals, state.current)

  if #state.terminals == 0 then
    hide_floating_window()
    state.current = 0
  else
    state.current = math.min(state.current, #state.terminals)
    show_terminal(state.terminals[state.current])
  end

  vim.api.nvim_buf_delete(buf, { force = true })
end

local function cycle_terminal(offset)
  prune_terminals()
  if #state.terminals == 0 then
    new_terminal()
    return
  end

  local index = ((state.current - 1 + offset) % #state.terminals) + 1
  switch_terminal(index)
end

local function toggle_terminal()
  if vim.api.nvim_win_is_valid(state.floating.win) then
    hide_floating_window()
    return
  end

  prune_terminals()
  if #state.terminals == 0 then
    new_terminal()
  else
    switch_terminal(math.max(state.current, 1))
  end
end

local function preserve_terminal_mode(callback)
  return function()
    local terminal_mode = vim.api.nvim_get_mode().mode == 't'
    if terminal_mode then vim.cmd.stopinsert() end
    callback()
    if terminal_mode and vim.bo.buftype == 'terminal' then vim.cmd.startinsert() end
  end
end

vim.api.nvim_create_user_command('Floaterm', toggle_terminal, {})
vim.api.nvim_create_user_command('FloatermNew', new_terminal, {})
vim.api.nvim_create_user_command('FloatermDelete', delete_terminal, {})
vim.api.nvim_create_user_command('FloatermNext', function() cycle_terminal(1) end, {})
vim.api.nvim_create_user_command('FloatermPrevious', function() cycle_terminal(-1) end, {})

vim.keymap.set({ 'n', 't' }, '<leader>mn', preserve_terminal_mode(new_terminal), { desc = 'Create a new floating terminal' })
vim.keymap.set({ 'n', 't' }, '<leader>mx', preserve_terminal_mode(delete_terminal), { desc = 'Delete the current floating terminal' })
vim.keymap.set({ 'n', 't' }, '<leader>m]', preserve_terminal_mode(function() cycle_terminal(1) end), { desc = 'Next floating terminal' })
vim.keymap.set({ 'n', 't' }, '<leader>m[', preserve_terminal_mode(function() cycle_terminal(-1) end), { desc = 'Previous floating terminal' })

for index = 1, max_terminals do
  vim.keymap.set(
    { 'n', 't' },
    '<leader>m' .. index,
    preserve_terminal_mode(function() switch_terminal(index) end),
    { desc = string.format('Switch to floating terminal %d', index) }
  )
end
