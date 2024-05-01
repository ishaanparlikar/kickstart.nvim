local poimandres = {
  'olivercederborg/poimandres.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('poimandres').setup {
      disable_italics = false,
    }
  end,
}

local onedark = {
  'navarasu/onedark.nvim',
  lazy = false,
  config = function()
    require('onedark').setup {
      style = 'deep',
    }
  end,
}

local github_dark = {
  'projekt0n/github-nvim-theme',
  lazy = false,
  config = function()
    require('github-theme').setup {}
  end,
}

local night_owl = {
  'oxfist/night-owl.nvim',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    -- load the colorscheme here
    require('night-owl').setup()
    vim.cmd.colorscheme 'night-owl'
  end,
}

local catppuccin = {
  'catppuccin/nvim',
}

local eldritch = { 'eldritch-theme/eldritch.nvim', lazy = false, priority = 1000, opts = {} }

return {
  poimandres,
  eldritch,
  onedark,
  github_dark,
  night_owl,
  catppuccin,
}
