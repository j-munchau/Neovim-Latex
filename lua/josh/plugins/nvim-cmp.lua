return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- buffer source
		"hrsh7th/cmp-path", -- path source
		"quangnguyen30192/cmp-nvim-ultisnips", -- UltiSnips source
		"rafamadriz/friendly-snippets", -- optional snippet collection
		"onsails/lspkind.nvim", -- pictograms
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = {
				-- use UltiSnips for snippet expansion
				expand = function(args)
					vim.fn["UltiSnips#Anon"](args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),
			sources = cmp.config.sources({
				{ name = "ultisnips" }, -- UltiSnips snippets
				{ name = "buffer" }, -- text in buffer
				{ name = "path" }, -- file paths
			}),
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})

		-- if you want different sources in certain filetypes:
		cmp.setup.filetype("tex", {
			sources = cmp.config.sources({
				{ name = "ultisnips" },
				{ name = "buffer" },
				{ name = "path" },
			}),
		})
	end,
}
