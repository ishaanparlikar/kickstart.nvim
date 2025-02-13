local catppuccin = {
  'catppuccin/nvim',
  config = function()
    require('catppuccin').setup {}
  end,
}

local kanagawa = {
  'rebelot/kanagawa.nvim',
  -- priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('kanagawa').setup {}
  end,
}

local gruvbox = {
  'ellisonleao/gruvbox.nvim',
  config = true,
}

local githubThemes = {
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('github-theme').setup {
      -- ...
    }
  end,
}

return {
  catppuccin,
  kanagawa,
  gruvbox,
  githubThemes,
}
