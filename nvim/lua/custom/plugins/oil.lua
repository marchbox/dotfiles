vim.pack.add { 'https://github.com/stevearc/oil.nvim' }
require('oil').setup {
  default_file_explorer = false,
  keymaps = {
    ['q'] = { 'actions.close', mode = 'n' },
  },
  float = {
    padding = 8,
    max_width = 0.6,
    max_height = 0.6,
    border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
  },
}

vim.keymap.set('n', '<leader>-', require('oil').open_float, { desc = 'Edit file structure' })
