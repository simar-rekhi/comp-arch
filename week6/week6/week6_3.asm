INCLUDE Irvine32.inc
; Author: Simar Rekhi
; Date: 07-25-2025
; Description:
; Program control jumps to L1 when unsigned value in DX <= CX 
; Displays DX and CX along with message when jumping

.data
msgResult BYTE "DX is less than or equal to CX", 0
labelDX    BYTE "DX = ", 0
labelCX    BYTE "CX = ", 0

.code
main PROC
    ; Initialize values (test cases)
    mov dx, 5
    mov cx, 5

    ; Compare unsigned: DX <= CX
    cmp dx, cx
    jbe L1

    ; Exit if condition not met
    call Crlf
    exit

L1:
    call Crlf

    ; Display result message
    mov edx, OFFSET msgResult
    call WriteString
    call Crlf

    ; Display DX
    mov edx, OFFSET labelDX
    call WriteString
    xor eax, eax        ; Clear EAX
    mov ax, dx          ; Move 16-bit DX into AX (lower part of EAX)
    call WriteInt
    call Crlf

    ; Display CX
    mov edx, OFFSET labelCX
    call WriteString
    xor eax, eax        ; Clear EAX
    mov ax, cx          ; Move 16-bit CX into AX
    call WriteInt
    call Crlf

    ; Done
    exit
main ENDP
END main