return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")
		local previewers = require("telescope.previewers")
		local sorters = require("telescope.sorters")

		local largeFilesIgnoringPreviewer = function(filepath, bufnr, opts)
			opts = opts or {}
			filepath = vim.fn.expand(filepath)
			vim.loop.fs_stat(filepath, function(_, stat)
				if not stat then
					return
				end
				if stat.size > 100000 then
					return
				else
					previewers.buffer_previewer_maker(filepath, bufnr, opts)
				end
			end)
		end

		telescope.setup({
			defaults = {
				buffer_previewer_maker = largeFilesIgnoringPreviewer,
				wrap_results = true,
				file_ignore_patterns = { ".git/" },
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
					},
				},
			},
			pickers = {
				oldfiles = {
					initial_mode = "normal",
					sorter = sorters.fuzzy_with_index_bias(),
				},
				command_history = {
					sorter = sorters.fuzzy_with_index_bias(),
				},
				find_files = {
					hidden = true,
				},
				git_files = {
					show_untracked = true,
					wrap_results = true,
				},
			},
		})

		telescope.load_extension("fzf")

		local keymap = vim.keymap -- for conciseness
		local CONFIG_DIR = vim.fn.expand("$HOME/.config/nvim")
		local TEX_DIR = "$HOME/Eurointelligence Dropbox/Joshua Munchau/LaTeXProjects"
		-- set keymaps
		keymap.set("n", "<leader>ff", function()
			builtin.find_files({
				prompt_title = "TeX Files",
				cwd = TEX_DIR,
				hidden = true,
			})
		end, { desc = "Find .tex files" })

		keymap.set("n", "<leader>ii", function()
			builtin.find_files({
				prompt_title = "Config Files",
				cwd = CONFIG_DIR,
				hidden = true,
				find_command = {
					"fd",
					"--type",
					"f",
					"--extension",
					"lua",
					"--hidden",
					"--exclude",
					".git",
				},
			})
		end, { desc = "Config files" })
	end,
}
