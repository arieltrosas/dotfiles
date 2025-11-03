require("nvchad.configs.lspconfig").defaults()

local servers = {
    "clangd",                -- C and C++
    "cmake",                 -- CMake
    "pylsp",                 -- Python (or use "pyright" for a more modern option)
    "lua_ls",                -- Lua (new name for lua-language-server)
    "html",                  -- HTML
    "cssls",                 -- CSS
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
