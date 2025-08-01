INCLUDE Irvine32.inc
; Author: Simar Rekhi
; Date: Aug 1, 2025
; Description:
COMMENT !
    Multiply -5 by 3 
    store the result in a 16-bit variable val1.
!

.data
val1 SWORD ?                 ; 16-bit signed result
msg  BYTE "Result: ", 0

.code
main PROC
    mov ax, -5               ; AX = -5
    imul ax, 3               ; AX = AX * 3 = -15
    mov val1, ax             ; Store result in val1

    call Crlf
    mov edx, OFFSET msg
    call WriteString
    movsx eax, val1          ; Sign-extend val1 into EAX
    call WriteInt
    call Crlf

    call WaitMsg
    exit
main ENDP
END main
