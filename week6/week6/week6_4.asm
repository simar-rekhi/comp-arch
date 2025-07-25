INCLUDE Irvine32.inc
; Author: Simar Rekhi
; Date: 07-25-2025
; Description:

COMMENT!
    clears bits 0 and 1 of AL
    jumps based on the result
!

.data
msgZero    BYTE "Equal to zero", 0
msgNonZero BYTE "Not equal to zero", 0
labelAL    BYTE "AL after clearing bits 0 and 1 = ", 0

.code
main PROC
    ; Initialize AL with test value (modify this to test both paths)
    mov al, 0FFh       ; Example: AL = 11111111

    ; Clear bits 0 and 1 => mask with 11111100b = 0FCh
    and al, 0FCh       ; Clears bits 0 and 1 of AL

    ; Show value of AL after masking
    call Crlf
    mov edx, OFFSET labelAL
    call WriteString

    xor eax, eax       ; Clear EAX to safely store AL
    mov al, al         ; AL is already set
    call WriteHex      ; Print result in hex

    ; Jump based on whether AL == 0
    cmp al, 0
    je L3              ; If AL == 0 -> jump to L3
    jmp L4             ; Else jump to L4

L3:
    call Crlf
    mov edx, OFFSET msgZero
    call WriteString
    jmp Done

L4:
    call Crlf
    mov edx, OFFSET msgNonZero
    call WriteString

Done:
    call Crlf
    exit
main ENDP
END main
