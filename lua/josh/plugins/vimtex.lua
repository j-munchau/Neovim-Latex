return {
	"lervag/vimtex",
	ft = { "tex", "bib" },
	config = function()
		-- Compiler & viewer:
		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_compiler_engine = "lualatex"
		vim.g.vimtex_view_method = "skim"
		-- Conceal math macros, disable quickfix summary:
		vim.g.conceallevel = 1
		vim.g.concealcursor = "nvic"
		vim.g.vimtex_quickfix_mode = 0
	end,
}
