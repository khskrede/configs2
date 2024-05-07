return {
  'nvim-neotest/neotest',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'nvim-lua/plenary.nvim',
    'antoinemadec/FixCursorHold.nvim',
    'nvim-treesitter/nvim-treesitter',

    -- languages
    'nvim-neotest/neotest-python',
    'mrcjkb/rustaceanvim',
    'stevanmilic/neotest-scala',
    'mrcjkb/neotest-haskell',
  },
  config = function()
    local neotest = require 'neotest'

    neotest.setup {
      adapters = {
        require 'neotest-python' {
          dap = { justMyCode = false },
        },
        require 'rustaceanvim.neotest',
        require 'neotest-scala',
        require 'neotest-haskell' {
          -- Default: Use stack if possible and then try cabal
          build_tools = { 'stack', 'cabal' },
          -- Default: Check for tasty first and then try hspec
          frameworks = { 'tasty', 'hspec', 'sydtest' },
        },
      },
    }

    local run_single_test = function()
      --neotest.output_panel.open()
      neotest.run.run()
      neotest.summary.open()
    end

    local run_all_tests_in_file = function()
      --neotest.output_panel.open()
      neotest.run.run(vim.fn.expand '%')
      neotest.summary.open()
    end

    local run_all_tests_in_cwd = function()
      --neotest.output_panel.open()
      neotest.run.run(vim.fn.getcwd())
      neotest.summary.open()
    end

    local test_context_close = function()
      --neotest.output_panel.close()
      neotest.summary.close()
    end

    local test_context_open = function()
      --neotest.output_panel.open()
      neotest.summary.open()
    end

    local test_context_toggle = function()
      --neotest.output_panel.toggle()
      neotest.summary.toggle()
    end

    vim.keymap.set('n', '<leader>tr', run_single_test, { desc = '[T]est [R]un' })
    vim.keymap.set('n', '<leader>tf', run_all_tests_in_file, { desc = '[T]est [F]ile' })
    vim.keymap.set('n', '<leader>ta', run_all_tests_in_cwd, { desc = '[T]est [A]ll' })
    vim.keymap.set('n', '<leader>tc', test_context_close, { desc = '[T]estUi [C]lose' })
    vim.keymap.set('n', '<leader>to', test_context_open, { desc = '[T]estUi [O]pen' })
    vim.keymap.set('n', '<leader>tt', test_context_toggle, { desc = '[T]estUi [T]oggle' })

    -- Debug current test
    local run_current_with_dap = function()
      require('neotest').run.run { strategy = 'dap' }
    end
    vim.keymap.set('n', '<leader>td', run_current_with_dap, { desc = '[T]est [D]ebug' })
  end,
}
