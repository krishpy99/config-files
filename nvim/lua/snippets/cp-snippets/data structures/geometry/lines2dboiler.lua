
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("2dlineboiler", {
        t([[
struct Line {
	double a, b, c;

	Line() {}
	Line(double m, double c) : c(-1 * c) {a = -m, b = 1;}
	Line(pt p, pt q) {a = p.y - q.y, b = q.x - p.x, c = p.x * q.y - q.x * p.y;}

	double slope() {assert(b != 0); return -a / b;}
	double y_intercept() {assert(b != 0); return -c / b;}
	double x_intercept() {assert(a != 0); return -c / a;}
	bool pass(pt r) {if (a * r.x + b * r.y + c == 0)return true; return false;}

	bool not_parallel(Line l) {
		if (b == 0 && l.b == 0)return false;
		if (b != 0 && l.b != 0 && slope() == l.slope())return false;
		return true;
	}

	pt intersection_point(Line l) {
		assert(not_parallel(l));
		return pt((l.b * c - b * l.c) / (l.a * b - a * l.b), (a * l.c - l.a * c) / (l.a * b - a * l.b));
	}

	void shiftline(double d) {double r = d * (sqrt(a * a + b * b)); c = c + r;}

	friend std::ostream &operator<<(std::ostream &os, const Line &l) {return os << l.a << "x + " << l.b << "y + " << l.c;}
};
]]),
    }),
})
