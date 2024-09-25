
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("debug", {
        t([[
template<typename... T>
void deb(T... args) {
	((cout << args << ' '), ...); cout << '\n';
}
]]),
    }),
})
