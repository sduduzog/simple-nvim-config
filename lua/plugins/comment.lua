return {
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
        mappings = {
          basic = false,
          extra = false
        },
      }

      vim.keymap.set('n', '<leader>/', function()
        local toggle_current_line = '<Plug>(comment_toggle_linewise_current)j'
        local toggle_count_lines = '<Plug>(comment_toggle_linewise_count)' .. vim.v.count .. 'j'
        return vim.v.count == 0 and toggle_current_line
            or toggle_count_lines
      end, { expr = true })
    end
  }
}
