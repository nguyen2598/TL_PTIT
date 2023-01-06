;B20DCCN477
.model samll
.stack 100h
.data
x dw ?
y dw ?
z dw ?
tb1 db "Nhap vao so thap phan N: $"
tb2 db 10, 13, "Giai thua can tim: $"
.code
main proc
    mov ax, @data
    mov ds, ax
    
    mov ah, 9
    lea dx, tb1
    int 21h
    
    mov ah, 1
    int 21h
    sub al, 30h
    xor ah, ah
    mov x, ax 
    xor ax, ax 
    mov ax, 1
    mov cx, x
    mov bx, x
    giai_thua:
        mul bx;
        dec bx;
        cmp bx, 1
        jne giai_thua
    mov z, ax
    mov ah, 9
    lea dx, tb2
    int 21h
    mov bx,10
    mov ax,z
    mov cx,0
    chia:
        mov dx,0
        div bx
        inc cx
        push dx
        cmp al,0
        je ht
        jmp chia
    ht:
        pop dx
        add dl,30h
        mov ah,2
        int 21h
        dec cx
        cmp cx,0
        jne ht
    mov ah, 4ch
    int 21h
end main    