return {
    {
        "kevinhwang91/rnvimr",
        event = { "BufReadPost" },
        keys = { { "<leader>r", "<cmd>RnvimrToggle<cr>", desc = "Open file manager" } },
        init = function()
            -- Make Ranger to be hidden after picking a file
            vim.g.rnvimr_enable_picker = 1

            -- Change the border's color
            -- vim.g.rnvimr_border_attr = { fg = 31, bg = -1 }
            vim.g.rnvimr_border_attr = { fg = 3, bg = -1 }

            -- Draw border with both
            -- vim.g.rnvimr_ranger_cmd = { "ranger", "--cmd=set draw_borders both" }

            -- Add a shadow window, value is equal to 100 will disable shadow
            vim.g.rnvimr_shadow_winblend = 90
        end,
    },

    {
        "mg979/vim-visual-multi",
        event = "BufAdd",
    },

    {
        "loctvl842/compile-nvim",
        lazy = true,
        config = function()
            require("tvl.config.compile")
        end,
    },

    {
        "toppair/peek.nvim",
        priority = 10,
        build = "deno task --quiet build:fast",
        keys = {
            {
                "<leader>p",
                function()
                    local peek = require("peek")
                    if peek.is_open() then
                        peek.close()
                    else
                        peek.open()
                    end
                end,
                desc = "Peek (Markdown Preview)",
            },
        },
        opts = { theme = "dark" },
    },

    {
        "moll/vim-bbye",
        event = { "BufRead" },
        keys = { { "<leader>d", "<cmd>Bdelete!<cr>", desc = "Close Buffer" } },
    },

    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {
            options = { "buffers", "curdir", "tabpages", "winsize", "help", "blank", "terminal", "folds", "tabpages" },
        },
        keys = {
            {
                "<leader>ss",
                function()
                    require("persistence").load()
                end,
                desc = "Restore Session",
            },
            {
                "<leader>sl",
                function()
                    require("persistence").load({ last = true })
                end,
                desc = "Restore Last Session",
            },
            {
                "<leader>sd",
                function()
                    require("persistence").stop()
                end,
                desc = "Don't Save Current Session",
            },
        },
    },

    {
        "github/copilot.vim",
        init = function()
            vim.cmd([[highlight CopilotSuggestion guifg=#555555 ctermfg=8]])
            vim.g.copilot_no_tab_map = true vim.api.nvim_set_keymap("i", "<C-A>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
            vim.g.copilot_assume_mapped = true
        end,
    },

    {
        "akinsho/nvim-toggleterm.lua",
        cmd = "ToggleTerm",
        config = function()
            require("tvl.config.toggleterm").config()
        end,
    },
    {
        "kdheepak/lazygit.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("telescope").load_extension("lazygit")
        end,
    },
    {
        "tversteeg/registers.nvim",
        config = function()
            require("registers").setup()
        end,
    },
    {
        "ggandor/leap.nvim",
        config = function()
          require("leap").add_default_mappings()
        end,
    }
}
