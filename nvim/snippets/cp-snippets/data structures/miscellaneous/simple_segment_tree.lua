local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tezsegtree", snippetType = "autosnippet"}, {
    t("
template<typename T>
struct simple_segment_tree : vector<T> {
	using F = function<T(const T&, const T&)>;
	int n; F op; T id;

	simple_segment_tree(int n, F f, T val) : vector<T>(2 * n, val), n(n), op(f), id(val) {}

	template<typename U>
	void build(vector<U> a) {
		for (int i = n; i < 2 * n; i++) {(*this)[i] = a[i - n];}
		for (int i = n - 1; i > 0; i--) {
			(*this)[i] = op((*this)[i << 1], (*this)[(i << 1) | 1]);
		}
	}

	template <typename U>
	void update(int pos, U new_val) {
		for ((*this)[pos += n] = new_val; pos > 1; pos >>= 1)
			(*this)[pos >> 1] = op((*this)[pos], (*this)[pos ^ 1]);
	}

	T query(int l, int r) {
		T res = id; ++r;
		for (l += n, r += n; l < r; l >>= 1, r >>= 1) {
			if (l & 1) res = op(res, (*this)[l++]);
			if (r & 1) res = op(res, (*this)[--r]);
		}
		return res;
	}
};
"),
  }),
}
