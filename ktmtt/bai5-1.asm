.model small
.stack 100h
.data
tb1 db "Nhap chuoi ky tu tu ban phim:"
    db 10,13, '$'
xuongdong db 10, 13, '$'
tb2 db "Chuoi ky tu vua nhap la:" 
    db 10, 13, '$'  
str db 100,?,100 dup('$') 
.code
main proc
    mov ax, @data
    mov ds, ax
    
    ;Nhap chuoi ky tu 
    mov ah, 9    
    lea dx, tb1  
    int 21h
    mov ah, 10
    lea dx, str
    int 21h
    ;Hien thi chuoi
    mov cx, 5
    endl:
        mov ah, 9
        lea dx, xuongdong
        int 21h
        loop endl
     mov ah, 9
     lea dx, tb2
     int 21h
     call show
     ;Ket thuc
     mov ah, 4ch
     int 21h
main endp   
show proc
    lea bx, str+1
    xor cx, cx
    mov cl, [bx]
    inc bx
    inhoa:
        mov dl, [bx]
        cmp dl, 'a'
        jl chan
        cmp dl, 'z'
        jg chan
        jmp print
        chan:
            cmp dl, 36
            je thoat 
            inc bx
            loop inhoa
        print:
            sub dl, 32
            mov ah, 2
            int 21h
            inc bx
            loop inhoa
thoat: ret
show endp                            
endp main