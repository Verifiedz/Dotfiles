require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
require "nvchad.mappings"

-- The Mapping
local map = vim.keymap.set

map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
