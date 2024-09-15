local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"tministack", snippetType = "autosnippet"}, {
    t("
template<typename T>
struct ministack : stack<T> {
    stack<T> data;
    void add(T x) {
        if ((*this).empty()) {
            data.push(x);
            (*this).push(x);
        } else {
            data.push(x);
            T y = (*this).top();
            (*this).pop();
            (*this).push(y);
            if (x < y) (*this).push(x);
            else (*this).push(y);
        }
    }

    T remove() {
        //if((*this).empty()) return -1;
        T x = data.top();
        data.pop();
        (*this).pop();
        return x;
    }

    T min() {
        //if((*this).empty()) return -1;
        T x = (*this).top();
        (*this).pop();
        (*this).push(x);
        return x;
    }
};
"),
  }),
}
