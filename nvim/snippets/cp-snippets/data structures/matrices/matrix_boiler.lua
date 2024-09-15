local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tmatrixinit", snippetType = "autosnippet"}, {
    t("
template<typename T>
struct matrix : vector<vector<T>> {
	int n, m;
	matrix(int n, int m, const T val = T()) : vector<vector<T>> (n, vector<T>(m, val)), n(n), m(m) {}

	void get() {for (auto &i : (*this))for (auto &j : i)cin >> j;}
	void put() {for (auto i : (*this)) {for (auto j : i)cout << j << \" \"; cout << \"\n\";}}

	matrix &operator+=(const matrix &mat) {
		assert(n == mat.n && m == mat.m);
		for (int i = 0; i < n; i++) {for (int j = 0; j < m; j++) {(*this)[i][j] += mat[i][j];}}
		return *this;
	}

	matrix &operator-=(const matrix &mat) {
		assert(n == mat.n && m == mat.m);
		for (int i = 0; i < n; i++) {for (int j = 0; j < m; j++) {(*this)[i][j] -= mat[i][j];}}
		return *this;
	}

	matrix &operator*=(const matrix &mat) {
		assert(m == mat.n); matrix res(n, mat.m);
		for (int i = 0; i < n; i++) {for (int j = 0; j < mat.m; j++) {for (int k = 0; k < m; k++) {res[i][j] += (*this)[i][k] * mat[k][j];}}}
		this->swap(res); return *this;
	}

	matrix &operator*=(const T &val) {
		for (int i = 0; i < n; i++) {for (int j = 0; j < m; j++) {(*this)[i][j] *= val;}}
		return *this;
	}

	friend matrix operator+(matrix a, const matrix &b) {a += b; return a;}
	friend matrix operator-(matrix a, const matrix &b) {a -= b; return a;}
	friend matrix operator*(matrix a, const matrix &b) {a *= b; return a;}
	friend matrix operator*(matrix a, const T &val) {a *= val; return a;}
	friend matrix operator*(const T &val, matrix a) {a *= val; return a;}

	static matrix identity(int n) {matrix I(n, n); for (int i = 0; i < n; i++) {I[i][i] = 1;} return I;}
	matrix pow(int64_t k) {matrix ans = identity(n), x = *this; for (; k; k /= 2) {if (k & 1) ans *= x; x *= x;} return ans;}
};
"),
  }),
}
