local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"t3dintersectionpoint", snippetType = "autosnippet"}, {
    t("
pt intersect(pt a, pt n1, pt b, pt n2, pt c, pt n3) {
	pt x(n1.x, n2.x, n3.x);
	pt y(n1.y, n2.y, n3.y);
	pt z(n1.z, n2.z, n3.z);
	pt d(a.dot(n1), b.dot(n2), c.dot(n3));
	return pt(d.triple(y, z), x.triple(d, z), x.triple(y, d)) / n1.triple(n2, n3);
}
"),
  }),
}
