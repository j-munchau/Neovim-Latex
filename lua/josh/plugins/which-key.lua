return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
	opts = {
		-- watch only these prefixes (v is simply not listed)
		triggers = { "<Leader>" },

		-- …and any other which-key settings…
	},
}
