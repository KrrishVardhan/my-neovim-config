-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- Vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- Find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Toggle line wrapping
vim.keymap.set('n', '<leader>lw', '<cmd>set wrap!<CR>', opts)


-- JAVA keymap
vim.keymap.set('n', '<leader>r', function()
  vim.cmd('write')

  local file = vim.fn.expand('%:p')
  local directory = vim.fn.expand('%:p:h')
  local class_name = vim.fn.expand('%:t:r')

  vim.cmd('botright 12split')

  vim.fn.termopen({
    'bash',
    '-lc',
    string.format(
      'javac %s && java -cp %s %s',
      vim.fn.shellescape(file),
      vim.fn.shellescape(directory),
      vim.fn.shellescape(class_name)
    ),
  })

  vim.cmd('startinsert')
end, { desc = 'Compile and run Java file' })

