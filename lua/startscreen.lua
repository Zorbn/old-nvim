local if_nil = vim.F.if_nil

local function pick_color()
    local colors = { "String", "Identifier", "Keyword", "Number" }
    return colors[math.random(#colors)]
end

local default_header = {
    type = "text",
    val = {
        -- [[████    ████    ████                 ████       ]],
        -- [[████    ████    ████              █████████     ]],
        -- [[████████████████████            ██████████████  ]],
        -- [[████████████████████        ███████████████████ ]],
        -- [[ ██████████████████        ████████████████████ ]],
        -- [[████████████████████       ████████████████████ ]],
        -- [[   ██████████████           █████  █████████████]],
        -- [[   ██████████████                 ██████████████]],
        -- [[   ██████████████              █████████████████]],
        -- [[  ████████████████           ███████████████████]],
        -- [[  ████████████████          ██████████████████  ]],
        -- [[ ██████████████████         █████████████████   ]],
        -- [[ ██████████████████          ██████████████████ ]],
        -- [[████████████████████        ████████████████████]],
        -- [[████████████████████        ████████████████████]],
        [[ ____    ____    ____                   ____        ]],
        [[|    |  |    |  |    |               __\    \_      ]],
        [[|    |__|    |__|    |             _/         \__   ]],
        [[|                    |         ___/              |  ]],
        [[|                    |        /                   \ ]],
        [[\                    /       |                     |]],
        [[|__                __|       |                    \ ]],
        [[   |              |           \_____/|             |]],
        [[   |              |               __/              |]],
        [[  /                \            _/                 |]],
        [[  |                |           /                  _/]],
        [[ /                  \         |                  /  ]],
        [[ |                  |         |                 |_  ]],
        [[ |                  |          \                  \ ]],
        [[/                    \        /                    \]],
        [[|____________________|        |____________________|]],
    },
    opts = {
        position = "center",
        hl = "Number",
        wrap = "overflow";
    },
}

local footer = {
    type = "text",
    val = "",
    opts = {
        position = "center",
        hl = "Number",
    },
}

--- @param sc string
--- @param txt string
--- @param keybind string optional
--- @param keybind_opts table optional
local function button(sc, txt, keybind, keybind_opts)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
        position = "center",
        shortcut = sc,
        cursor = 5,
        width = 50,
        align_shortcut = "right",
        hl = "Identifier",
        hl_shortcut = "Comment",
    }
    if keybind then
        keybind_opts = if_nil(keybind_opts, {
            noremap = true,
            silent = true,
            nowait = true
        })
        opts.keymap = { "n", sc_, keybind, keybind_opts }
    end

    local function on_press()
        local key = vim.api.nvim_replace_termcodes(sc_ .. "<Ignore>", true, false, true)
        vim.api.nvim_feedkeys(key, "normal", false)
    end

    return {
        type = "button",
        val = txt,
        on_press = on_press,
        opts = opts,
    }
end

local buttons = {
    type = "group",
    val = {
        button("e", "ﱐ  New file", "<cmd>ene <CR>"),
        button("SPC f f", "  Find file"),
        button("SPC f o", "ﭯ  Recently opened files"),
        button("SPC f c", "  Git commits"),
        button("SPC f s", "  Git status"),
        button("q", "  Quit", "<cmd>q <CR>"),
    },
    opts = {
        spacing = 1,
    },
}

local section = {
    header = default_header,
    buttons = buttons,
    footer = footer,
}

local opts = {
    layout = {
        { type = "padding", val = 2 },
        section.header,
        { type = "padding", val = 2 },
        section.buttons,
        section.footer,
    },
    opts = {
        margin = 5,
    },
}

return {
    button = button,
    section = section,
    opts = opts,
}
