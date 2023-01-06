.model small
.stack 100h
.data 
tb1 db "Nhap vao  day so thap phan:"
    db 10, 13, '$'
tb2 db "So lon nhat tim duoc la:"
    db 10, 13, '$'
endline db 10, 13, '$'
x dw ?    ; khai bao bien
y dw ?
max dw ?
.code
main proc
    mov ax, @data  
    mov ds, ax
    ; nhap du lieu
    lea dx, tb1    ; ham ngat 9 in ra chuoi tb1
    mov ah, 9
    int 21h
    call nhapdayso  ; goi ham con
     ; xuong dong
    lea dx, endline  ; ham ngat 9 : xuong dong va lui dau dong
    mov ah, 9
    int 21h
     ; in ra kq
    lea dx, tb2     ; ham ngat 9: in ra tb2
    mov ah, 9
    int 21h
    call hienthi    ; goi ham con
     ; ket thuc chuong trinh
    mov ah, 4ch
    int 21h
main endp
; ham nhap va xu ly 
nhapdayso proc
    mov max, 0 ; khtao max = 0
    reset:
        mov x, 0  ; x = 0
        mov y, 0  ; y = 0
        mov bx, 10 ; bx = 10
        jmp nhap   ; nhay den nhap
    nhap:
        mov ah, 1   ; ham ngat 1 nhap vao 1 ktu
        int 21h
        cmp al, 36   ; so sanh voi $
        je thoat     ; == $ thoat
        cmp al, 13    ; so sanh voi enter
        je thoat       ; == enter thoat
        cmp al, 32      ; so sanh voi space
        je search_max   ; == nhay toi search_max
        cmp al, 44       ; so sanh voi dau ,
        je search_max ;== thi nhay
        ; nhap so co nhieu chu so     
        sub al, 30h      ; tru di kytu '0' de luu o dang so thap phan
        xor ah, ah      ; xoa  thanh gi ax
        mov y, ax        ; y = gtri tai ax
        mov ax, x        ; ax = x
        mul bx           ; nhan ax cho 10
        add ax, y        ; cong ax voi y luu vao ax
        mov x, ax        ; x = ax
        jmp nhap       ; nhay ve ham nhap
     search_max:      ; tim gtri max
        mov ax, x    
        cmp ax, max
        jle reset      ; nhay den reset 
        mov max, ax   ;tim ra gtri max va tiep tuc nhap
        xor ax, ax
        mov x, 0
        jmp nhap     
     thoat:         ; so sanh max voi gtri cuoi cung roi return ra max
        mov ax, x
        cmp ax, max
        jle exit
        mov max, ax
        xor ax, ax      ; khoi tao lai ax va x
        mov x, 0
        jmp exit
     exit:
        ret   
                   
nhapdayso endp
; hien thi ra gia tri lon nhat
hienthi proc
        mov bx,10
        mov ax,max    
        mov cx,0
    ; chia de hien thi tung chu so
    chia:
        mov dx,0
        div bx    ; chia max cho 10
        inc cx    ; tang bien dem
        push dx    ; phan du luu vao dx nguyen luu vao ax, day phan du vao stack
        cmp al,0   ; so sanh thanh ghi ax voi 0
        je ht      ; == 0 nhay toi ham hien thi
        jmp chia   ; != 0 tiep tuc chia
    ht:
        pop dx     ; lay phan du ra
        add dl,30h ; buoc nhap tru di de tinh toan, buoc nay cong vao de hien thi
        mov ah,2   ; ham ngat 2 hien thi tung ki tu
        int 21h
        dec cx    ; giam bien dem
        cmp cx,0
        jne ht
        ret  
hienthi endp
end main