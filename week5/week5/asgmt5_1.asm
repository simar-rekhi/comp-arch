INCLUDE Irvine32.inc
; Author: Simar Rekhi
; Date: July 20, 2025
; Course and Section: COSC 2325-003
; Description:
COMMENT !
    Using PUSH and POP to exchange values stored in EAX and EBX.
    Values displayed before and after using Irvine32 library.
!

.data
beforeMsg BYTE "Before exchange:", 0
afterMsg  BYTE "After exchange:", 0
eaxLabel  BYTE "EAX = ", 0
ebxLabel  BYTE "EBX = ", 0

.code
main PROC
    ; Initialize registers
    mov eax, 1234h     ; EAX = 1234h
    mov ebx, 5678h     ; EBX = 5678h

    ; Display before exchange
    call Crlf
    mov edx, OFFSET beforeMsg
    call WriteString
    call Crlf

    mov edx, OFFSET eaxLabel
    call WriteString
    mov eax, eax
    call WriteHex
    call Crlf

    mov edx, OFFSET ebxLabel
    call WriteString
    mov eax, ebx
    call WriteHex
    call Crlf

    ; Exchange using stack
    push eax
    push ebx
    pop eax
    pop ebx

    ; Display after exchange
    call Crlf
    mov edx, OFFSET afterMsg
    call WriteString
    call Crlf

    mov edx, OFFSET eaxLabel
    call WriteString
    mov eax, eax
    call WriteHex
    call Crlf

    mov edx, OFFSET ebxLabel
    call WriteString
    mov eax, ebx
    call WriteHex
    call Crlf

    exit
main ENDP
END main
