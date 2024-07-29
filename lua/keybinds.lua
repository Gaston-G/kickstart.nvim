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

-- NOTE: LSP keybinds

map('n', 'gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
map('n', 'gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
map('n', 'gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
map('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
map('n', '<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
map('n', '<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
map('n', '<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
map('n', '<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
map('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

-- NOTE: Colorscheme keybind

map('n', '<leader>nc', NextColorscheme, 'Change to next color scheme')
