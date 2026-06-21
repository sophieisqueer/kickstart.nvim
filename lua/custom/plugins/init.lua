local map = function(keys, func, opts, prefix)
  opts = opts or {}
  local desc, mode = opts.desc, opts.mode
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = prefix .. ': ' .. desc })
end

-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Iterate over all Lua files in the plugins directory and load them
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir) do
  if type == 'file' and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end

-- Define plugins (install them)
vim.pack.add {
  -- vimtex
  'https://github.com/lervag/vimtex',

  { src = 'https://github.com/Saghen/blink.compat', version = vim.version.range '1.*' },
  'https://github.com/micangl/cmp-vimtex',

  -- peek.nvim (local directory)
  { src = '/home/phi/Code/nvim/peek.nvim', name = 'peek.nvim' },

  'https://github.com/chomosuke/typst-preview.nvim',
}

-- vimtex
vim.g.vimtex_view_method = 'zathura_simple'
-- vim.g.vimtex_view_method = 'general'
-- vim.g.vimtex_view_general_viewer = 'papers'
--{
--  accents = 1,
--  ligatures = 1,
--  cites = 1,
--  fancy = 1,
--  texTabularChar = 1,
--  spacing = 1,
--  greek = 1,
--  math_bounds = 1,
--  math_delimiters = 1,
--  math_fracs = 1,
--  math_super_sub = 1,
--  math_symbols = 1,
--  sections = 0,
--  styles = 1,
-- }

vim.g.vimtex_syntax_conceal = {
  accents = 1,
  ligatures = 1,
  cites = 1,
  fancy = 0,
  texTabularChar = 0,
  spacing = 1,
  greek = 1,
  math_bounds = 1,
  math_delimiters = 1,
  math_fracs = 0,
  math_super_sub = 0,
  math_symbols = 0,
  sections = 1,
  styles = 1,
}

vim.api.nvim_create_autocmd('BufEnter', {
  group = vim.api.nvim_create_augroup('tex_file_conf', { clear = true }),
  desc = 'Set opts for (La)Tex files',
  pattern = { '*.tex', '*.bib' },
  callback = function()
    vim.o.conceallevel = 2
    vim.o.concealcursor = 'nc'
    vim.g.vimtex_fold_enabled = true
  end,
})

require('blink.cmp').add_source_provider('vimtex', {
  name = 'vimtex',
  module = 'blink.compat.source',
  min_keyword_length = 0,
  -- score_offset = 90
})

require('blink.cmp').add_filetype_source('tex', 'vimtex')

-- peek.nvim
require('peek').setup {
  auto_load = true,
}

vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
-- Optional: Run build commands for plugins that need them
-- This runs after plugins are installed/updated
vim.api.nvim_create_autocmd({ 'PackChanged' }, {
  pattern = '*',
  callback = function(ev)
    local plugin_name = ev.data and ev.data.spec and ev.data.spec.name
    if plugin_name == 'peek.nvim' then vim.fn.system 'cd home/phi/.local/share/nvim/site/pack/core/opt/peek.nvim && deno task --quiet build:fast' end
  end,
})

-- TYPST-PREVIEW.NVIM
local invert_colors = '{"rest": "always", "image": "never"}'
local typst_preview_conf = {
  dependencies_bin = { tinymist = 'tinymist' },
  invert_colors = invert_colors,
}

require('typst-preview').setup(typst_preview_conf)

vim.api.nvim_create_user_command('TypstToggleDarkMode', function()
  vim.api.nvim_cmd({ cmd = 'TypstPreviewStop' }, {})
  if typst_preview_conf.invert_colors == 'never' then
    typst_preview_conf.invert_colors = invert_colors
  else
    typst_preview_conf.invert_colors = 'never'
  end

  require('typst-preview').setup(typst_preview_conf)
  vim.api.nvim_cmd({ cmd = 'TypstPreview' }, {})
end, {})

-- TYPST (PDF)
vim.api.nvim_create_user_command('OpenPdf', function()
  local filepath = vim.api.nvim_buf_get_name(0)
  if filepath:match '%.typ$' then
    local pdf_path = filepath:gsub('%.typ$', '.pdf')
    vim.system { 'open', pdf_path }
  end
end, { desc = '(Typst) Open PDF' })
