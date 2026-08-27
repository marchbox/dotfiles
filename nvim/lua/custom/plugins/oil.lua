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
    border = 'single',
  },
  confirmation = {
    border = 'single',
  },
  progress = {
    border = 'single',
  },
  keymaps_help = {
    border = 'single',
  },
  view_options = {
    show_hidden = true,
  },
}

vim.keymap.set('n', '<leader>-', require('oil').open_float, { desc = 'Edit file structure' })
