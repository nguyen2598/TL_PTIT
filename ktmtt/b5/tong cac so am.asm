;B20DCCN477
;tong so am

.model small;
.stack 100h;
.data 
    i dw 0
.code
main proc
    mov ax, @data
    mov ds, ax;
    cld
    ;
    mov cx, 10
    mov bx, 1000
    ktao:
        mov [bx], -10
        inc bx
        loop ktao 
    ;reset
    xor ax, ax
    xor bx, bx 
    xor cx, cx
    xor dx, dx

    mov cx, 10 
    lap:
        mov dx, [1000+i]; 
        cmp dx, 0;  khong la so am
        jge jum; bo qua buoc cong
        xor dh, dh;
        add ax, dx; buoc cong
        jum: add i,1
    loop lap
    mov [2000], al
 
main endp;
function proc
    
function endp;
end main