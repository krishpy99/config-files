
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("heavylightdecomposition", {
        t([[
template<typename T, int N>
struct heavy_light_decompose {
	using F = function<T(const T&, const T&)>;
	array<int, N>  parent, heavy, depth, root, treePos;
	segment_tree<T> s; F op;
	//UNFINISHED BUSINESS
	template<class G>
	heavy_light_decompose(G& g, F f) : op(f) {
		int n = g.n; heavy.fill(-1);
		parent[0] = -1; depth[0] = 0; dfs(g, 0);
		for (int i = 0, cp = 0; i < n; ++i) {
			if ()
			}
	}

	template<class G>
	int dfs(const G& g, int v) {
		int sz = 1, maxsubtr = 0;
		for (int u : g[v])
			if (u != parent[v]) {
				parent[u] = v; depth[u] = depth[v] + 1;
				int subtr = dfs(g, u);
				if (subtr > maxsubtr) heavy[v] = u, maxsubtr = subtr;
				sz += subtr;
			}
		return sz;
	}

};
]]),
    }),
})
