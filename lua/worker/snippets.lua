local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local date = function() return {os.date('%Y-%m-%d')} end

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "qdate",
            namr = "Date",
            dscr = "Date in the form of YYYY-MM-DD",
        }, {
            func(date, {}),
        }),
    },
})

local arrow_function = function()
    return {
        "(${1:params}) => {",
        "\t${0:code}",
        "}"
    }
end

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "qarrow",
            name = "Arrow Function",
            dscr = "Arrow function snippet",
        }, {
            func(arrow_function, {}),
        }),
    },
})
