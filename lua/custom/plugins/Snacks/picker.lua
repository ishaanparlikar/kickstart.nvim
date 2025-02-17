return {
  enabled = true,

  win = {
    input = {
      keys = {
        ['<c-j>'] = { 'select_and_next', mode = { 'i', 'n' } },
        ['<c-k>'] = { 'select_and_prev', mode = { 'i', 'n' } },
        ['<Tab>'] = { 'list_down', mode = { 'i', 'n' } },
        ['<S-Tab>'] = { 'list_up', mode = { 'i', 'n' } },
        ['<CR>'] = { 'confirm', mode = { 'i', 'n' } },
      },
      list = {
        keys = {
          ['<c-j>'] = { 'select_and_next', mode = { 'n', 'x' } },
          ['<c-k>'] = { 'select_and_prev', mode = { 'n', 'x' } },
          ['<Tab>'] = { 'list_down', mode = { 'n', 'i' } },
          ['<S-Tab>'] = { 'list_up', mode = { 'n', 'i' } },
          ['<CR>'] = { 'confirm', mode = { 'i', 'n' } },
        },
      },
    },
  },
  sources = {
    explorer = {
      watch = false,
      layout = {
        layout = {
          position = 'right',
        },
      },
    },
  },
}
