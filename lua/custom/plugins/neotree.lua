return {
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		{
			-- only needed if you want to use the commands with "_with_window_picker" suffix
			's1n7ax/nvim-window-picker',
			tag = "v1.*",
			config = function()
				require 'window-picker'.setup({
					autoselect_one = true,
					include_current = false,
					filter_rules = {
						-- filter using buffer options
						bo = {
							-- if the file type is one of following, the window will be ignored
							filetype = { 'neo-tree', "neo-tree-popup", "notify" },

							-- if the buffer type is one of following, the window will be ignored
							buftype = { 'terminal', "quickfix" },
						},
					},
					other_win_hl_color = '#e35e4f',
				})
			end,
		}
	},
	config = function()
		-- Unless you are still migrating, remove the deprecated commands from v1.x
		vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

		require('neo-tree').setup({
			source_selector = {
				winbar = true,
				statusbar = false,
				sources = {
					{
						source = "filesystem", -- string
						display_name = "  Files " -- string | nil
					},
					{
						source = "buffers", -- string
						display_name = "  Buffers " -- string | nil
					},
					{
						source = "git_status", -- string
						display_name = "  Git " -- string | nil
					},
					{
						source = "document_symbols",
						display_name = "  Symbols "
					},
				},
			},
		})
	end,
}