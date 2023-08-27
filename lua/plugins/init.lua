return {
  {
    'folke/which-key.nvim',
    opts = {}
  },
  {
    'max397574/better-escape.nvim',
    event = 'InsertEnter',
    config = function()
      require('better_escape').setup()
    end,
  },
  { 'jiangmiao/auto-pairs' },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {
          'lua',
          'typescript',
          'vue'
        },
        hightlight = {
          enable = true
        },
        context_commentstring = {
          enable = true
        }
      }
    end
  },

}
