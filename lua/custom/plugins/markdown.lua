return {
	'jakewvincent/mkdnflow.nvim',

	opts = {},

	config = function()
		vim.wo.conceallevel = 2
		vim.api.nvim_create_autocmd("FileType", { pattern = "markdown", command = "set awa" })
	end

}
