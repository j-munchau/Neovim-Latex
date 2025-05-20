-- ~/.config/nvim/lua/josh/plugins/ultisnips.lua
return {
	{
		"Sirver/ultisnips",
		-- load on Insert mode so it’s ready for snippet expansion
		event = "InsertEnter",
		config = function()
			-- where your .snippets files live
			vim.g.UltiSnipsSnippetDirectories = { vim.fn.stdpath("config") .. "/UltiSnips" }
			-- optional: use tab for expansion & navigation
			vim.g.UltiSnipsExpandTrigger = "<tab>"
			vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
			vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
		end,
	},
	{
		"quangnguyen30192/cmp-nvim-ultisnips",
		dependencies = { "hrsh7th/nvim-cmp", "Sirver/ultisnips" },
		event = "InsertEnter",
		after = "ultisnips",
		config = function()
			require("cmp_nvim_ultisnips").setup({}) -- pulls in the upstream fix
		end,
	},
}
