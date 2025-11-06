local M = require("nvchad.configs.nvimtree")

M.renderer.root_folder_label = function(path)
    return vim.fn.fnamemodify(path, ":t")
end

M.filters.git_ignored = true
M.filters.dotfiles = true

M.on_attach = function(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    local map = vim.keymap.set

    local function toggle_hidden_filter()
        api.tree.toggle_gitignore_filter()
        api.tree.toggle_hidden_filter()
    end

    map('n', 'H', toggle_hidden_filter, opts("toggle .gitignore filter"))
end

return M
