
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("arraydfs2D", {
        t([[
auto arraydfs2D = [&](vector<vector<int>> v) -> void{
	int n = v.size(), m = v[0].size();
	vector<vector<int>> vis(n, vector<int>(m, 0));
	vector<vector<int>> lvl(n, vector<int>(m, 0));
	auto dfs = [&](int x, int y, int level, const auto & self) -> void {
		if (x >= n || x < 0 || y >= m || y < 0)return;
		if (vis[x][y]) {lvl[x][y] = min(level, lvl[x][y]); return;}
		vis[x][y] = 1; lvl[x][y] = level;
		self(x + 1, y, level + 1, self);
		self(x - 1, y, level + 1, self);
		self(x, y + 1, level + 1, self);
		self(x, y - 1, level + 1, self);
	};
	dfs(0, 0, 0, dfs);
};
]]),
    }),
})
