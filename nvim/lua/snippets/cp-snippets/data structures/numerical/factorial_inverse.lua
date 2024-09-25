
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("facinverse", {
        t([[
template<typename T, int N>
struct inverse : vector<T> {
	constexpr inverse() : vector<T>(N + 1) {
		(*this)[0] = 1; T cur = 1;
		for (int i = 1; i <= N; i++)
			cur *= i, (*this)[i] = cur.inv();
	}
};

constexpr int X = 2000000;
inverse<mint, X> inv;
]]),
    }),
})
