vim.pack.add { 'https://github.com/akinsho/toggleterm.nvim' }
require('toggleterm').setup {}

vim.keymap.set("n", "<leader>t", "<CMD>ToggleTerm<CR>", { desc = "Toggle [T]terminal" })
