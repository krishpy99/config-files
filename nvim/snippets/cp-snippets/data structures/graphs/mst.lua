local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tminimumspanningtree", snippetType = "autosnippet"}, {
    t("
vector<vector<pair<int, int>>> mst() {
	vector<vector<int>> ed;
	for (int i = 0; i < n; i++)
		for (auto [j, k] : g[i])
			if (j > i) ed.push_back({k, i, j});

	sort(ed.rbegin(), ed.rend());
	vector<int> p(n);
	iota(p.begin(), p.end(), 0);
	auto find = [&](int x, const auto & self) -> int {
		if (x == p[x])return x;
		return self(p[x], self);
	};

	auto join = [&](int x, int y) -> void{
		x = find(x, find);
		y = find(y, find);
		p[y] = x;
	};

	vector<vector<int>> edges;
	while (ed.size() > 0) {
		if (find(ed.back()[1], find) != find(ed.back()[2], find)) {
			edges.push_back(ed.back());
			join(ed.back()[1], ed.back()[2]);
		}
		ed.pop_back();
	}
	vector<vector<pair<int, int>>> v(n);
	for (auto i : edges) {
		v[i[1]].push_back({i[2], i[0]});
		v[i[2]].push_back({i[1], i[0]});
	}
	return v;// return edges if you want just edges
}
"),
  }),
}
