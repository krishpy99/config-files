
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("lazytree", {
        t([[
template<typename T>
struct lazy_tree : vector<T> {
	using F = function<T(const T&, const T&)>;
	int n; F op; T id;

	lazy_tree(int n, F f, T val) : vector<T>(2 * n, val), n(n), op(f), id(val) {}
	//UNFINISHED BUSINESS
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


};
]]),
    }),
})
