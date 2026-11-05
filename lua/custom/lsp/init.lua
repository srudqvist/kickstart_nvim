-- ============================================================
-- INITIALIZE LSP SERVERS
-- ============================================================

local servers = require 'custom.lsp.servers'

-- Mason packages to install
require('mason-tool-installer').setup {
  ensure_installed = {
    'cssls',
    'html',
    'lua_ls',
    'stylua',
    'ts_ls',
    'basedpyright',
    'gopls',
  },
}

-- Configure and enable servers
for name, server in pairs(servers) do
  vim.lsp.config(name, server)
  vim.lsp.enable(name)
end

-- Load attachment behavior
require 'custom.lsp.attach'
