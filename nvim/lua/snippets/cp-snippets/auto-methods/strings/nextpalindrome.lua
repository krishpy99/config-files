
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("nextpalindrome", {
        t([[
string nextPalindrome(string s) {
	string res = s; int n = s.length();
	for (int i = 0; i < n; i++)
		res[n - 1 - i] = res[i];
	int f = 0;
	for (int i = 0; i < n; i++) {
		if (res[i] > s[i]) {f = 1; break;}
		else if (res[i] < s[i]) break;
	}
	if (f)return res;
	for (int i = (n - 1) / 2; i >= 0; i--) {
		if (res[i] == '9')res[i] = '0';
		else {res[i]++; f = 1; break;}
	}
	if (!f) {res = '1' + res;} n = res.length();
	for (int i = 0; i < n; i++)
		res[n - 1 - i] = res[i];
	return res;
}
]]),
    }),
})
