local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tbasic", snippetType = "autosnippet"}, {
    t("
#include<bits/stdc++.h>
using namespace std;

int main() {

	ios::sync_with_stdio(false);
	cin.tie(nullptr);
	
    
    return 0;
}
"),
  }),
}
