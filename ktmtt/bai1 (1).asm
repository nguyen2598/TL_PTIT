.model small
.stack 100h
.data 
r0 dw ?       ; khai bao r0,1,2
r1 dw ?
r2 dw ?
.code
main proc 
    mov ax, @data ; cau truc chuong trinh
    mov dx, ax
    
    mov r0, 1500
    mov r1, 4500
    mov r2, 1000
    mov [r0], 1000
    mov [r1], 500
    mov ax, [r0]
    add r2, ax
    mov ax, [r1]
    sub r2, ax
    mov r2, 5000
    mov ax, r0
    mov [r2 + 100], ax
end main