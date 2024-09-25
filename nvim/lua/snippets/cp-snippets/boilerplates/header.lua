
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("header", {
        t([[
/*
	Author : yk_2310/theLastAckerman 
	Date   : 
	Time   : 
*/
]]),
    }),
})
