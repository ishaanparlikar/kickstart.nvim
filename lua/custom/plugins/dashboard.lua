return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    local logo = [[
          ██████   █████                   █████   █████  ███                  
          ░░██████ ░░███                   ░░███   ░░███  ░░░                  
          ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████  
          ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███ 
          ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  
          ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███
          █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████
          ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░
      ]]
    logo = string.rep('\n', 8) .. logo .. '\n\n'
    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = vim.split(logo, '\n'),
        disable_move = true,
        center = {
          {
            icon = ' ',
            icon_hl = 'Title',
            desc = 'Find File           ',
            desc_hl = 'String',
            key = 'b',
            keymap = 'SPC f f',
            key_hl = 'Number',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'lua print(2)',
          },
          {
            icon = ' ',
            desc = 'Find Dotfiles',
            key = 'f',
            keymap = 'SPC f d',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'lua print(3)',
          },
          {
            icon = ' ',
            desc = 'Find Projects',
            key = 'p',
            keymap = 'SPC',
            key_format = ' %s', -- remove default surrounding `[]`
            action = 'lua print(3)',
          },
          {
            icon = ' ',
            desc = 'Restore last session',
            key = 'ql',
            keymap = 'SPC',
            key_format = ' %s', -- remove default surrounding `[]`
          },
          {
            icon = ' ',
            desc = 'Restore session',
            key = 'qs',
            keymap = 'SPC',
            key_format = ' %s', -- remove default surrounding `[]`
          },
        },
        footer = function()
          local stats = require('lazy').stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
        end,
      },
    }
  end,
  requires = { 'nvim-tree/nvim-web-devicons' },
}
