local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tleastcommonancestor", snippetType = "autosnippet"}, {
    t("
struct least_common_ancestor {
	vector<vector<int>> st;
	vector<int> level;

	template<class G>
	least_common_ancestor(const G& g, int root = 0) {
		st = vector<vector<int>>(g.n, vector<int>(26));
		level = vector<int>(g.n);
		auto dfs = [&](int r, int p, int l, const auto & self) -> void{
			level[r] = l; st[r][0] = p;
			for (auto i : g[r]) {
				if (i != p)self(i, r, l + 1, self);
			}
		};
		dfs(root, root, 0, dfs);
		for (int j = 1; j < 26; j++) {
			for (int i = 0; i < g.n; i++) {
				st[i][j] = st[st[i][j - 1]][j - 1];
			}
		}
	}

	int query(int u, int v) {
		auto jump = [&](int node, int distance) {
			if (distance == 0) return node;
			int x = node, counter = 0;
			while (distance) {
				if (distance % 2) x = st[x][counter];
				distance /= 2; counter++;
			}
			return x;
		};
		if (level[u] > level[v]) u = jump(u, level[u] - level[v]);
		else v = jump(v, level[v] - level[u]);
		if (u == v) return v;
		for (int k = 25; k >= 0; k--) {
			if (st[u][k] != st[v][k]) u = st[u][k], v = st[v][k];
		}
		return st[u][0];
	}
};
"),
  }),
}
