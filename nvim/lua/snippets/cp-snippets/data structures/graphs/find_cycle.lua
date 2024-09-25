
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("findcycle", {
        t([[
template<class G>
vector<int> find_cycle(const G& g) {
	vector<int> v, vis(g.n, 0);
	auto fun = [&](int r, int p, const auto & self) -> bool{
		v.push_back(r);
		vis[r] = 1;
		for (auto i : g[r]) {
			if (!vis[i]) {if (self(i, p, self))return true;}
			else {v.push_back(i); return true;}
		}
		v.pop_back();
		return false;
	};
	fun(0, 0, fun); reverse(v.begin(), v.end());
	while (v.back() != v[0])v.pop_back();
	if (v.size() == 1)v.clear();
	return v;
}
]]),
    }),
})
