
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("circleboiler", {
        t([[
struct Circle {
	pt c; double r;
	Circle() {}
	Circle
};
]]),
    }),
})
