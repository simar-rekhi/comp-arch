; Author: Simar Rekhi
; Date: 21 July 2025
; Description:

COMMENT !
	library test #2 - random integer
!

INCLUDE Irvine32.inc

TAB = 9 ; ASCII code for horizontal tab

.code
main PROC
    call Randomize     ; Initialize random number generator
    call Rand1         ; Generate 10 unsigned random integers
    call Rand2         ; Generate 10 signed random integers from -50 to +49
    exit
main ENDP

; --------------------------------------------------
Rand1 PROC
; Generate 10 pseudo-random unsigned integers (full 32-bit range)
    mov ecx, 10
L1:
    call Random32      ; EAX = random 32-bit number (0 to 4294967294)
    call WriteDec      ; Display in unsigned decimal
    mov al, TAB
    call WriteChar     ; Insert tab space
    loop L1
    call Crlf
    ret
Rand1 ENDP

; --------------------------------------------------
Rand2 PROC
; Generate 10 signed integers from -50 to +49
    mov ecx, 10
L2:
    mov eax, 100       ; Range size = 100
    call RandomRange   ; EAX = 0 to 99
    sub eax, 50        ; Shift to range -50 to +49
    call WriteInt      ; Display in signed decimal
    mov al, TAB
    call WriteChar     ; Insert tab space
    loop L2
    call Crlf
    ret
Rand2 ENDP

END main