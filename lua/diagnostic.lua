local virtual_text = {
  current_line = true,
  source = "if_many",
}

local virtual_lines = {
  current_line = true,
}

local using_virtual_lines = false

local function display_opts()
  if using_virtual_lines then
    return { virtual_text = false, virtual_lines = virtual_lines }
  end
  return { virtual_text = virtual_text, virtual_lines = false }
end

vim.diagnostic.config(vim.tbl_extend("force", {
  severity_sort = true,
  underline = true,
  update_in_insert = true,
  float = {
    source = "if_many",
  },
}, display_opts()))

local map = vim.keymap.set

-- Override Neovim's default open_float keymap to hide virtual text/lines
-- while the float is open, restoring them once the float window closes.
local function open_float()
  local _, winid = vim.diagnostic.open_float()
  if not winid then
    return
  end

  vim.diagnostic.config({ virtual_text = false, virtual_lines = false })
  vim.api.nvim_create_autocmd("WinClosed", {
    pattern = tostring(winid),
    once = true,
    callback = function()
      vim.diagnostic.config(display_opts())
    end,
  })
end

map("n", "<C-w>d", open_float, { desc = "Show diagnostics under the cursor" })

map("n", "<leader>dv", function()
  using_virtual_lines = not using_virtual_lines
  vim.diagnostic.config(display_opts())
end, { desc = "Toggle diagnostic virtual text/lines" })

map("n", "<leader>dt", function()
  local enabled = vim.diagnostic.is_enabled()
  vim.diagnostic.enable(not enabled)
end, { desc = "Toggle diagnostics" })

map("n", "<leader>dl", function()
  vim.diagnostic.setloclist()
end, { desc = "Send buffer diagnostics to location list" })

map("n", "<leader>dq", function()
  vim.diagnostic.setqflist()
end, { desc = "Send workspace diagnostics to quickfix list" })
