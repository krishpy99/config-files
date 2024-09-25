
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("modularint", {
        t([[
template<int M>
struct mod_int {
	static_assert(0 < M, "Module must be positive");
	int val;
	mod_int(): val() {}
	mod_int(int64_t x) : val(x % M) {if (val < 0) val += M;}
	mod_int exp(int64_t n) const {mod_int ans = 1, x(*this); while (n) { if (n & 1) ans *= x; x *= x; n /= 2; } return ans;}
	mod_int inv() const { return exp(M - 2); }

	friend mod_int exp(const mod_int &m, int64_t n) {return m.exp(n);}
	friend mod_int inv(const mod_int &m) {return m.inv();}

	mod_int operator+() const {mod_int m; m.val = val; return m;}
	mod_int operator-() const {mod_int m; m.val = M - val; return m;}
	mod_int &operator+=(const mod_int &m) {if ((val += m.val) >= M) val -= M; return *this;}
	mod_int &operator-=(const mod_int &m) {if ((val -= m.val) < 0) val += M; return *this;}
	mod_int &operator*=(const mod_int &m) {val = (int64_t) val * m.val % M; return *this;}
	mod_int &operator/=(const mod_int &m) {val = (int64_t) val * m.inv().val % M; return *this;}

	friend mod_int operator+ (const mod_int &lhs, const mod_int &rhs) {return mod_int(lhs) += rhs;}
	friend mod_int operator- (const mod_int &lhs, const mod_int &rhs) {return mod_int(lhs) -= rhs;}
	friend mod_int operator* (const mod_int &lhs, const mod_int &rhs) {return mod_int(lhs) *= rhs;}
	friend mod_int operator/ (const mod_int &lhs, const mod_int &rhs) {return mod_int(lhs) /= rhs;}
	friend bool operator==(const mod_int &lhs, const mod_int &rhs) {return lhs.val == rhs.val;}
	friend bool operator!=(const mod_int &lhs, const mod_int &rhs) {return lhs.val != rhs.val;}

	mod_int &operator++() {return *this += 1;}
	mod_int &operator--() {return *this -= 1;}
	mod_int operator++(int) {mod_int result(*this); *this += 1; return result;}
	mod_int operator--(int) {mod_int result(*this); *this -= 1; return result;}

	template <typename T> explicit operator T() const {return T(val);}
	friend std::ostream &operator<<(std::ostream &os, const mod_int &m) {return os << m.val;}
	friend std::istream &operator>>(std::istream &is, mod_int &m) {int64_t x; is >> x; m = x; return is;}
};
using mint = mod_int<1000000007>;
]]),
    }),
})
