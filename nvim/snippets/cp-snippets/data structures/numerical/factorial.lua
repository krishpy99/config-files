local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tfactorial", snippetType = "autosnippet"}, {
    t("
template<typename T, int N>
struct factorial : vector<T> {
	constexpr factorial() : vector<T>(N + 1) {
		(*this)[0] = 1;
		for (int i = 1; i <= N; i++)
			(*this)[i] = (*this)[i - 1] * i;
	}
};

constexpr int X = 2000000;
factorial<mint, X> f;
"),
  }),
}
