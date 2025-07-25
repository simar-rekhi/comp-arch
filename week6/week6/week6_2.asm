INCLUDE Irvine32.inc
; Author: Simar Rekhi
; Date: 07-25-2025
; Description:
COMMENT !
    as per set theory, return bit string of SetX - SetY
    i.e., elements in SetX that are not in SetY
!

.data
SetX BYTE 0CCh        ; 1100 1100
SetY BYTE 0C3h        ; 1100 0011

msg1 BYTE "SetX: ", 0
msg2 BYTE "SetY: ", 0
msg3 BYTE "Result (SetX - SetY): ", 0

.code
main PROC
    ; Show SetX
    mov edx, OFFSET msg1
    call WriteString
    movzx eax, SetX
    call WriteBin
    call Crlf

    ; Show SetY
    mov edx, OFFSET msg2
    call WriteString
    movzx eax, SetY
    call WriteBin
    call Crlf

    ; Perform boolean operation: EAX = SetX AND (NOT SetY)
    movzx eax, SetX
    movzx ebx, SetY
    not ebx
    and eax, ebx

    ; Show result
    mov edx, OFFSET msg3
    call WriteString
    call WriteBin
    call Crlf

    call WaitMsg
    exit
main ENDP
END main
