INCLUDE Irvine32.inc

; Author: Simar Rekhi
; Date: 08-01-2025
; Description:
COMMENT !
        rotate-right on AL by 1 bit without using rotate instructions.
        show use of SHR and conditional jumps
!

.code
main PROC
    mov al, 10011001b    ; 

    ; Saving LSB before shift
    mov ah, al           ; Copy AL to AH
    and ah, 1            

    shr al, 1            ; right shift by 1 
    cmp ah, 1
    jne SkipSetMSB      

    ; Set MSB of AL
    or al, 10000000b     ; Set bit 7 to 1

SkipSetMSB:
    call Crlf
    call WaitMsg
    exit
main ENDP
END main
