local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"t3dpointboiler", snippetType = "autosnippet"}, {
    t("
struct pt {
	double x, y, z;
	pt() {}
	pt(double x, double y, double z = 0): x(x), y(y), z(z) {}

	pt& operator+=(const pt &t) {x += t.x; y += t.y; z += t.z; return *this;}
	pt& operator-=(const pt &t) {x -= t.x; y -= t.y; z -= t.z; return *this;}
	template<typename U>
	pt& operator*=(U c) {x *= c; y *= c; z *= c; return *this;}
	template<typename U>
	pt& operator/=(U c) {x /= c; y /= c; z /= c; return *this;}

	pt operator+(const pt &t) const {return pt(*this) += t;}
	pt operator-(const pt &t) const {return pt(*this) -= t;}
	template<typename U>
	pt operator*(U t) const {return pt(*this) *= t;}
	template<typename U>
	pt operator/(U t) const {return pt(*this) /= t;}

	double dot(pt b) {return x * b.x + y * b.y + z * b.z;}
	double normal() {return dot(*this);}
	double abs() {return sqrt(normal());}
	double proj(pt b) {return dot(b) / b.abs();}
	double angle(pt b) {return acos(dot(b) / abs() / b.abs());}
	pt cross(pt b) {return pt(y * b.z - z * b.y, z * b.x - x * b.z, x * b.y - y * b.x);}
	double triple(pt b, pt c) {return dot(b.cross(c));}

	friend std::ostream &operator<<(std::ostream &os, const pt &p) {return os << p.x << \" \" << p.y << \" \" << p.z;}
};
"),
  }),
}
