local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tkickstart", snippetType = "autosnippet"}, {
    t("
#include<bits/stdc++.h>
using namespace std;

void solve(int test) {

}

int main() {

    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int T;
    cin >> T;
    for (int i = 1; i <= T; i++) {
        solve(i);
    }

    return 0;
}
"),
  }),
}
