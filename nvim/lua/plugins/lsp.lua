return { {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },
    config = function()
        require('mason-lspconfig').setup({
            ensure_installed = { 'lua_ls', 'rust_analyzer', 'pyright' },
        })
    end,
},
    {
        "saghen/blink.cmp",
        version = '*',
        opts = {
            keymap = { preset = 'super-tab' },
            appearance = {
                nerd_font_variant = 'mono'
            },
            completion = { documentation = { auto_show = false } },
            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer' },
            },
        }
    },
}
