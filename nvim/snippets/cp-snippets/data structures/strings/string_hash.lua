local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"thashstring", snippetType = "autosnippet"}, {
    t("
template<typename T, int N>
struct Hash : vector<T> {
	//one-indexed
	int n; vector<T> p; T hashval;
	Hash(string s) : vector<T>((int)s.length() + 1) {n = s.length(); build(s);}

	void build(string s) {
		T a = 1; p = vector<T>(n);
		for (int i = 0; i < n; i++) {p[i] = a; a *= N;}
		for (int i = 0; i < n; i++)
			(*this)[i + 1] = (*this)[i] + (s[i] - 'a' + 1) * p[i];
		hashval = (*this)[n];
	}

	T eval(int ind, int len) {
		if (ind + len > n) return 0;
		T ans = (*this)[ind + len] - (*this)[ind]; ans *= p[ind].inv();
		return ans;
	}
};
"),
  }),
}
