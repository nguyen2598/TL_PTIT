.model small
.stack  100h
.data
.code
main proc
    mov cx, 10   ; cx dung de dem
    mov ax, 1
    mov bx, 1
giaithua:
    mul bx
    inc bx  ; bx++
    loop giaithua  ; lap tu dong giam cx
end main