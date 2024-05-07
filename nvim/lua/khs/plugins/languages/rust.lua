return {
  {
    'mrcjkb/rustaceanvim',
    version = '^4', -- Recommended
    ft = 'rust',
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/neotest',
    },
    config = function()
      return {
        dap = {
          autoload_configurations = true,
        },
      }
    end,
  },
}
