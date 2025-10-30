-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- plugins

lvim.plugins = {
    { "sainnhe/gruvbox-material", "gruvbox-material" }
}

-- colorscheme

lvim.colorscheme = "gruvbox-material"

vim.o.background = "dark"
vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "material"
vim.g.gruvbox_material_enable_italic = 1
vim.g.gruvbox_material_better_performance = 1

-- options

vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = true

-- keymaps

lvim.keys.normal_mode["<Tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<leader>x"] = ":BufferKill<CR>"
lvim.keys.normal_mode["<A-i>"] = ":ToggleTerm direction=float<CR>"
lvim.keys.term_mode["<A-i>"] = "<C-\\><C-n>:ToggleTerm direction=float<CR>"
lvim.keys.normal_mode["<leader>ss"] = "/"
lvim.keys.normal_mode["<Esc>"] = ":nohlsearch<CR>"

-- nvim-tree

lvim.builtin.nvimtree.setup.on_attach = function(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    api.config.mappings.default_on_attach(bufnr)

    vim.keymap.set("n", ".", function() api.tree.change_root_to_node(api.tree.get_node_under_cursor()) end, opts('CD'))
end
