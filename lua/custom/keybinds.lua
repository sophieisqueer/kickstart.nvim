-- Neotree

vim.keymap.set('n', '<leader>t', function()
		vim.cmd('Neotree left toggle reveal_force_cwd')
	end,
	{ desc = '[t] Toggle neo-tree' })
