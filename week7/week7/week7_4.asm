INCLUDE Irvine32.inc
; Author: Simar Rekhi
; Date: July 31, 2025
; Description:
COMMENT !
    Implements val1 = (val2 / val3) * (val1 + val2) using 32-bit signed integers.
!

.data
val1 SDWORD -1
val2 SDWORD -6
val3 SDWORD 3
msg  BYTE "Result: ", 0

.code
main PROC
    ; Load val2 and val3 for division
    mov eax, val2        ; EAX = val2
    cdq                  ; Sign-extend EAX into EDX
    idiv val3            ; EAX = EAX / val3 -> EAX = -6 / 3 = -2

    ; EAX now holds quotient... store in ebx
    mov ebx, eax         ; ebx = val2 / val3

    ; Computing val1 + val2
    mov eax, val1
    add eax, val2        ; val1 + val2 = -1 + (-6) = -7

    ; Multiply both parts
    imul eax, ebx        ; eax = eax * ebx = -7 * -2 = 14

    ; Store result in val1
    mov val1, eax

    call Crlf
    mov edx, OFFSET msg
    call WriteString
    mov eax, val1
    call WriteInt
    call Crlf

    call WaitMsg
    exit
main ENDP
END main
