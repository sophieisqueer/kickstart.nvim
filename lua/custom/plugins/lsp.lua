---@type table<string, vim.lsp.Config>
local servers = {
  rust_analyser = {},

  hls = {
    filetypes = { 'haskell', 'lhaskell'},
  },

  markdownlint_cli2 = {},

  tsgo = {},

  prettierd = {},
}


for name, server in pairs(servers) do
  vim.lsp.config(name, server)
  -- if name == 'ltex-plus' then return end
  vim.lsp.enable(name)
end

