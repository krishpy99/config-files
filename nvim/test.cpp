#include <iostream>
using namespace std;

template<typename T>
struct graph : vector<vector<pair<int, T>>> {
    int n;
    graph(int n) : vector<vector<pair<int, T>>>(n), n(n) {}

    void add(int x, int y, T z) { (*this)[x].push_back({y, z}); (*this)[y].push_back({x, z}); }

    friend void sort(graph &g) { for (auto &i : g) sort(i.begin(), i.end()); }
};

int main() {
	
	int t;
	cin>>t;
	while(t--){
		int n;cin>>n;
		graph g(n);
		for(int i = 0;i < n;i++){

		}
	}
	return 0;
}
