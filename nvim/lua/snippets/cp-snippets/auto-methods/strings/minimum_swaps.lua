
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("minimumswaps", {
        t([[
auto minswaps = [&](string x, string y) -> int64_t {
		// make x from y
		vector<vector<int>> vx(256), vy(256);
		vector<int> cnt(256); int n = x.length();
		fenwick_tree<int> f(n);

		for (int i = 0; i < (int)x.length(); i++) {
			vx[x[i]].push_back(i);
			vy[y[i]].push_back(i);
		}

		int64_t ans = 0;
		for (int i = 0; i < (int)x.length(); i++) {
			int cur = vx[y[i]][cnt[y[i]]];
			int oldC = cur; cur += f.query(cur, n - 1);
			ans += cur - i; f.update(oldC, 1); cnt[y[i]]++;
		}
		return ans;
	};
]]),
    }),
})
