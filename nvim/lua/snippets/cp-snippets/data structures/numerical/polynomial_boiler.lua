
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("polynomial", {
        t([[
template <typename T>
struct polynomial : public vector<T> {
	template <typename...args>
	polynomial(args...A) : vector<T>(A...) {}
	polynomial(const initializer_list<T> &l) : vector<T>(l) {}

	int deg() const noexcept {return (int) this->size() - 1;}
	void normalize() {for (int i = deg(); i >= 0; i--) {if ((*this)[i]) {this->resize(i + 1); return;}} this->clear();}

	polynomial &operator+=(const polynomial &q) {
		if ((int)q.size() > this->size()) this->resize((int)q.size());
		for (int i = 0; i < (int)q.size(); i++)(*this)[i] += q[i]; normalize(); return *this;
	}

	polynomial &operator-=(const polynomial &q) {
		if (q.size() > this->size())this->resize((int)q.size());
		for (int i = 0; i < (int)q.size(); i++)(*this)[i] -= q[i]; normalize(); return *this;
	}

	void naive_mul(polynomial &a, const polynomial &b) const {
		polynomial result(a.deg() + b.deg() + 1);
		for (int i = 0; i <= a.deg(); i++) {for (int j = 0; j <= b.deg(); j++) result[i + j] += a[i] * b[j];}
		a.swap(result);
	}

	void ntt_mul(polynomial &fa, polynomial fb) const {
		//fa = ntt::convolution(fa, fb);
	}

	polynomial &operator*=(const polynomial &q) {
		if (this->empty() || q.empty())this->clear();
		else if (this->size() <= 60)naive_mul(*this, q);
		//else ntt_mul(*this, q);
		normalize(); return *this;
	}

	polynomial &operator*=(const T &val) {for (auto &x : *this) x *= val; return *this;}

	void divide(polynomial &a, polynomial b) const {
		if (a == b) {a = polynomial({1}); return;}
		assert(!b.empty()); if (a.deg() < b.deg()) {a.clear(); return;}
		reverse(a.begin(), a.end()); int sz = a.deg() - b.deg() + 1;
		a %= sz; reverse(b.begin(), b.end()); a *= b.inv(sz); a %= sz; reverse(a.begin(), a.end());
	}

	polynomial &operator/=(const polynomial &q) {divide(*this, q); normalize(); return *this;}
	polynomial &operator/=(T val) {val = 1 / val; for (auto &x : *this) x *= val; return *this;}
	polynomial &operator%=(const polynomial &q) {*this -= q * (*this / q); normalize(); return *this;}
	polynomial &operator%=(size_t k) {if (k <= (size_t)deg()) {this->resize(k);} return *this;}

	polynomial &operator<<=(size_t k) {
		if (this->size() <= k) this->clear();
		else {polynomial result(this->begin() + k, this->end()); this->swap(result);} return *this;
	}

	polynomial &operator>>=(size_t k) {
		polynomial result(this->size() + k);
		copy(this->begin(), this->end(), result.begin() + k); this->swap(result); return *this;
	}

	friend polynomial operator+(polynomial p, const polynomial &q) {p += q; return p;}
	friend polynomial operator-(polynomial p, const polynomial &q) {p -= q; return p;}
	friend polynomial operator*(polynomial p, const polynomial &q) {p *= q; return p;}
	friend polynomial operator*(polynomial p, const T &val) {p *= val; return p;}
	friend polynomial operator*(const T &val, polynomial p) {p *= val; return p;}
	friend polynomial operator/(polynomial p, const polynomial &q) {p /= q; return p;}
	friend polynomial operator/(polynomial p, const T &val) {p /= val; return p;}
	friend polynomial operator%(polynomial p, const polynomial &q) {p %= q; return p;}
	friend polynomial operator%(polynomial p, size_t k) {p %= k; return p;}
	friend polynomial operator<<(polynomial p, size_t k) {p <<= k; return p;}
	friend polynomial operator>>(polynomial p, size_t k) {p >>= k; return p;}

	polynomial inv(int k = -1) const {
		if (k == -1)k = this->size(); assert(!this->empty() && (*this)[0] != 0); polynomial b(1, 1 / (*this)[0]);
		for (int i = 2; i <= (k << 1); i <<= 1) {
			polynomial temp = (*this) % i; temp *= b, temp %= i; temp *= T(-1), temp[0] += 2; b *= temp, b %= i;
		}
		b.resize(k); return b;
	}

	polynomial derivative() const {
		if (deg() < 1) {return {};} polynomial result(this->size() - 1);
		for (int i = 1; i < this->size(); i++) {result[i - 1] = i * (*this)[i];} return result;
	}

	polynomial integral() const {
		if (this->empty()) {return {};} polynomial result(this->size() + 1);
		for (int i = 0; i < this->size(); i++) {result[i + 1] = (*this)[i] / (i + 1);} return result;
	}

	polynomial log(int k = -1) const {
		assert(!this->empty() && (*this)[0] == 1); if (k == -1)k = this->size();
		polynomial result = ((derivative() % k) * inv(k)).integral(); result.resize(k); return result;
	}

	polynomial exp(int k = -1) const {
		assert(this->empty() || (*this)[0] == 0); if (k == -1)k = this->size(); polynomial q(1, 1);
		for (int i = 2; i <= (k << 1); i <<= 1) {polynomial temp = polynomial(1, 1) + (*this % i) - q.log(i); q *= temp, q %= i;}
		q.resize(k); return q;
	}

	polynomial pow(int n, int k = -1) const {
		if (k == -1) {k = this->size();} if (this->empty()) {return polynomial(k);} T alpha = 0; int pw = 0;
		for (int i = 0; i < this->size(); i++) {if ((*this)[i]) {alpha = (*this)[i]; pw = i; break;}}
		if ((long long)pw * n >= k) {return polynomial(k);} polynomial<T> b = (*this) << pw;
		b /= alpha; b = (T(n) * b.log(k)).exp(k); b >>= pw * n; b *= alpha.pow(n); b.resize(k); return b;
	}

	template <typename U>
	vector<T> multipoint_evaluation(const vector<U> &pt) {
		int n = (int) pt.size(); vector<polynomial> tree(2 * n);
		for (int i = 0; i < n; i++)tree[i + n] = {T(-pt[i]), 1};
		for (int i = n - 1; i > 0; i--) {tree[i] = tree[i << 1] * tree[i << 1 | 1];} tree[1] = *this % tree[1];
		for (int i = 1; i < n; i++) {tree[i << 1] = tree[i] % tree[i << 1]; tree[i << 1 | 1] = tree[i] % tree[i << 1 | 1];}
		vector<T> result(n); for (int i = 0; i < n; i++) {result[i] = (tree[i + n].empty() ? T(0) : tree[i + n][0]);}
		return result;
	}
};
]]),
    }),
})
