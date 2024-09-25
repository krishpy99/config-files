
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("suffixarray", {
        t([[
struct suffix_array {
	int n; vector<int> p; string s; vector<vector<int>> table;

	suffix_array(string s) : s(s) {n = s.length(); build();}

	void build() {
		s += '#'; n++; p = vector<int>(n);
		vector<int> c(n); vector<int> cnt(max(256, n), 0);
		for (int i = 0; i < n; i++) cnt[s[i]]++;
		for (int i = 1; i < max(256, n); i++)cnt[i] += cnt[i - 1];
		for (int i = 0; i < n; i++) p[--cnt[s[i]]] = i;
		c[p[0]] = 0; int cl = 1;
		for (int i = 1; i < n; i++) {
			if (s[p[i]] != s[p[i - 1]])cl++;
			c[p[i]] = cl - 1;
		}
		vector<int> pn(n), cn(n);
		for (int h = 0; (1 << h) < n; ++h) {
			for (int i = 0; i < n; i++) {
				pn[i] = p[i] - (1 << h); if (pn[i] < 0) pn[i] += n;
			}
			fill(cnt.begin(), cnt.begin() + cl, 0);
			for (int i = 0; i < n; i++) cnt[c[pn[i]]]++;
			for (int i = 1; i < n; i++) cnt[i] += cnt[i - 1];
			for (int i = n - 1; i >= 0; i--) p[--cnt[c[pn[i]]]] = pn[i];
			cn[p[0]] = 0; cl = 1;
			for (int i = 1; i < n; i++) {
				pair<int, int> cur = {c[p[i]], c[(p[i] + (1 << h)) % n]};
				pair<int, int> pre = {c[p[i - 1]], c[(p[i - 1] + (1 << h)) % n]};
				if (cur != pre) {cl++;} cn[p[i]] = cl - 1;
			}
			table.push_back(c); c.swap(cn);
		}
		n--; s.pop_back();
	}

	int compare(int i, int j, int l) {
		int k = 32 - __builtin_clz(l) - 1;
		pair<int, int> a = {table[k][i], table[k][(i + l - (1 << k)) % n]};
		pair<int, int> b = {table[k][j], table[k][(j + l - (1 << k)) % n]};
		return a == b ? 0 : a < b ? -1 : 1;
	}

	int longest_common_prefix(int i, int j) {
		int ans = 0;
		for (int k = log2(n); k >= 0; k--) {
			if (table[k][i] == table[k][j]) {
				ans += 1 << k;
				i += 1 << k; j += 1 << k;
			}
		}
		return ans;
	}
};
]]),
    }),
})
