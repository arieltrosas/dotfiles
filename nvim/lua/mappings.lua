require "nvchad.mappings"

local nomap = vim.keymap.del
local map = vim.keymap.set

-- clear mappings

nomap("n", "<C-N>")
nomap("n", "<C-s>")
nomap("n", "<C-c>")
nomap("n", "<leader>n")
nomap("n", "<leader>rn")

-- mappings

map("n", "<leader>;", "<cmd>Nvdash<CR>", { desc = "Dashboard" })
map("n", "<C-D>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree"})
map("n", "<leader>s", "/", { desc = "Search"} )
