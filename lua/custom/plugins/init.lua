-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
return {
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function(plugin)
			if vim.fn.executable("npx") then
				vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
			else
				vim.cmd([[Lazy load markdown-preview.nvim]])
				vim.fn["mkdp#util#install"]()
			end
		end,
		init = function()
			if vim.fn.executable("npx") then
				vim.g.mkdp_filetypes = { "markdown" }
			end
		end,
		-- Markdown Preview
		vim.keymap.set("n", "<leader>tm", "<cmd>MarkdownPreview<CR>", { desc = "Open markdown preview" }),
	},
}
