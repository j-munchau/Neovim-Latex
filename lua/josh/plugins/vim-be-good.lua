return {
	{
		"ThePrimeagen/vim-be-good",
		-- only load when you call the command
		cmd = "VimBeGood",
		-- keymap to launch the game
		keys = {
			{
				"<leader>vb",
				"<cmd>VimBeGood<CR>",
				desc = "Start ‘vim-be-good’ game",
			},
		},
		config = function()
			-- optional: don’t override your normal motion keys until you start the game
			vim.g.vim_be_good_no_maps = 1
			-- optional: set how many seconds per round
			vim.g.vim_be_good_seconds = 30
		end,
	},
}
