return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      size = 20, -- Height for horizontal terminal
      open_mapping = [[<C-\>]], -- Default key to toggle
      shade_terminals = true,
      direction = 'float', -- Options: 'vertical' | 'horizontal' | 'tab' | 'float'
      float_opts = {
        border = 'curved', -- 'single', 'double', 'shadow', 'curved'
      },
    }

    -- Keymaps
    vim.keymap.set('n', '<leader>tth', '<cmd>ToggleTerm direction=horizontal<CR>', { desc = 'Toggle horizontal terminal' })
    vim.keymap.set('n', '<leader>ttv', '<cmd>ToggleTerm direction=vertical<CR>', { desc = 'Toggle vertical terminal' })
    vim.keymap.set('n', '<leader>ttf', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Toggle float terminal' })
  end,
}
