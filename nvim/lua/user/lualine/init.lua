-- Bubbles config for lualine
-- Author: lokesh-krishna
-- MIT license, see LICENSE for more details.
--insert = "#eb4034",
--visual = "#9745be",
-- stylua: ignore
local colors = {
  blue   = '#80a0ff',
  cyan   = '#79dac8',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#eb4034',
  violet = '#9745be',
  grey   = '#303030',
  green  = '#34eb34',
}

local bubbles_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.green },
    b = { fg = colors.black, bg = colors.cyan },
    c = { fg = colors.white, bg = colors.grey},
  },

  insert = { a = { fg = colors.grey, bg = colors.red } },
  visual = { a = { fg = colors.grey, bg = colors.violet } },
  replace = { a = { fg = colors.grey, bg = colors.green } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white, bg = colors.black },
  },
}

--require('lualine').setup {
--  options = {
--    theme = bubbles_theme,
--    component_separators = '|',
--    section_separators = { left = '', right = '' },
--  },
--  sections = {
--    lualine_a = {
--      { 'mode', separator = { left = '' }, right_padding = 2 },
--    },
--    lualine_b = { 'filename', 'branch' },
--    lualine_c = { 'fileformat' },
--    lualine_x = {},
--    lualine_y = { 'filetype', 'progress' },
--    lualine_z = {
--      { 'location', separator = { right = '' }, left_padding = 2 },
--    },
--  },
--  inactive_sections = {
--    lualine_a = { 'filename' },
--    lualine_b = {},
--    lualine_c = {},
--    lualine_x = {},
--    lualine_y = {},
--    lualine_z = { 'location' },
--  },
--  tabline = {},
--  extensions = {},
--}
require('lualine').setup({
  options = { theme = bubbles_theme },
  sections = {
    lualine_c = {
      {
        'filename',
        file_status = true, -- displays file status (readonly status, modified status)
        path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
      }
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location','selectioncount'}
  }
})
