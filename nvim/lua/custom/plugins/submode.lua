vim.pack.add { 'https://github.com/pogyomo/submode.nvim' }
vim.pack.add { 'https://github.com/pogyomo/winresize.nvim' }

local submode = require 'submode'

-- Window move
submode.create('WinMove', {
  mode = 'n',
  enter = '<leader>wm',
  leave = { '<esc>' },
  default = function(register)
    register('<left>', '<C-w>h')
    register('<down>', '<C-w>j')
    register('<up>', '<C-w>k')
    register('<right>', '<C-w>l')
  end,
})

-- Window resize
local resize = require('winresize').resize
submode.create('WinResize', {
  mode = 'n',
  enter = '<leader>wr',
  leave = { '<esc>' },
  default = function(register)
    register('<left>', function() resize(0, 2, 'left') end)
    register('<down>', function() resize(0, 1, 'down') end)
    register('<up>', function() resize(0, 1, 'up') end)
    register('<right>', function() resize(0, 2, 'right') end)
  end,
})
