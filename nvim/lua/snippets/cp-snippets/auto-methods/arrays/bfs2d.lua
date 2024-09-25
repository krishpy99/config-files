
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("arraybfs2D", {
        t([[
auto arraybfs2D = [&](vector<pair<int, int>> sources, vector<vector<int>> v) -> vector<vector<int>> {
	int n = v.size(), m = v[0].size(); deque<vector<int>> d;
	vector<vector<int>> lvl(n, vector<int>(m, -1)), vis(n, vector<int>(m, 0));
	for (auto [i, j] : sources) {
		vis[i][j] = 1; d.push_back({i, j, 0});
	}
	auto check = [&](int i, int j) -> bool{
		if (i < n && j < m && i >= 0 && j >= 0 && !vis[i][j])return true;
		return false;
	};
	while (d.size() > 0) {
		int i = d.front()[0], j = d.front()[1], l = d.front()[2]; 
		lvl[i][j] = l; d.pop_front();
		if (check(i + 1, j))vis[i + 1][j] = 1, d.push_back({i + 1, j, l + 1});
		if (check(i, j + 1))vis[i][j + 1] = 1, d.push_back({i, j + 1, l + 1});
		if (check(i - 1, j))vis[i - 1][j] = 1, d.push_back({i - 1, j, l + 1});
		if (check(i, j - 1))vis[i][j - 1] = 1, d.push_back({i, j - 1, l + 1});
	}
	return lvl;
};
]]),
    }),
})
