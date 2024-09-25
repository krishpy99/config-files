
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
    s("infixtopostfix", {
        t([[
int prec(char c) {
	if (c == '^')return 3;
	if (c == '*' || c == '/')return 2;
	if (c == '+' || c == '-')return 1;
	return -1;
}

string itop(string s) {
	stack<char> st; string result;
	for (int i = 0; i < (int)s.length(); i++) {
		char c = s[i];
		if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9'))
			result += c;
		else if (c == '(')
			st.push('(');
		else if (c == ')') {
			while (!st.empty() && st.top() != '(') {
				char temp = st.top();
				st.pop();
				result += temp;
			}
			st.pop();
		}
		else {
			while (!st.empty() && prec(s[i]) < prec(st.top())) {
				char temp = st.top();
				st.pop();
				result += temp;
			}
			st.push(c);
		}
	}
	while (!st.empty()) {
		char temp = st.top();
		st.pop();
		result += temp;
	}
	return result;
}
]]),
    }),
})
