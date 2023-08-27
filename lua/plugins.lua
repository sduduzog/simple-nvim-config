return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-frappe"
    end
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'L3MON4D3/LuaSnip' },     -- Required
      { 'lukas-reineke/lsp-format.nvim' }

    },
    config = function()
      local lsp = require("lsp-zero").preset({
        name = 'recommended'
      })

      local lspconfig = require("lspconfig")

      lsp.ensure_installed({
        'lua_ls',
        'eslint',
        'volar'
      })


      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })

        if client.supports_method('textDocument/formatting') then
          require('lsp-format').on_attach(client)
        end
      end)

      lspconfig.eslint.setup({
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })

      lspconfig.volar.setup({
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json' },
      })

      lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

      lsp.setup()
    end
  }
}
