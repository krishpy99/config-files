local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

local lca_binary =    
s("LCAbinary", {
        t([[
set<T> all_nodes;
T find_lca(T a, T b) {
    auto rec = [&](node<T> * cur, const auto & self) -> void{
        if (cur == NULL) return; self(cur->left, self);
        all_nodes.insert(cur->data); self(cur->right, self);
    };
    rec(root, rec);
    if (all_nodes.find(a) == all_nodes.end() || all_nodes.find(b) == all_nodes.end()) return T();
    auto lca_util = [&](node<T> *cur, T x, T y, const auto & self) -> node<T> * {
        if (cur == NULL)return NULL;
        if (cur->data == x || cur->data == y) return cur;
        node<T> * left_cur = self(cur->left, x, y, self);
        node<T> * right_cur = self(cur->right, x, y, self);
        if (left_cur && right_cur) return cur;
        return (left_cur != NULL) ? left_cur : right_cur;
    };
    return lca_util(root, a, b, lca_util) -> data;
}
]])
})

local bst =
s("bst", {
        t([[
template<typename T>
struct node {
    T data;
    node<T> *left, *right;

    node() {this = NULL;}
    node(T val): left(NULL), right(NULL) {data = val;}
};

template<typename T>
struct bst {
    node<T> *root;
    bst() {root = NULL;}

    void insert(T val) {
        auto rec = [&](node<T> * &cur, T val, const auto & self) -> void {
            if (cur == NULL) {
                cur = new node<T>(val); return;
            }
            if (cur->data >= val) self(cur->left, val, self);
            else self(cur->right, val, self);
        };
        rec(root, val, rec);
    }

    void showtree() {
        auto rec = [&](node<T> * cur, int level, string s, const auto & self) -> void{
            if (cur == NULL) return;
            self(cur->left, level + 1, s + "->left", self);
            cout << s << ' ' << level << ": " << cur->data << '\n';
            self(cur->right, level + 1, s + "->right", self);
        };
        rec(root, 0, "root", rec);
    }
};
]]),
})

local traversal =
s("traversal", {
        t([[
    void preorder() {
        auto rec = [&](node<T> *cur, const auto & self) -> void {
            if (cur == NULL)return;
            cout << ' ' << cur->data;
            self(cur->left, self);
            self(cur->right, self);
        };
        rec(root, rec);
    }
    void inorder() {
        auto rec = [&](node<T> *cur, const auto & self) -> void {
            if (cur == NULL)return;
            self(cur->left, self);
            cout << ' ' << cur->data;
            self(cur->right, self);
        };
        rec(root, rec);
    }
    void postorder() {
        auto rec = [&](node<T> *cur, const auto & self) -> void {
            if (cur == NULL)return;
            self(cur->left, self);
            self(cur->right, self);
            cout << ' ' << cur->data;
        };
        rec(root, rec);
    }
]]),
})


ls.add_snippets("cpp", {
	lca_binary,
	bst,
	traversal
})
