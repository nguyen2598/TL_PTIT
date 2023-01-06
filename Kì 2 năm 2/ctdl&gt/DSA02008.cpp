#include<bits/stdc++.h>
using namespace std;
int A[15], B[15]={0}, C[15][15], n, k, dem = 0;
void xuly(){
    int t=0;
    for(int i=1;i<=n;i++) t = t + C[i][A[i]];
    if(t==k) dem++;
}
void in(){
    int t=0,i;
    for(i=1;i<=n;i++) t = t + C[i][A[i]];
    if(t==k){
        for(i=1;i<=n;i++) cout << A[i] << " ";
        cout << endl;
    }
}
void quaylui1(int i){
    int j;
    for(j=1;j<=n;j++){
        if(!B[j]){
            A[i] = j; B[j] = 1;
            if(i==n) xuly();
            else quaylui1(i+1);
            B[j] = 0;
        }
    }
}
void quaylui2(int i){
    int j;
    for(j=1;j<=n;j++){
        if(!B[j]){
            A[i] = j; B[j] = 1;
            if(i==n) in();
            else quaylui2(i+1);
            B[j] = 0;
        }
    }
}
main(){
    int i,j;
    cin >> n >> k;
    for(i=1;i<=n;i++)
        for(j=1;j<=n;j++)
            cin >> C[i][j];
    quaylui1(1);
    cout << dem << endl;
    for(i=0;i<=n;i++) B[i] = 0;
    quaylui2(1);
}
