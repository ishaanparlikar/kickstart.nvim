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
    require('onedark').setup {}
  end,
}

local eldritch = { 'eldritch-theme/eldritch.nvim', lazy = false, priority = 1000, opts = {} }

return {
  poimandres,
  eldritch,
  onedark,
}
