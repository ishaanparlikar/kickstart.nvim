return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  ---@module snacks
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    animate = require 'custom.plugins.Snacks.animate',
    dim = require 'custom.plugins.Snacks.dim',
    terminal = require 'custom.plugins.Snacks.terminal',
    dashboard = require 'custom.plugins.Snacks.dashboard',
    bigfile = { enabled = true },
    explorer = {
      enabled = true,
    },
    indent = { enabled = true },
    input = { enabled = true },
    picker = {
      enabled = true,
      sources = {
        explorer = {
          watch = false,
          win = {
            input = {
              keys = {
                ['<Tab>'] = { 'confirm', mode = { 'n', 'i' } },
                ['<CR>'] = { 'select_and_next', mode = { 'i', 'n' } },
              },
            },
          },
          layout = {
            layout = {
              position = 'right',
            },
          },
        },
      },
    },
    notifier = { enabled = true },
    notify = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    git = { enabled = true },
    lazygit = { enabled = true },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>uw'
      end,
    })
  end,
  keys = {},
}
