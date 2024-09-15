local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tdsu", snippetType = "autosnippet"}, {
    t("
struct dsu : vector<int> {
	int n;
	dsu(int n) : vector<int>(n), n(n) {iota((*this).begin(), (*this).end(), 0);}
	int find(int v) {
		if (v == (*this)[v]) return v;
		return (*this)[v] = find((*this)[v]);
	}
	void join(int a, int b) {
		a = find(a); b = find(b);
		if (a != b) (*this)[b] = a;
	}
};
"),
  }),
}
