-- import nvim-treesitter plugin
local treesitter = require("nvim-treesitter.configs")

-- configure treesitter
treesitter.setup({
    highlight = {
        enable = true,
    },
    indent = { enable = true },
    autotag = {
        enable = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
        },
    },
})
