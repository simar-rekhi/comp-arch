INCLUDE Irvine32.inc


; Author: Simar Rekhi
; Date: 07-20-2025
; Description:

COMMENT !
    Display a subroutine return address
    Change it to 3 bytes higher in memory
    Show both values using Irvine32
!

.data
msg1 BYTE "original: ", 0
msg2 BYTE "modified: ", 0

.code
main PROC
    call mySub

    ; These instructions are 3 bytes total and should be skipped
    mov eax, eax      ; 2 bytes
    inc eax           ; 1 byte

    call Crlf
    exit
main ENDP

; -----------------------------------------------
mySub PROC
    call Crlf
    mov edx, OFFSET msg1
    call WriteString

    mov eax, [esp]        ; Get return address from stack
    call WriteHex         ; Display it

    add eax, 3            ; Advance return address by 3 bytes
    mov [esp], eax        ; Overwrite return address

    call Crlf
    mov edx, OFFSET msg2
    call WriteString
    call WriteHex         ; Display new return address

    ret                   ; Now jumps 3 bytes further
mySub ENDP

END main                 
