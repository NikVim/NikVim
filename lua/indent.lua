local opt = vim.opt
local map = vim.keymap.set

-- Global defaults
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftround = true
opt.smartindent = true

-- Keep selection after shifting indentation
map("x", "<", "<gv", { desc = "Shift left" })
map("x", ">", ">gv", { desc = "Shift right" })

-- Per-filetype overrides, keyed by filetype so adding one is a one-line addition
local overrides = {
  lua = { expandtab = true, shiftwidth = 2, tabstop = 2, softtabstop = 2 },
  make = { expandtab = false },
}

local augroup = vim.api.nvim_create_augroup("nikvim_indent", {})

vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = vim.tbl_keys(overrides),
  callback = function(args)
    for name, value in pairs(overrides[vim.bo[args.buf].filetype]) do
      vim.bo[args.buf][name] = value
    end
  end,
})
