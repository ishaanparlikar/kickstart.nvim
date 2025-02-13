-- File: lua/custom/plugins/filetree.lua

return {
  'nvim-tree/nvim-tree.lua',
  enabled = false,
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('nvim-tree').setup {
      view = {
        side = 'right',
        width = 40,
      },
      update_focused_file = {
        enable = true,
      },
    }
  end,
}
