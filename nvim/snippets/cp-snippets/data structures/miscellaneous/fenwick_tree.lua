local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tfenwick", snippetType = "autosnippet"}, {
    t("
template<typename T>
struct fenwick_tree : vector<T> {
	int n;
	fenwick_tree(int n, const T val = T()) : vector<T> (n, val), n(n) {}

	T query(int r) {
		T ret = 0;
		for (; r >= 0; r = (r & (r + 1)) - 1)
			ret += (*this)[r];
		return ret;
	}

	T query(int l, int r) {
		return query(r) -  query(l - 1);
	}

	void update(int idx, T delta) {
		for (; idx < n; idx = idx | (idx + 1))
			(*this)[idx] += delta;
	}
};
"),
  }),
}
