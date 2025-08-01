INCLUDE Irvine32.inc

; Author: Simar Rekhi
; Date: Aug 1, 2025
; Description:
COMMENT !
    packedToAsc
!

.data
numbers DWORD 12345678h, 23456781h, 45678123h, 78654321h, 56781234h
buffer  BYTE 9 DUP(0)
newline BYTE 0dh, 0ah, 0

.code
main PROC
    mov esi, OFFSET numbers     ; ESI points to first packed number
    mov ecx, LENGTHOF numbers   ; Loopa via all packed numbers

nextNumber:
    push esi                    ; save pointer to packed number
    push OFFSET buffer          
    call PackedToAsc            ; convert to ASCII

    ; print the ASCII string
    mov edx, OFFSET buffer
    call WriteString
    call Crlf

    add esi, 4                  ; move to next number
    loop nextNumber

    call Crlf
    exit
main ENDP

PackedToAsc PROC
    push ebp
    mov ebp, esp
    push eax
    push ebx
    push ecx
    push edx

    mov edi, [ebp + 8]      
    mov esi, [ebp + 12]    
    mov eax, [esi]          
    mov ecx, 8              

nextNibble:
    rol eax, 4              ; rotate left 4 bits
    mov bl, al              
    and bl, 0Fh             
    or  bl, 30h             ; convert to ASCII
    mov [edi], bl          ; store in buffer
    inc edi
    loop nextNibble

    mov byte ptr [edi], 0  ; null-terminate

    pop edx
    pop ecx
    pop ebx
    pop eax
    pop ebp
    ret 8
PackedToAsc ENDP

END main
