
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("permuteandcombine", {
        t([[
template<typename T, int N>
struct factorial : vector<T> {
	constexpr factorial() : vector<T>(N + 1) {
		(*this)[0] = 1;
		for (int i = 1; i <= N; i++)
			(*this)[i] = (*this)[i - 1] * i;
	}
};

template<typename T, int N>
struct inverse : vector<T> {
	constexpr inverse() : vector<T>(N + 1) {
		(*this)[0] = 1; T cur = 1;
		for (int i = 1; i <= N; i++)
			cur *= i, (*this)[i] = cur.inv();
	}
};

template<typename T, int N>
struct permute_and_combine {

	factorial<T, N> fac; inverse<T, N> inv;

	T nCr(int n, int r) {
		if (r > n || r < 0)return 0;
		return fac[n] * inv[r] * inv[n - r];
	}

	T nPr(int n, int r) {
		if (r > n || r < 0)return 0;
		return fac[n] * inv[n - r];
	}
};

constexpr int X = 2000000;
permute_and_combine<mint, X> pc;
]]),
    }),
})
