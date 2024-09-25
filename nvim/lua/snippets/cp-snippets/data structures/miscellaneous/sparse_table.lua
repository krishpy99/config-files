
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("sparsetable", {
        t([[
template<typename T>
struct sparse_table : vector<vector<T>> {
	using F = function<T(const T&, const T&)>;

	int n, k = 25; F op;

	sparse_table(int n, F f) : vector<vector<T>> (n, vector<T>(k + 1)), n(n), op(f) {}

	template<typename U>
	void build(vector<U> v) {
		for (int i = 0; i < n; i++)
			(*this)[i][0] = v[i];
		for (int j = 1; j <= k; j++) {
			for (int i = 0; i + (1 << j) <= n; i++) {
				(*this)[i][j] = op((*this)[i][j - 1], (*this)[i + (1 << (j - 1))][j - 1]);
			}
		}
	}

	T query(int L, int R) {
		assert(L >= 0 && L < n && R >= 0 && R < n);
		int j = 32 - __builtin_clz(R - L + 1) - 1;
		return op((*this)[L][j], (*this)[R + 1 - (1 << j)][j]);
	}
};
]]),
    }),
})
