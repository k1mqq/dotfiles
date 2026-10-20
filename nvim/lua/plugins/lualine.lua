return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'SmiteshP/nvim-navic'
    },
    config = function()
        require("lualine").setup {
            options = {
                theme = 'ayu_mirage',
            },
            sections = {
                lualine_c = {
                    "filename",
                    {
                        function() return require('nvim-navic').get_location() end,
                        cond = function() return package.loaded["nvim-navic"] and require('nvim-navic').is_available() end,
                    },
                },
                lualine_y = {
                    "os.date('%m/%d')",
                    "os.date('%H:%M:%S')",
                },
                lualine_z = {
                    "progress",
                    "location",
                }
            },
        }
    end,
}
