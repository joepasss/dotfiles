return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		require("telescope").load_extension("lazygit")

		vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { noremap = true, silent = true })
	end,
}
