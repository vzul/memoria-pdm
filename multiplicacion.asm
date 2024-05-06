INCLUDE Irvine32.inc

.data  
    x SDWORD 3      ; int x = 3;
    A SDWORD 7      ; int a = 7;
    B SDWORD 2      ; int b = 2;
    Y SDWORD 102    ; int y = 102;

.code
AXPlusB PROC
    push edx
    imul ebx
    add eax, ecx
    pop edx
    ret
AXPlusB ENDP

Inequality PROC
    push ebx
    push ecx
    push edx
    mov edx, 9
    imul edx
    add eax, 6       ; EAX = ((9*x)+6)
    xchg eax, ebx    ; EBX = ((9*x)+6)
    cdq
    mov ecx, 3
    idiv ecx         ; EAX = (y/3)
    cmp ebx, eax
    jg setToOne
setToZero:
    mov eax, 0
    jmp done
setToOne:
    mov eax, 1
done:
    pop edx
    pop ecx
    pop ebx
    ret
Inequality ENDP

main PROC
    mov eax, x
    mov ebx, A
    mov ecx, B
    call AXPlusB    ; AXPlusB(x,A,B);
    call WriteInt
    call Crlf       ; advances cursor to beginning of nxt line

    mov eax, x
    mov ebx, B
    mov ecx, A
    call AXPlusB    ; AXPlusB(x,A,B);
    call WriteInt
    call Crlf     

    mov eax, x
    mov ebx, y
    call Inequality
    call WriteInt
    call Crif


    call WaitMsg
    exit
main ENDP
END main
