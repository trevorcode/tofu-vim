
return {
    "goolord/alpha-nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        -- require('alpha').setup(dashboard.opts)
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
        [[ _________  ________  ________ ___  ___  ___      ___ ___  _____ ______      ]],
        [[|\___   ___\\   __  \|\  _____\\  \|\  \|\  \    /  /|\  \|\   _ \  _   \    ]],
        [[\|___ \  \_\ \  \|\  \ \  \__/\ \  \\\  \ \  \  /  / | \  \ \  \\\__\ \  \   ]],
        [[     \ \  \ \ \  \\\  \ \   __\\ \  \\\  \ \  \/  / / \ \  \ \  \\|__| \  \  ]],
        [[      \ \  \ \ \  \\\  \ \  \_| \ \  \\\  \ \    / /   \ \  \ \  \    \ \  \ ]],
        [[       \ \__\ \ \_______\ \__\   \ \_______\ \__/ /     \ \__\ \__\    \ \__\]],
        [[        \|__|  \|_______|\|__|    \|_______|\|__|/       \|__|\|__|     \|__|]],
        }
        dashboard.section.buttons.val = {
            dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
            dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
            dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
            dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
            dashboard.button("c", "  Configuration", ":e $MYVIMRC <CR>"),
            dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
        }

        dashboard.section.footer.opts.hl = "Type"
        dashboard.section.header.opts.hl = "Include"
        dashboard.section.buttons.opts.hl = "Keyword"

        dashboard.opts.opts.noautocmd = true

        require'alpha'.setup(dashboard.opts)
    end,
    keys = {
      { "<leader>a", "<cmd>Alpha<cr>", desc = "Home page" }
    }
}
