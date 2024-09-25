
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("segmenttree", {
        t([[
template<typename T>
struct segment_tree : vector<T> {
	using F = function<T(const T&, const T&)>;
	int n; F op; T id;

	segment_tree(int n, F f, T val) : vector<T>(2 * n, val), n(n), op(f), id(val) {}

	template<typename U>
	void build(vector<U> a) {
		auto re = [&](int v, int tl, int tr, const auto & self) -> void{
			if (tl == tr) (*this)[v] = a[tl];
			else {
				int tm = (tl + tr) / 2, low = v + 1, high = v + 2 * (tm - tl + 1);
				self(low, tl, tm, self);
				self(high, tm + 1, tr, self);
				(*this)[v] = op((*this)[low], (*this)[high]);
			}
		};
		re(0, 0, n - 1, re);
	}

	template <typename U>
	void update(int pos, U new_val) {
		auto re = [&](int v, int tl, int tr, int pos, T new_val, const auto & self) -> void{
			if (tl == tr) (*this)[v] = new_val;
			else {
				int tm = (tl + tr) / 2, low = v + 1, high = v + 2 * (tm - tl + 1);
				if (pos <= tm) self(low, tl, tm, pos, new_val, self);
				else self(high, tm + 1, tr, pos, new_val, self);
				(*this)[v] = op((*this)[low], (*this)[high]);
			}
		};
		re(0, 0, n - 1, pos, new_val, re);
	}

	T query(int l, int r) {
		auto re = [&](int v, int tl, int tr, int l, int r, const auto & self) -> T {
			if (l > r) return id;
			if (l == tl && r == tr) return (*this)[v];
			int tm = (tl + tr) / 2, low = v + 1, high = v + 2 * (tm - tl + 1);
			int res1 =  self(low, tl, tm, l, min(r, tm), self);
			int res2 =  self(high, tm + 1, tr, max(l, tm + 1), r, self);
			return op(res1, res2);
		};
		return re(0, 0, n - 1, l, r, re);
	}
};
]]),
    }),
})
