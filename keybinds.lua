local map = function(mode, keys, action, description)
  vim.keymap.set(mode, keys, action, { desc = description })
end

map('n', '<leader>pv', vim.cmd.Ex)

-- NOTE: Clipboard keybinds
map({ 'n', 'v' }, '<leader>y', '"+y', '[y]ank highlighted text')
map({ 'n', 'v' }, '<leader>Y', '"+Y', '[Y]ank entire line')

map({ 'n', 'v' }, '<leader>p', '"+p', '[p]aste after cursor')
map({ 'n', 'v' }, '<leader>P', '"+P', '[P]aste before cursor')

-- NOTE: Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, 'Go to previous [D]iagnostic message')
map('n', ']d', vim.diagnostic.goto_next, 'Go to next [D]iagnostic message')
map('n', '<leader>e', vim.diagnostic.open_float, 'Show diagnostic [E]rror messages')
map('n', '<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')

-- NOTE: Harpoon keybinds
local harpoon = require 'harpoon'
harpoon:setup()

map('n', '<leader>a', function()
  harpoon:list():append()
end, 'Adds file to harpoon list')

map('n', '<C-e>', function()
  harpoon.ui:toggle_quick_menu(harpoon:list())
end, 'Opens harpooned file list menu')

map('n', '<C-S-P>', function()
  harpoon:list():prev()
end)

map('n', '<C-S-N>', function()
  harpoon:list():next()
end)

map('n', '<leader>nc', ':lua NextColorscheme()<CR>', 'Change to next color scheme')
