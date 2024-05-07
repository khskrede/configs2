return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      -- Installs the debug adapters for you
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',

      -- Dap UI
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',

      -- Dap language plugins
      'mfussenegger/nvim-dap-python',
    },
    config = function()
      local dap = require 'dap'

      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = '[D]ebug [B]reakpoint toggle' })
      vim.keymap.set('n', '<leader>ds', function()
        dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
      end, { desc = '[D]ebug [S]et Breakpoint' })

      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[D]ebug [C]ontinue' })

      -- vim.fn.sign_define('DapBreakpoint', { text = '🛑', texthl = '', linehl = '', numhl = '' })

      -- Dap virtual text setup
      require('nvim-dap-virtual-text').setup {}

      -- Dap UI setup
      local dapui = require 'dapui'
      dapui.setup()

      vim.keymap.set('n', '<leader>dt', dapui.toggle, { desc = '[D]ebugUi [T]oggle' })

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      --[[ Dont auto close
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      ]]

      -- Setup language

      local dappython = require 'dap-python'
      dappython.test_runner = 'pytest'
      dappython.setup 'python'
    end,
  },
}
