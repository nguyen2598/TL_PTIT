/**************************************
  Name: DC.CPP  
	Copyright: (C) 2021
	Author: DevCP Fan
	Date: 1/11/21 19:36
	Description: 
  Divide And Conquer
  P1. Nhan An Do
  P2. Tong cuon
     Long x >= 0
     y = H(x) = sum of digits in x
     if y >= 10 H(y)...
     con 1 chu so y cuoi cung = 9 return 0
     Scrolling 
   x = 1234789 
   H(x) = 34 , 7 
    x = 12347892 
   H(x) = 36, H(36) = 9 -> 0
****************************************/
#include <bits/stdc++.h> 
#define Odd(x) (x)&1
#define Even(x) (!Odd(x))
      
using namespace std; // su dung vung lam viec chuan

typedef long long Long ; // 64 bit
const Long MOD = 10000000000L; // 9
 
using namespace std;

// Nhan An Do: z = x*y
MultInd(Long x, Long y) {
  Long z = 0;
  while(x > 0) {
     if (Odd(x)) z += y;
     x >>= 1;
     y <<= 1;
  }
  return z;
}

// Height = sum of digits
//  1 2 3 4
Long H(Long x) {
   Long t = 0;
  while(x) {
     t += x % 10; // lay chu so don vi
     x /= 10; // vat chu so dv
   }
  return t;
}

// x % 9
Long ScrollingSum(Long x) {  
  while (true) {
    x = H(x);
    if (x < 10) break;    
  }
  return (x == 9) ? 0 : x;
}

Long SS(Long x) {  
  return (x % 9);
}

/*----------------------------------
  Van dung TT An Do (chia de tri)
  moi ket qua trung gian phai < 9
  Plus (a+b)% 9 
  Mult (a*b) % 9
  Exp a^b % 9
-------------------------------------*/
// z = (a+b) % 9, a, b < 9
// a+b >= 9 -> a >= 9-b 
Long Plus(Long a, Long b) {
   return (a >= MOD-b) ? a - (MOD-b) : a + b;
}

// multiplication
// z = (x*y) % 9
Long Mult(Long x, Long y) {
  Long z = 0;
  while (x > 0) {
    if (Odd(x)) z = Plus(z,y);
    x >>= 1; // x = x / 2
    y = Plus(y,y);         // y = y*2
  }
  return z;
}

// z = x^m % 9
// x^20 = (x*x)^10
// x^21 = x*(x*x)^10
Long Exp(Long x, Long m) {
  Long z = 1;
  while(m > 0) {
    if (Odd(m)) z = Mult(z,x);
    m >>= 1; // m = m / 2
    x = Mult(x,x);         // x = x^2 % 9
  }
  return z;
} 

// Tinh tong cuon cua so 1^1+2^2+...+n^n
// sum(x^x) % 9 = sum((x%9)^x)  
Long Sum(Long n) {
  Long t = 0;  
  Long y;
  for(Long x = 1; x <= n; ++x) {
    y = x % 9;
    if (y != 0)     
       t = Plus(t,Exp(y,x));
  }
  return t;
}


main() {
  cout << "\n MOD = " << MOD;
  cout << "\n " << Sum(1000); // 8

  //Long n = 12342537;
  //cout << ScrollingSum(n) << " vs " << SS(n); // 27
  cout << "\n T h e   E n d";
  return 0;
}


