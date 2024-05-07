return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    lazy = false,
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },

    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()

      -- Document existing key chains
      require('which-key').register {
        ['<leader>f'] = { name = '[F]ind', _ = 'which_key_ignore' },
        ['<leader>d'] = { name = '[D]ebug', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[T]est', _ = 'which_key_ignore' },
        ['<leader>a'] = { name = '[A]ction', _ = 'which_key_ignore' },
        ['<leader>g'] = { name = '[G]oto', _ = 'which_key_ignore' },
        ['<leader>c'] = { name = '[S]how', _ = 'which_key_ignore' },
        --['<leader>l'] = { name = '[L]ist', _ = 'which_key_ignore' },

        --[[
            ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
        ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
        ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
        ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
        ]]
      }
    end,
  },
}
