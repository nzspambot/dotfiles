return {
    {
        "folke/tokyonight.nvim",
        lazy = true,
    },

    {
        "Alexis12119/nightly.nvim",
        lazy = true,
    },

    {
        "catppuccin/nvim",
        lazy = true,
    },
    {
        "nordtheme/vim",
        lazy = true,
    },
    {
        "projekt0n/github-nvim-theme",
        lazy = true,
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = true
    },
    {
        "navarasu/onedark.nvim",
        lazy = true,
        priority = 1000,
        config = function()
            local onedark = require("onedark")
            onedark.setup({
                style = "warmer",
            })
            onedark.load()
        end,
    },
    {
        "loctvl842/monokai-pro.nvim",
        lazy = false,
        keys = { { "<leader>c", "<cmd>MonokaiProSelect<cr>", desc = "Select Moonokai pro filter" } },
        config = function()
            local monokai = require("monokai-pro")
            monokai.setup({
                transparent_background = false,
                devicons = true,
                filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
                day_night = {
                    enable = false,
                    day_filter = "classic",
                    night_filter = "octagon",
                },
                inc_search = "background", -- underline | background
                background_clear = {},
                plugins = {
                    bufferline = {
                        underline_selected = false,
                        underline_visible = false,
                        bold = true,
                    },
                    indent_blankline = {
                        context_highlight = "pro", -- default | pro
                        context_start_underline = true,
                    },
                },
                override = function(c)
                    return {
                        ColorColumn = { bg = c.base.dimmed3 },
                        -- Mine
                        DashboardRecent = { fg = c.base.magenta },
                        DashboardProject = { fg = c.base.blue },
                        DashboardConfiguration = { fg = c.base.white },
                        DashboardSession = { fg = c.base.green },
                        DashboardLazy = { fg = c.base.cyan },
                        DashboardServer = { fg = c.base.yellow },
                        DashboardQuit = { fg = c.base.red },
                    }
                end,
            })
            monokai.load()
        end,
    },
}
