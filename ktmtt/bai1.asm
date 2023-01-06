;bai 3- Dang Dinh Nguyen-B20DCCN477 
; tong cac so am
mov r0, 700
mov r1,0
mov r2,0
LAP:
    mov r3, [1000+r2] 
    cmp [1000+r2],0
    jl add r1,r3
    add r2, 1
    dec r0
    cmp r0, 0
    jg LAP 
mov [5000], r1 
