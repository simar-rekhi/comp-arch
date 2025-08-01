INCLUDE Irvine32.inc

; Author: Simar Rekhi
; Date: 08-01-2025
; Description:
COMMENT !
    sign-extending AX to EAX
!

.code
main PROC
    ; set AX with a negative 16-bit signed number
    mov ax, 0FFFCh        ; AX = -4
    movzx eax, ax         ; zero-extend AX to EAX 

    ; Shifting to get signed bit of of AX into MSB of EAX
    shl eax, 16           ; Move sign bit of AX to bit 31 of EAX
    sar eax, 16           ; shift arithmetic right


    call Crlf
    call WaitMsg
    exit
main ENDP
END main
