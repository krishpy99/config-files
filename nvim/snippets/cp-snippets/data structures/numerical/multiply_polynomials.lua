local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tmultiplypolynomials", snippetType = "autosnippet"}, {
    t("
template <typename T>
polynomial<T> multiply_polynomials(std::vector<polynomial<T>> p, size_t k = -1) {
	int n = (int) p.size();
	for (int i = 1; i < n; i <<= 1) {
		for (int j = 0; j < n; j += 2 * i) {
			p[j] *= p[i + j], p[j] %= k;
		}
	}
	return p[0];
}
"),
  }),
}
