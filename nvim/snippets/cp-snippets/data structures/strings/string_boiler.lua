local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tspecialstring", snippetType = "autosnippet"}, {
    t("
const int mod = 1e9 + 7;

struct String : string {
public:
	int n; vector<int64_t> pp;
	String(): n() {}
	String(int n): n(n) {}
	String(string s) : string(s), n((int)s.length()) {}

	void get() {cin >> (*this); n = (*this).length();}
	void put() {cout << (*this).n << \"\n\";}

	vector<int64_t> compute_prefix_hash() {
		n = (*this).length();
		pp = vector<int64_t>(n);
		int p = 31; pp[0] = 1;
		for (int i = 1; i < n; i++)
			pp[i] = (pp[i - 1] * p) % mod, pp[i] %= mod;
		vector<int64_t> h(n + 1, 0);
		for (int i = 0; i < n; i++)
			h[i + 1] = (h[i] + ((*this)[i] - 'a' + 1) * pp[i]) % mod;
		return h;
	}

	int64_t compute_hash() {
		return compute_prefix_hash()[n - 1];
	}

	int count_unique_substrings() {
		vector<int64_t> h = compute_prefix_hash();
		int ans = 0;
		for (int l = 1; l <= n; l++) {
			set<int64_t> hs;
			for (int i = 0; i <= n - l; i++) {
				int64_t cur = (h[i + l] - h[i] + mod) % mod;
				cur *= pp[n - i - 1]; cur %= mod;
				hs.insert(cur);
			}
			ans += hs.size();
		}
		return ans;
	}
};
"),
  }),
}
