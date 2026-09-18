local augroup = vim.api.nvim_create_augroup("nikvim", {})

-- Briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup,
  callback = function()
    vim.hl.hl_op()
  end,
})

-- Restore cursor to last known position when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
  group = augroup,
  callback = function(args)
    local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
    local line_count = vim.api.nvim_buf_line_count(args.buf)
    if mark[1] > 0 and mark[1] <= line_count then
      vim.api.nvim_win_set_cursor(0, mark)
    end
  end,
})

-- Keep splits evenly sized when the window is resized
vim.api.nvim_create_autocmd("VimResized", {
  group = augroup,
  command = "wincmd =",
})

-- Create missing parent directories before writing a file
vim.api.nvim_create_autocmd("BufWritePre", {
  group = augroup,
  callback = function(args)
    local dir = vim.fn.fnamemodify(args.match, ":p:h")
    vim.fn.mkdir(dir, "p")
  end,
})

-- Reload buffers changed on disk outside of Neovim
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  group = augroup,
  command = "checktime",
})

-- Close utility/read-only buffers with q
vim.api.nvim_create_autocmd("FileType", {
  group = augroup,
  pattern = { "help", "qf", "man", "lspinfo", "checkhealth" },
  callback = function(args)
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = args.buf, silent = true })
  end,
})
