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

-- Noteflow

vim.keymap.set('n', '<leader>nd', function()
		vim.cmd('NoteflowDaily')
	end,
	{ desc = '[n]oteflow: [d]aily' })

vim.keymap.set('n', '<leader>nf', function()
		vim.cmd('NoteflowFind')
	end,
	{ desc = '[n]oteflow: [f]ind' })

vim.keymap.set('n', '<leader>ne', function()
		vim.cmd('NoteflowEditTags')
	end,
	{ desc = '[n]oteflow: [e]dit tags' })

vim.keymap.set('n', '<leader>nt', function()
		vim.cmd('NoteflowTags')
	end,
	{ desc = '[n]oteflow: [t]ags' })

vim.keymap.set('n', '<leader>ng', function()
		vim.cmd('NoteflowGrep')
	end,
	{ desc = '[n]oteflow: [g]rep' })

vim.keymap.set('n', '<leader>nl', function()
		vim.cmd('NoteflowInsertLink')
	end,
	{ desc = '[n]oteflow: [l]ink (insert)' })
