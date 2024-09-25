
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("quadraticequation", {
        t([[
struct quad_eq {
	double a, b, c;
	complex<double> r1, r2, D;
	quad_eq() {}
	quad_eq(double a, double b, double c) : a(a), b(b), c(c) {D = b * b - 4 * a * c; solve();}

	bool realroots() {if (D.imag() == 0)return true; return false;}

	void solve() {r1 = (-b + sqrt(D)) / (2 * a); r2 = (-b - sqrt(D)) / (2 * a);}

	vector<complex<double>> roots() {return {r1, r2};}
};
]]),
    }),
})
