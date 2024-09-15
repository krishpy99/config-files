local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tdiameter", snippetType = "autosnippet"}, {
    t("
template<class G>
int diameter(G& g) {
	auto bfs = [&](int src) -> pair<int, int> {
		queue<pair<int, int>> q; q.push({src, 0});
		vector<bool> vis(g.n, false);
		pair<int, int> p;
		while (!q.empty()) {
			p = q.front(); q.pop(); vis[p.first] = true;
			for (int i : g[p.first]) {
				if (!vis[i]) q.push({i, p.second + 1});
			}
		}
		return p;
	};
	pair<int, int> e1 = bfs(0);
	pair<int, int> e2 = bfs(e1.first);
	return e2.second;
}
"),
  }),
}
