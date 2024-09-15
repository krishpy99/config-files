local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tfindcentroid", snippetType = "autosnippet"}, {
    t("
template<class G>
pair<int, int> find_centroids(G& g) {
	pair<int, int> centroids = { -1, -1}; int qq = 1e9;
	auto doit = [&](int r, int p, const auto & self) -> int {
		int c = 1, q = 0;
		for (auto i : g[r]) {
			if (i != p) {
				int x = self(i, r, self);
				c += x; q = max(q, x);
			}
		}
		q = max(q, g.n - c);
		if (q < qq) {
			centroids.first = r, centroids.second = -1, qq = q;
		} else if (qq == q) {
			centroids.second = r;
		}
		return c;
	};
	doit(0, 0, doit); return centroids;
}
"),
  }),
}
