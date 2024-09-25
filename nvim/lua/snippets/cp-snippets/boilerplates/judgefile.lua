
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("judge", {
        t([[
#ifndef ONLINE_JUDGE
	freopen("input.in", "r", stdin);
	freopen("output.in", "w", stdout);
#endif
]]),
    }),
})
