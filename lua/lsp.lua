vim.lsp.enable({ "lua_ls" })

-- Off by default, matching Neovim's own posture; toggled per buffer below
local codelens_enabled = false
local inlay_hints_enabled = false

local augroup = vim.api.nvim_create_augroup("nikvim_lsp", {})

vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup,
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    if client:supports_method("textDocument/codeLens") then
      vim.keymap.set("n", "grl", function()
        codelens_enabled = not codelens_enabled
        vim.lsp.codelens.enable(codelens_enabled, { bufnr = args.buf })
      end, { buffer = args.buf, desc = "Toggle codelens" })
    end

    if client:supports_method("textDocument/inlayHint") then
      vim.keymap.set("n", "grh", function()
        inlay_hints_enabled = not inlay_hints_enabled
        vim.lsp.inlay_hint.enable(inlay_hints_enabled, { bufnr = args.buf })
      end, { buffer = args.buf, desc = "Toggle inlay hints" })
    end
  end,
})
