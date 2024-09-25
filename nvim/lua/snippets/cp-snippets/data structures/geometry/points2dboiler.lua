
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("2dpointboiler", {
        t([[
struct pt {
	double x, y;
	pt() {}
	pt(double x, double y): x(x), y(y) {}

	pt& operator+=(const pt &t) {x += t.x; y += t.y; return *this;}
	pt& operator-=(const pt &t) {x -= t.x; y -= t.y; return *this;}
	template<typename U>
	pt& operator*=(U c) {x *= c; y *= c; return *this;}
	template<typename U>
	pt& operator/=(U c) {x /= c; y /= c; return *this;}

	pt operator+(const pt &t) const {return pt(*this) += t;}
	pt operator-(const pt &t) const {return pt(*this) -= t;}
	template<typename U>
	pt operator*(U t) const {return pt(*this) *= t;}
	template<typename U>
	pt operator/(U t) const {return pt(*this) /= t;}

	double dot(pt b) {return x * b.x + y * b.y;}
	double normal() {return dot(*this);}
	double abs() {return sqrt(normal());}
	double proj(pt b) {return dot(b) / b.abs();}
	double angle(pt b) {return acos(dot(b)) / abs() / b.abs();}
	double cross(pt b) {return x * b.y - y * b.x;}

	friend std::ostream &operator<<(std::ostream &os, const pt &p) {return os << p.x << " " << p.y;}
};
]]),
    }),
})
