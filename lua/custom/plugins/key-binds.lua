-- keybinds

-- vim.pack.add { 'https://github.com/windwp/nvim-autopairs' }
-- require('nvim-autopairs').setup {}

-- Window management
vim.keymap.set('n', '<leader>sv', '<C-w>v') -- split window vertically
vim.keymap.set('n', '<leader>sb', '<C-w>s') -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=') -- make split windows equal width
vim.keymap.set('n', '<leader>sx', ':close<CR>') -- close current split window

-- UndotreeToggle
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)

-- Maximizer toggle
vim.keymap.set('n', '<leader>sm', '<cmd>MaximizerToggle<CR>', {
  desc = 'Maximize/Restore Window',
})

-- Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('n', '<leader>td', function()
  local bufnr = vim.api.nvim_get_current_buf()
  local enabled = vim.diagnostic.is_enabled { bufnr = bufnr }

  vim.diagnostic.enable(not enabled, { bufnr = bufnr })
end, { desc = 'Toggle Diagnostics' })
