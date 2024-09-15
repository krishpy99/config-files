local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tdijkstrasparse", snippetType = "autosnippet"}, {
    t("
template<class G>
vector<int> dijkstra(G& g, int source) {
	sort(g);
	priority_queue<pair<int, int>, vector<pair<int, int>>, greater<pair<int, int>>> pq;
	vector<int> dist(g.n, 1e9); pq.push({0, source}); dist[source] = 0;
	while (!pq.empty()) {
		int u = pq.top().second;
		if (pq.top().second != dist[u]) {pq.pop(); continue;}
		pq.pop();
		for (auto [i, j] : g[u]) {
			if (dist[i] > dist[u] + j) {
				dist[i] = dist[u] + j; pq.push({dist[i], i});
			}
		}
	}
	return dist;
}
"),
  }),
}
