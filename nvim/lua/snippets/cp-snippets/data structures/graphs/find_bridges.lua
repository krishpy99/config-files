
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("findbridges", {
        t([[
template <class G>
vector<pair<int, int>> find_bridges(const G& g) {
	int timer = 0; vector<int> vis(g.n, 0), in(g.n, -1);
	vector<int> low(g.n, -1); vector<pair<int, int>> bridges;
	auto dfs = [&](int r, int p, const auto & self) -> void {
		vis[r] = 1; in[r] = low[r] = timer++;
		for (int to : g[r]) {
			if (!vis[to]) {
				self(to, r, self); low[r] = min(low[r], low[to]);
				if (low[to] > in[r]) bridges.push_back({r, to});
			} else if (to != p) low[r] = min(low[r], in[to]);
		}
	};
	for (int i = 0; i < g.n; i++) {
		if (vis[i] == 0) dfs(i, -1, dfs);
	}
	return bridges;
}
]]),
    }),
})
