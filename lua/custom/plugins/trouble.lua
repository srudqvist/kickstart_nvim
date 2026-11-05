vim.pack.add {
  { src = 'https://github.com/folke/trouble.nvim' },
  -- { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
}

require('trouble').setup {
  auto_preview = true,
}

-- Diagnostics
vim.keymap.set('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<CR>', {
  desc = 'Diagnostics (Trouble)',
})

vim.keymap.set('n', '<leader>xX', '<cmd>Trouble diagnostics toggle filter.buf=0<CR>', {
  desc = 'Buffer Diagnostics (Trouble)',
})

-- Symbols
vim.keymap.set('n', '<leader>cs', '<cmd>Trouble symbols toggle focus=false<CR>', {
  desc = 'Symbols (Trouble)',
})

-- LSP
vim.keymap.set('n', '<leader>cl', '<cmd>Trouble lsp toggle focus=false win.position=right<CR>', {
  desc = 'LSP Definitions / references / ... (Trouble)',
})

-- Lists
vim.keymap.set('n', '<leader>xL', '<cmd>Trouble loclist toggle<CR>', {
  desc = 'Location List (Trouble)',
})

vim.keymap.set('n', '<leader>xQ', '<cmd>Trouble qflist toggle<CR>', {
  desc = 'Quickfix List (Trouble)',
})
