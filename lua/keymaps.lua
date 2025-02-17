-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`key
-- Set highlight on search, but clear on pressing <Esc> in normal mode
local map = vim.keymap.set
vim.opt.hlsearch = true
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<S-l>', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>gd', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
-- map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- map('n', '<leader>p', '<cmd>Telescope projects theme=dropdown<CR>', { desc = 'Open Projects' })

-- Tabs
-- map('n', '<C-w>', '<cmd> :BufferCloseAllButCurrent <CR>', { desc = 'Kill all tabs' })
map('n', '<tab>', '<cmd>BufferLineCycleNext <CR>', { desc = 'Next Buffer' })
map('n', '<S-Tab>', '<cmd>BufferLineCyclePrev <CR>', { desc = 'Previous Buffer' })

map('n', '<leader>qc', '<Cmd>lua MiniBufremove.delete()<CR>', { desc = 'Close current buffer' })
map('n', '<leader>Q', '<Cmd>BufferLineCloseOthers<CR>', { desc = 'Close Other buffers' })
map('n', '<leader>qL', '<Cmd>BufferLineCloseLeft<CR>', { desc = 'Close Left buffers' })
map('n', '<leader>qR', '<Cmd>BufferLineCloseRight<CR>', { desc = 'Close Right buffers' })

-- Remove S mapping to better use with Mini Surround
map('n', 's', '<Nop>', { noremap = true, silent = true })

-- Format
map({ 'n', 'v' }, '==', function()
  require('conform').format {
    lsp_fallback = true,
    async = false,
    timeout = 500,
  }
end, { desc = 'Format Document' })

-- lint
map('n', '<leader>=', function()
  require('lint').try_lint()
end, { desc = 'Lint for current file' })

map('n', '<leader>ww', '<cmd>w<CR>', { desc = 'Save File' })
map('n', '<leader>wq', '<cmd>wq<CR>', { desc = 'Save and Quit' })

-- Comment
--
-- map({ 'n', 'v' }, '<leader>/', 'gcc', { desc = 'Comment Toggle' })
map({ 'n', 'v' }, '<C-a>', 'gcc', { desc = 'Comment Toggle' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
map({ 'n', 'v' }, '<leader>R', '<cmd>LspRestart<cr>', { desc = 'Restart LSP Client' })
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`

-- Undo Tree Keymaps

map({ 'n', 'v' }, '<leader>ut', '<cmd>UndotreeToggle<cr>', { desc = 'Undo Tree' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
--
-- Search

map('n', '<leader>/h', function()
  Snacks.picker.search_history()
end, { desc = 'Search History' })
map('n', '<leader>/a', function()
  Snacks.picker.autocmds()
end, { desc = 'Autocmds' })
map('n', '<leader>/b', function()
  Snacks.picker.lines()
end, { desc = 'Buffer Lines' })
map('n', '<leader>/c', function()
  Snacks.picker.command_history()
end, { desc = 'Command History' })
map('n', '<leader>/C', function()
  Snacks.picker.commands()
end, { desc = 'Commands' })

map('n', '<leader>/h', function()
  Snacks.picker.help()
end, { desc = 'Help Pages' })
map('n', '<leader>/H', function()
  Snacks.picker.highlights()
end, { desc = 'Highlights' })
map('n', '<leader>/i', function()
  Snacks.picker.icons()
end, { desc = 'Icons' })
map('n', '<leader>/j', function()
  Snacks.picker.jumps()
end, { desc = 'Jumps' })
map('n', '<leader>/k', function()
  Snacks.picker.keymaps()
end, { desc = 'Keymaps' })
map('n', '<leader>/l', function()
  Snacks.picker.loclist()
end, { desc = 'Location List' })
map('n', '<leader>/m', function()
  Snacks.picker.marks()
end, { desc = 'Marks' })
map('n', '<leader>/M', function()
  Snacks.picker.man()
end, { desc = 'Man Pages' })
map('n', '<leader>/p', function()
  Snacks.picker.lazy()
end, { desc = 'Search for Plugin Spec' })
map('n', '<leader>/q', function()
  Snacks.picker.qflist()
end, { desc = 'Quickfix List' })
map('n', '<leader>/R', function()
  Snacks.picker.resume()
end, { desc = 'Resume' })
map('n', '<leader>/u', function()
  Snacks.picker.undo()
end, { desc = 'Undo History' })
map('n', '<leader>uC', function()
  Snacks.picker.colorschemes()
end, { desc = 'Colorschemes' })

-- LSP Snacks
map('n', 'gd', function()
  Snacks.picker.lsp_definitions()
end, { desc = 'Goto Definition' })
map('n', 'gD', function()
  Snacks.picker.lsp_declarations()
end, { desc = 'Goto Declaration' })
map('n', 'gr', function()
  Snacks.picker.lsp_references()
end, { nowait = true, desc = 'References' })
map('n', 'gI', function()
  Snacks.picker.lsp_implementations()
end, { desc = 'Goto Implementation' })
map('n', 'gy', function()
  Snacks.picker.lsp_type_definitions()
end, { desc = 'Goto T[y]pe Definition' })
map('n', '<leader>ls', function()
  Snacks.picker.lsp_symbols()
end, { desc = 'LSP Symbols' })
map('n', '<leader>lS', function()
  Snacks.picker.lsp_workspace_symbols()
end, { desc = 'LSP Workspace Symbols' })
map('n', '<leader>ld', function()
  Snacks.picker.diagnostics()
end, { desc = 'Diagnostics' })
map('n', '<leader>lD', function()
  Snacks.picker.diagnostics_buffer()
end, { desc = 'Buffer Diagnostics' })

-- File Picker

map({ 'n', 'v' }, '<C-p>', function()
  Snacks.picker.smart()
end, { desc = 'Smart Find Files' })
map('n', '<leader><leader>', function()
  Snacks.picker.buffers()
end, { desc = 'Buffers' })
map('n', '<leader>fa', function()
  Snacks.picker.grep()
end, { desc = 'Grep' })
map('n', '<leader>:', function()
  Snacks.picker.command_history()
end, { desc = 'Command History' })
map('n', '<leader>n', function()
  Snacks.picker.notifications()
end, { desc = 'Notification History' })
map('n', '<leader>e', function()
  Snacks.explorer()
end, { desc = 'File Explorer' })

-- Find
map('n', '<leader>fb', function()
  Snacks.picker.buffers()
end, { desc = 'Buffers' })
map('n', '<leader>fc', function()
  Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
end, { desc = 'Find Config File' })
map('n', '<leader>ff', function()
  Snacks.picker.files()
end, { desc = 'Find Files' })
map('n', '<leader>fg', function()
  Snacks.picker.git_files()
end, { desc = 'Find Git Files' })
map('n', '<leader>fp', function()
  Snacks.picker.projects()
end, { desc = 'Projects' })
map('n', '<leader>fr', function()
  Snacks.picker.recent()
end, { desc = 'Recent' })

--Git
map('n', '<leader>gb', function()
  Snacks.picker.git_branches()
end, { desc = 'Git Branches' })
map('n', '<leader>gl', function()
  Snacks.picker.git_log()
end, { desc = 'Git Log' })
map('n', '<leader>gL', function()
  Snacks.picker.git_log_line()
end, { desc = 'Git Log Line' })
map('n', '<leader>gs', function()
  Snacks.picker.git_status()
end, { desc = 'Git Status' })
map('n', '<leader>gS', function()
  Snacks.picker.git_stash()
end, { desc = 'Git Stash' })
map('n', '<leader>gd', function()
  Snacks.picker.git_diff()
end, { desc = 'Git Diff (Hunks)' })
map('n', '<leader>gf', function()
  Snacks.picker.git_log_file()
end, { desc = 'Git Log File' })
map({ 'n', 'v' }, '<leader>gB', function()
  Snacks.gitbrowse()
end, { desc = 'Git Browse' })
map('n', '<leader>gg', function()
  Snacks.lazygit()
end, { desc = 'Lazygit' })

-- Others
map('n', '<leader>uh', function()
  Snacks.toggle.inlay_hints()
end, { desc = 'Toggle Inlay Hints' })
map('n', '<leader>ug', function()
  Snacks.toggle.indent()
end, { desc = 'Toggle Indent Guides' })
map('n', '<leader>ud', function()
  Snacks.dim()
end, { desc = 'Toggle Dim Inactive' })
map('n', '<leader>.', function()
  Snacks.scratch()
end, { desc = 'Toggle Scratch Buffer' })
map('n', '<leader>S', function()
  Snacks.scratch.select()
end, { desc = 'Select Scratch Buffer' })

-- map('n', '<leader>st', function()
--   Snacks.picker.todo_comments { keywords = { 'TODO', 'HACK', 'WARNING', 'BUG', 'NOTE', 'INFO', 'PERF', 'ERROR' } }
-- end, { desc = 'Todo Comment Tags' })
-- map('n', '<leader>sT', function()
--   Snacks.picker.todo_comments()
-- end, { desc = 'Todo' })
