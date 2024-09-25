
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("weightedgraph", {
        t([[
template<typename T>
struct graph : vector<vector<pair<int, T>>> {
	int n;
	graph(int n) : vector<vector<pair<int, T>>>(n), n(n) {}

	void add(int x, int y, T z) {(*this)[x].push_back({y, z}); (*this)[y].push_back({x, z});}
	friend void sort(graph &g) {for (auto &i : g)sort(i.begin(), i.end());}
};
]]),
    }),
})
