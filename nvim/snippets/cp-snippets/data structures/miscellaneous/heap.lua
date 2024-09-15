local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({"theap", snippetType = "autosnippet"}, {
    t("
template<typename T>
struct heap : vector<T> {
    using F = function<T(const T&, const T&)>;
    F f = [&](int a,int b){return min(a,b);};
    heap() {}
    heap(F op) : f(op) {}

    void insert(T ele) {(*this).push_back(ele);heapifyup((*this).size() - 1);}
    T find() {if ((*this).size() == 0) return -1;return (*this).front();}
    int remove() {
        if ((*this).size() == 0) return 0;
        (*this)[0] = (*this).at((*this).size() - 1);
        (*this).pop_back(); heapifydown(0);
        return 1;
    }
    
    int left(int parent) {int l = 2 * parent + 1;if (l < (*this).size()) return l;return -1;}
    int right(int parent) {int r = 2 * parent + 2; if (r < (*this).size())return r;return -1;}
    int parent(int child) {int p = (child - 1) / 2;if (child == 0)return -1;return p;}

    void heapifyup(int node) {
        int parent1 = parent(node);
        if (node >= 0 && parent1 >= 0 && f((*this)[parent1], (*this)[node]) == (*this)[node]) {
            int temp = (*this)[node];
            (*this)[node] = (*this)[parent1];
            (*this)[parent1] = temp;
            heapifyup(parent1);
        }
    }
    void heapifydown(int node) {
        int child1 = left(node), child2 = right(node);
        if (child1 >= 0 && child2 >= 0 && f((*this)[child1], (*this)[child2]) == (*this)[child2]) 
            child1 = child2;
        if (child1 > 0 && f((*this)[node], (*this)[child1]) == (*this)[child1]) {
            int t = (*this)[node];
            (*this)[node] = (*this)[child1];
            (*this)[child1] = t;
            heapifydown(child1);
        }
    }
};
"),
  }),
}
