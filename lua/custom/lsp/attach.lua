-- ============================================================
-- ATTACH LSP SERVERS
-- ============================================================

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if client and client.name == 'roslyn' and client.server_capabilities.inlayHintProvider then
      local bufnr = event.buf

      -- Enable inlay hints automatically
      vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })

      -- Toggle inlay hints
      vim.keymap.set('n', '<leader>th', function()
        local enabled = vim.lsp.inlay_hint.is_enabled {
          bufnr = bufnr,
        }

        vim.lsp.inlay_hint.enable(not enabled, {
          bufnr = bufnr,
        })
      end, {
        buffer = bufnr,
        desc = 'LSP: [T]oggle Inlay [H]ints',
      })
    end
  end,
})
