local colorschemes = {
  -- Dark themes
  'tokyonight-night',
  'ayu-dark',
  'molokai_black',
  -- Light themes

  'github',
}

local colorscheme_index = 1
local path_to_saving_file = vim.fn.stdpath 'config' .. '/lua/custom/colorscheme/colorscheme_index'
function NextColorscheme()
  colorscheme_index = colorscheme_index + 1
  if colorscheme_index > #colorschemes then
    colorscheme_index = 1
  end

  local next_colorscheme = colorschemes[colorscheme_index]
  vim.cmd.colorscheme(next_colorscheme)
  vim.fn.writefile({ tostring(colorscheme_index) }, path_to_saving_file)
end

function LoadColorscheme()
  if vim.fn.filereadable(path_to_saving_file) == 1 then
    colorscheme_index = tonumber(vim.fn.readfile(path_to_saving_file)[1])
  end
  vim.cmd.colorscheme(colorschemes[colorscheme_index])
end

return {}
