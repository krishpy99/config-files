
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("checkbipartite", {
        t([[
template<class G>
vector<vector<int>> bipartite(G& g) {
	vector<int> color(g.n), vis(g.n, 0);
	auto dfs = [&](int node, int colour, const auto & self) -> void {
		if (vis[node]) {
			if (colour != color[node])color[node] = -1;
			return;
		}
		color[node] = colour; vis[node] = 1;
		for (auto i/*use [i,j] for weighted*/ : g[node]) {
			self(i, colour ^ 1, self);
		}
	};
	for (int i = 0; i < g.n; i++) {
		if (!vis[i])dfs(i, i, dfs);
	}
	vector<vector<int>> res(2);
	for (int i = 0; i < g.n; i++) {
		if (color[i] == -1)return {{}};
		res[color[i]].push_back(i);
	}
	if (res[0].size() == 0 || res[1].size() == 0)return {{}};
	return res;
}
]]),
    }),
})
