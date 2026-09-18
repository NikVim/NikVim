---@type vim.lsp.Config
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    { ".emmyrc.json", ".luarc.json", ".luarc.jsonc" },
    { ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml" },
    { ".git" },
  },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false, library = { vim.env.VIMRUNTIME } },
      telemetry = { enable = false },
      codeLens = { enable = true },
      hint = {
        enable = true,
        semicolon = "Disable",
        arrayIndex = "Disable",
      },
    },
  },
}
