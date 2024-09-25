
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("autolcm", {
        t([[
auto lcm = [&](vector<int64_t> v) -> int64_t{
		int64_t ans = v[0];
		for (int i = 1; i < (int)v.size(); i++) {
			ans = (v[i] * ans) / __gcd(v[i], ans);
		}
		return ans;
	};
]]),
    }),
})
