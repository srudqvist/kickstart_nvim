-- ============================================================
-- HARPOON
-- ============================================================

do
  -- vim.pack.add {
  --   gh 'ThePrimeagen/harpoon',
  -- }

  vim.pack.add{'https://github.com/ThePrimeagen/harpoon'}

  require('harpoon').setup {
    global_settings = {
      enter_on_sendcmd = true,
    },
  }

  vim.keymap.set('n', '<leader>a', function()
    require('harpoon.mark').add_file()
  end, { desc = 'Harpoon: Add file' })

  vim.keymap.set('n', '<leader>h', function()
    require('harpoon.ui').toggle_quick_menu()
  end, { desc = 'Harpoon: Open menu' })

  for i = 1, 8 do
    vim.keymap.set('n', '<leader>' .. i, function()
      require('harpoon.ui').nav_file(i)
    end, { desc = 'Harpoon: Go to file ' .. i })
  end
end
