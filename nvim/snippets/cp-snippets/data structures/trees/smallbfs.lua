local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tbfsgraph", snippetType = "autosnippet"}, {
    t("
template<class G>
vector<int> bfs(G& g, int root) {
	queue<int> q; vector<int> dist(g.n, 0), vis(g.n, 0);
	vis[root] = 1; q.push(root); sort(g);
	while (q.size() > 0) {
		int v = q.front(); q.pop();
		for (auto i : g[v]) {
			if (vis[i] == 0) {
				vis[i] = 1, q.push(i), dist[i] = dist[v] + 1;
			}
		}
	}
	return dist;
}
"),
  }),
}
