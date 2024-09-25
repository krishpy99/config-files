
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("toposort", {
        t([[
template<class G>
vector<int> topological_sort(const G& g) {
	vector<int> in_degree(g.n, 0);
	for (int u = 0; u < g.n; u++) {
		for (auto i : g[u])
			in_degree[i]++;
	}
	priority_queue<int, vector<int>, greater<int>> pq;
	for (int i = 0; i < g.n; i++)if (in_degree[i] == 0)pq.push(i);
	int cnt = 0;
	vector<int> top_order;
	while (!pq.empty()) {
		int u = pq.top(); pq.pop(); top_order.push_back(u);
		for (auto i : g[u]) {if (--in_degree[i] == 0)pq.push(i);}
		cnt++;
	}
	return top_order;
}
]]),
    }),
})
