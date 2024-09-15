local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tdfsgraph", snippetType = "autosnippet"}, {
    t("
template<class G>
void dfs(G& g, int root) {
	vector<int> vis(g.n); sort(g);
	auto doit = [&](int r, int p, const auto & self) -> void {
		vis[r] = 1;
		for (auto i : g[r]) {
			if (!vis[i]) self(i, r, self);
		}
	};
	doit(root, root, doit);
}
"),
  }),
}
