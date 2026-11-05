-- ============================================================
-- LSP SERVERS
-- ============================================================

return {
  -- CSS
  cssls = {
    filetypes = { 'css', 'scss', 'razor', 'html' },
  },

  -- HTML
  html = {
    filetypes = { 'html', 'cshtml', 'razor' },
  },

  -- JS, TS, REACT
  ts_ls = {
    filetypes = {
      'javascript',
      'javascriptreact',
      'typescript',
      'typescriptreact',
    },
  },

  -- Lua
  lua_ls = {
    on_init = function(client)
      client.server_capabilities.documentFormattingProvider = false -- Disable formatting (formatting is done by stylua)

      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then return end
      end

      local current_settings = client.config.settings --[[@as lspconfig.settings.lua_ls]]
      client.config.settings.Lua = vim.tbl_deep_extend('force', current_settings.Lua, {
        runtime = {
          version = 'LuaJIT',
          path = { 'lua/?.lua', 'lua/?/init.lua' },
        },
        workspace = {
          checkThirdParty = false,
          -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
          --  See https://github.com/neovim/nvim-lspconfig/issues/3189
          library = vim.api.nvim_get_runtime_file('', true),
        },
      })
    end,
    ---@type lspconfig.settings.lua_ls
    settings = {
      Lua = {
        format = { enable = false }, -- Disable formatting (formatting is done by stylua)
      },
    },
  },

  -- C#
  roslyn = {
    cmd_env = {
      DOTNET_ROOT = '/opt/homebrew/opt/dotnet/libexec',
      PATH = '/opt/homebrew/opt/dotnet/libexec:' .. vim.env.PATH,
    },

    root_markers = {
      'Portal.api.sln',
      '*.sln',
      '*.csproj',
    },

    settings = {
      ['csharp|inlay_hints'] = {
        csharp_enable_inlay_hints_for_implicit_object_creation = true,
        csharp_enable_inlay_hints_for_implicit_variable_types = true,
        csharp_enable_inlay_hints_for_lambda_parameter_types = true,
        csharp_enable_inlay_hints_for_types = true,

        dotnet_enable_inlay_hints_for_parameters = true,
        dotnet_enable_inlay_hints_for_literal_parameters = true,
        dotnet_enable_inlay_hints_for_object_creation_parameters = true,
        dotnet_enable_inlay_hints_for_other_parameters = true,

        dotnet_organize_imports_on_format = true,
      },
    },
  },

  -- DART, FLUTTER
  dartls = {
    cmd = { 'dart', 'language-server', '--protocol=lsp' },
    filetypes = { 'dart' },
    init_options = {
      closingLabels = true,
      flutterOutline = true,
      onlyAnalyzeProjectsWithOpenFiles = true,
      suggestFromUnimportedLibraries = true,
    },
  },

  -- PYTHON
  basedpyright = {},

  -- GO
  gopls = {},
}
