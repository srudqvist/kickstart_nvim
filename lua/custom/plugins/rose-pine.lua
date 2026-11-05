-- rose-pine

-- vim.pack.add { 'https://github.com/windwp/nvim-autopairs' }
-- require('nvim-autopairs').setup {}

-- 'https://github.com/rose-pine/neovim.git'
vim.pack.add{'https://github.com/rose-pine/neovim'}
require('rose-pine').setup {
    -- dim_inactive_windows = true,
    disable_background = true,
    disable_float_background = true,
    disable_italics = false, -- optional
    highlight_groups = {
      -- Comment = { fg = 'subtle', bg = 'muted' },
      Normal = { bg = 'none' },
      NormalNC = { bg = 'none' },
      Comment = { fg = 'subtle' },
      LineNr = { fg = 'muted' },
      -- CursorLineNr = { fg = 'foam' },
      CursorLineNr = { fg = '#00a19b' },
      VertSplit = { fg = 'muted', bg = 'muted' },
      StatusLine = { fg = 'iris', bg = 'none' },
      StatusLineNC = { fg = 'pine', bg = 'none' },
      WinBar = { bg = 'none' },
      WinBarNC = { bg = 'none' },
      Visual = { bg = 'iris' },
      -- PmenuSel = { bg = 'love' },
      PmenuSel = { bg = '#00a19b' },
      -- FloatBorder = { fg = 'muted', bg = 'love' },
      -- NormalFloat = { bg = 'surface' },
      -- DiagnosticError = { fg = 'love' },
    },
}

