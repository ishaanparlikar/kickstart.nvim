local catppuccin = {
  'catppuccin/nvim',
  config = function()
    require('catppuccin').setup {}
  end,
}

local kanagawa = {
  'rebelot/kanagawa.nvim',
  -- priority = 1000, -- make sure to load this before all the other start plugins
  lazy = false,
  config = function()
    require('kanagawa').setup {}
  end,
}

local gruvbox = {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  lazy = false,
  config = true,
}

return {
  catppuccin,
  kanagawa,
  gruvbox,
}
