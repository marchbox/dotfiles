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
    border = 'rounded',
  },
  confirmation = {
    border = 'rounded',
  },
  progress = {
    border = 'rounded',
  },
  keymaps_help = {
    border = 'rounded',
  },
  view_options = {
    show_hidden = true,
  },
}

vim.keymap.set('n', '<leader>-', require('oil').open_float, { desc = 'Edit file structure' })
