return {

  'numToStr/Comment.nvim',
  opts = {
    -- add any options here
  },
  event = 'VeryLazy',
  config = function()
    require('Comment').setup {}
  end,
}
