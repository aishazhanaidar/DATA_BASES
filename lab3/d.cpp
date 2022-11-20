#include <bits/stdc++.h>
using namespace std;

vector<int> solution(string str){
	vector<int> pi(str.length());
	for (int i = 1; i < str.length(); i++){
		int k = pi[i - 1];
		while (str[i] != str[k] && k > 0) k = pi[k - 1];
		if (str[i] == str[k]) k+=1;
		pi[i] = k;
	}
	return pi;
}

int main() {
	vector<pair<string, int> > v;
	vector<string> total;
	string s, t;
	int n;
	cin >> s >> n;
	s[0] += 32;
	int mm = -99;
	for(int i= 0; i < n; i++){
		cin >> t;
        t[0] += 32;
		vector<int> pi = solution(t + s);
		mm = max(mm, pi.back());
		v.push_back({ t, pi.back() });
	}
    if(mm == 0){
        cout << 0;
        return 0;
    }
	for (auto i : v) {
		if (i.second == mm) {
			total.push_back(i.first);
		}
	}
	cout << total.size() << endl;
	for (auto i : total) {
		i[0] = toupper(i[0]);
		cout << i << "\n";
	}

	return 0;
}