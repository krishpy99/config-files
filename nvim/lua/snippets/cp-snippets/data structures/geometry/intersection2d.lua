
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("2dintersectionpoint", {
        t([[
pt intersect(pt a, pt d1, pt b, pt d2) {
	return a1 + (b - a).cross(d2) / d1.cross(d2) * d1;
}
]]),
    }),
})
