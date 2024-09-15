local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tgcdxy", snippetType = "autosnippet"}, {
    t("
// GCD of two numbers : ax + by = gcd(a,b). Finding x & y.

int64_t gcdxy(int64_t a, int64_t b, int64_t& x, int64_t& y) {
    if (b == 0) {
        x = 1;
        y = 0;
        return a;
    }
    int64_t x1, y1;
    int64_t d = gcdxy(b, a % b, x1, y1);
    x = y1;
    y = x1 - y1 * (a / b);
    return d;
}
"),
  }),
}
