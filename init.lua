vim.g.python3_host_prog = vim.fn.exepath("python3")
vim.g.python3_host_prog = vim.fn.expand("~/.config/nvim/venv/bin/python")
require("josh.core")
require("josh.lazy")
