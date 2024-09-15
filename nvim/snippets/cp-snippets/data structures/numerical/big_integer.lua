local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tbiginteger", snippetType = "autosnippet"}, {
    t("
struct big_int {
	string val; bool sign = false;
	big_int(): val() {}
	big_int(string s, char sign) : val(s), sign(sign) {}
	big_int(string s): val(s) {
		if (s[0] == '-') {
			reverse(val.begin(), val.end()); val.pop_back(); reverse(val.begin(), val.end()); sign = true;
		}
	}
	big_int(int64_t n) {if (n >= 0)val = to_string(n); else val = to_string(-n), sign = true;}

	big_int add(big_int bx) {
		big_int c; string a = val, b = bx.val; c.val = \"\"; if (a.length() > b.length()) {swap(a, b);}
		int n = a.length(), m = b.length(), carry = 0; reverse(a.begin(), a.end()); reverse(b.begin(), b.end());
		for (int i = 0; i < n; i++) {
			int sum = ((a[i] - '0') + (b[i] - '0') + carry); c.val += sum % 10 + '0'; carry = sum / 10;
		}
		for (int i = n; i < m; i++) {
			int sum = ((b[i] - '0') + carry); c.val += sum % 10 + '0'; carry = sum / 10;
		}
		if (carry) {c.val += carry + '0';} reverse(c.val.begin(), c.val.end()); return c;
	}

	big_int sub(big_int bx) {
		auto issmall = [&](string a, string b) {
			int n1 = a.length(), n2 = b.length(); if (n1 < n2) {return true;} if (n2 < n1) {return false;}
			for (int i = 0; i < n1; i++) {if (a[i] < b[i]) {return true;} if (b[i] < a[i]) {return false;}}
			return false;
		};
		big_int c; string a = val, b = bx.val, r = \"\"; if (issmall(a, b)) {swap(a, b), c.sign ^= true;}
		reverse(a.begin(), a.end()); reverse(b.begin(), b.end()); int carry = 0, n = a.length(), m = b.length();
		for (int i = 0; i < m; i++) {
			int sub = (a[i] - b[i]) - carry; if (sub < 0) {sub = sub + 10; carry = 1;} c.val += sub + '0';
		}
		for (int i = m; i < n; i++) {
			int sub = (a[i] - '0') - carry; if (sub < 0) {sub = sub + 10; carry = 1;} c.val += sub + '0';
		}
		while (c.val.size() > 1 && c.val.back() == '0')c.val.pop_back();
		reverse(c.val.begin(), c.val.end()); return c;
	}

	big_int operator+() const {big_int b; b.val = val; return b;}

	big_int &operator+=(const big_int &b) {
		if (b.sign && !sign) (*this) = sub(b);
		else if (!b.sign && sign) (*this) = sub(b), sign ^= true;
		else if (b.sign && sign) (*this) = add(b), sign = true;
		else (*this) = add(b), sign = false;
		return *this;
	}
	big_int &operator-=(const big_int &b) {
		if (b.sign && !sign)(*this) = add(b), sign = false;
		else if (!b.sign && sign) (*this) = add(b), sign = '-';
		else if (b.sign && sign) (*this) = sub(b), sign ^= true;
		else (*this) = sub(b);
		return *this;
	}

	friend big_int operator+ (const big_int &l, const big_int &r) {return big_int(l) += r;}
	friend big_int operator- (const big_int &l, const big_int &r) {return big_int(l) -= r;}

	friend std::ostream &operator<<(std::ostream &os, const big_int &b) {return os << (b.sign ? \"-\" : \"\") << b.val;}
	friend std::istream &operator>>(std::istream &is, big_int &b) {string x; is >> x; b = x; return is;}
};
using bing = big_int;
"),
  }),
}
