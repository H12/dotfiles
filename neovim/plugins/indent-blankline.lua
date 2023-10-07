return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        indent = {
            char = "│",
            highlight = "VertSplit",
        },
        scope = {
            highlight = "FloatBorder",
            include = {
                node_type = {
                    ["lua"] = {
                        "block",
                        "if_statement",
                        "table_constructor",
                    },
                },
            },
        },
    }
}
