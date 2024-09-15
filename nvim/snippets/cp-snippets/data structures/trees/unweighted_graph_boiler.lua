local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tunweightedgraph", snippetType = "autosnippet"}, {
    t("
struct graph : vector<vector<int>> {
	int n;
	graph(int n) : vector<vector<int>>(n), n(n) {}

	void add(int x, int y) {(*this)[x].push_back(y); (*this)[y].push_back(x);}
	friend void sort(graph &g) {for (auto &i : g)sort(i.begin(), i.end());}
};
"),
  }),
}
