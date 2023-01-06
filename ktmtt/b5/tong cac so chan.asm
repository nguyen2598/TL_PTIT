;B20DCCN477
; tong so chan
.model small;
.stack 100h;
.data ;khai bao bien
    i dw 0
    sum dw 0
.code
main proc
    mov ax, @data
    mov ds, ax;
    cld
    ;
    mov cx, 10
    mov bx, 1000
    ktao:
        mov [bx], 20
        inc bx
        loop ktao 
    ;reset
    xor ax, ax
    xor bx, bx 
    xor cx, cx
    xor dx, dx
    ;
    mov cx, 10
    mov bx, 2 
    lap:
        mov dx, [1000+i];
        mov ax, dx 
        xor dh, dh
        xor ah, ah
        div bl ; chia cho 2
        xor ah,ah; xoa so du
        mul bl ; nhan voi 2
        cmp dx, ax; neu kq bang nhau thi la so chan
        jne jum; neu ko phai so chan thi bo qua buoc cong
        add sum, dx; buoc cong
        jum: add i,1
    loop lap
    mov ax, sum
    mov [2000], ax
 
main endp;
function proc
    
function endp;
end main