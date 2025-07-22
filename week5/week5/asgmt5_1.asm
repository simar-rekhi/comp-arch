INCLUDE Irvine32.inc
; Author: Simar Rekhi
; Date: 07-20-2025
; Description:
; Using PUSH and POP to exchange values stored in EAX and EBX.
; Values will be observed using Watch or Register window in debugger.

.code
main PROC
    ; Initialize EAX and EBX
    mov eax, 1234h       ; EAX = 1234h
    mov ebx, 5678h       ; EBX = 5678h

    ; values pre exchange

    ; Exchange using stack
    push eax             ; Push EAX onto stack
    push ebx             ; Push EBX onto stack

    pop eax              ; Pop top of stack into EAX (gets EBX)
    pop ebx              ; Pop next into EBX (gets EAX)

    ; values have been exchanged

    exit
main ENDP
END main