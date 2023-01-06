;B20DCCN477
;Dang Dinh Nguyen
.model small;
.stack 100h;
.data 
    i dw 700
.code
main proc
    mov ax, @data
    mov ds, ax;
    cld
    ;
    mov cx, 10
    mov bx, 1000
    ktao:
        mov [bx], 10
        inc bx
        loop ktao 
    ;reset
    xor ax, ax
    xor bx, bx 
    xor cx, cx
    xor dx, dx
    ;
    mov cx, 10 
    lap:
        mov dx, [1000+i];
        xor dh, dh 
        cmp dx, 0; khong phai so duong
        jle jum; bo qua
        add ax, dx
        jum: add i,1
    loop lap
    mov [2000], ax
 
main endp;
function proc
    
function endp;
end main