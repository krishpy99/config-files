local ls = require("luasnip")
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt


local unweighted_graph_boiler = s("stunweightedgraph",
	fmt(
		[[
template<typename T>
struct graph : vector<vector<pair<int, T>>> {{
    int n;
    graph(int n) : vector<vector<pair<int, T>>>(n), n(n) {{}}

    void add(int x, int y, T z) {{ (*this)[x].push_back({{y, z}}); (*this)[y].push_back({{x, z}}); }}

    friend void sort(graph &g) {{ for (auto &i : g) sort(i.begin(), i.end()); }}
}};
]]
	, {}))

ls.add_snippets("cpp", {
	unweighted_graph_boiler
  })
