return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = 'VeryLazy',
    opts = {
      notify_on_error = false,
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },

      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { 'prettierd' },
        typescript = { 'prettierd' },
        svelte = { 'prettierd' },
        html = { 'prettierd' },
        css = { 'prettierd' },
        astro = { 'prettierd' },
        markdown = { 'prettierd' },
        yaml = { 'prettierd' },
        json = { 'prettierd' },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use a sub-list to tell conform to run *until* a formatter
        -- is found.
        -- javascript = { { "prettierd", "prettier" } },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
