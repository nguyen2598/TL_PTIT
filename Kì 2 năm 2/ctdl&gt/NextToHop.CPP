/**************************************
  Name: Next.CPP
	Copyright: (C) 2021
	Author: DevCP Fan
	Date: 22/03/22 19:25
	Description: 
	Tap quan su	
****************************************/

#include <bits/stdc++.h> 

using namespace std; // su dung vung lam viec chuan
const int MN = 20;
int h[MN]; // to hop

// Dung man hinh
void Go() {
  cout << " ? ";
  fflush(stdin);
  if (cin.get() == '.') exit(0);
}

void Print(int a[], int n, const char * msg = "") {
   cout << msg;
   for(int i = 1; i <= n; ++i)
     cout << " " << a[i];
}

// To hop sat sau
bool Next(int n, int k) {
  // biet h. h' = ?
  int v = n;
  int i;
  for(i = k; true; --i, --v) {
	   if (h[i] != v) break;
	} 
	if (i < 1) return false;
	v = h[i]+1;
	for(int j = i; j <= k; ++j, ++v) {
	   h[j] = v;
	}
  return true;
}

void Run() {  
   int n = 5; 
   int k = 3;
   for(int i = 1; i <= k; ++i) h[i] = i;
   int d = 0;
   do {
     ++d;
     cout << "\n " << d << ". ";
	   Print(h, k, " ");
	 } while (Next(n, k));		  
}

main() {
   Run();
  cout << "\n T h e   E n d";
  return 0;
}


