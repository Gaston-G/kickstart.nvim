-- TODO: implement a local func to replace keymap.set

-- NOTE: Clipboard keybinds
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { desc = '[y]ank highlighted text' })
vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"+Y', { desc = '[Y]ank entire line' })

vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { desc = '[p]aste after cursor' })
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+P', { desc = '[P]aste before cursor' })

-- NOTE: Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- NOTE: Harpoon keybinds
local harpoon = require 'harpoon'
harpoon:setup()

vim.keymap.set('n', '<leader>a', function()
  harpoon:list():append()
end, { desc = 'Adds file to harpoon list' })
vim.keymap.set('n', '<C-e>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = 'Opens harpooned file list menu' })

vim.keymap.set('n', '<C-S-P>', function()
  harpoon:list():prev()
end)
vim.keymap.set('n', '<C-S-N>', function()
  harpoon:list():next()
end)
