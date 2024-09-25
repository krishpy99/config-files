
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("arraydfs3D", {
        t([[
auto arraydfs3D = [&](vector<vector<vector<int>>> v) -> void{
	int n = v.size(), m = v[0].size(), o = v[0][0].size();
	vector<vector<vector<int>>> vis(n, vector<vector<int>>(m, vector<int>(o, 0)));
	vector<vector<vector<int>>> lvl(n, vector<vector<int>>(m, vector<int>(o, 0)));
	auto dfs = [&](int x, int y, int z, int level, const auto & self) -> void {
		if (x >= n || x < 0 || y >= m || y < 0 || z >= o || z < 0)return;
		if (vis[x][y][z]) {lvl[x][y][z] = min(level, lvl[x][y][z]); return;}
		vis[x][y][z] = 1; lvl[x][y][z] = level;
		self(x + 1, y, z, level + 1, self);
		self(x - 1, y, z, level + 1, self);
		self(x, y + 1, z, level + 1, self);
		self(x, y - 1, z, level + 1, self);
		self(x, y, z + 1, level + 1, self);
		self(x, y, z - 1, level + 1, self);
	};
	dfs(0, 0, 0, 0, dfs);
};
]]),
    }),
})
