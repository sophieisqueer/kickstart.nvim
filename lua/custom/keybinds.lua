-- Neotree

vim.keymap.set('n', '<leader>tt', function()
		vim.cmd('Neotree left toggle reveal_force_cwd')
	end,
	{ desc = 'Neo-[t]ree [t]oggle' })

vim.keymap.set('n', '<leader>tf', function()
		vim.cmd('Neotree focus reveal_force_cwd')
	end,
	{ desc = 'Neo-[t]ree [f]ocus' })

vim.keymap.set('n', '<leader>tg', function()
		vim.cmd('Neotree git_status')
	end,
	{ desc = 'Neo-[t]ree: [g]it status' })
