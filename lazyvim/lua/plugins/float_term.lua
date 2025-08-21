local term_state = {
  buf_id = -1,
  win_id = -1,
}

local function create_floating_window(buf_id)
  -- Creates a window with previously created terminal buffer
  local width = vim.api.nvim_win_get_width(0)
  local height = vim.api.nvim_win_get_height(0)

  -- Calculate the size of the floating window (e.g., 80% of the current window)
  local win_width = math.floor(width * 0.8)
  local win_height = math.floor(height * 0.8)

  -- Calculate the position to center the floating window
  local row = math.floor((height - win_height) / 2)
  local col = math.floor((width - win_width) / 2)

  -- Create a new floating window
  term_state.win_id = vim.api.nvim_open_win(buf_id, true, {
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col,
    style = "minimal",
    border = "single",
  })
end

local function toggle_floating_terminal()
  if vim.api.nvim_buf_is_valid(term_state.buf_id) == false then
    -- Creates a buffer to the terminal
    term_state.buf_id = vim.api.nvim_create_buf(false, true)
  end

  if vim.api.nvim_win_is_valid(term_state.win_id) == false then
    create_floating_window(term_state.buf_id)
    if vim.bo[term_state.buf_id].buftype ~= "terminal" then
      vim.cmd.terminal("nu")
    end
    vim.api.nvim_command("startinsert")
  else
    vim.api.nvim_win_hide(term_state.win_id)
  end
end

vim.api.nvim_create_user_command("Floaterm", toggle_floating_terminal, {})
-- this is returned because lazyvim expects an plugin spec here
return {}
