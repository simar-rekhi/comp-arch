INCLUDE Irvine32.inc
; Author: Simar Rekhi
; Date: 07-25-2025
; Description:
COMMENT !
    calculate parity of a 32-bit operand in memory
    parity computation thru XOR-ing the bits together 
!

.data
val1 DWORD 10011001b     ; even parity
val2 DWORD 10011101b     ; odd parity

msg1 BYTE "Value 1: ", 0
msg2 BYTE "Value 2: ", 0
evenMsg BYTE "Even parity", 0
oddMsg  BYTE "Odd parity", 0

.code
main PROC
    ; checks parity for val1
    mov eax, val1 
    call Crlf
    mov edx, OFFSET msg1
    call WriteString
    call WriteBin

    call CheckParity

    ; checks parity for val2
    mov eax, val2
    call Crlf
    mov edx, OFFSET msg2
    call WriteString
    call WriteBin

    call CheckParity

    call Crlf
    exit
main ENDP

CheckParity PROC
    push ecx
    push ebx

    mov ecx, 32        ; move to ECX the number of bits to be processed
    xor ebx, ebx       ; XOR-ing the result

ParityLoop:
    xor bl, al         ; XOR lowest bit into BL
    shr eax, 1         ; shift right to process next bit
    loop ParityLoop

    call Crlf
    cmp bl, 0
    je EvenLabel
    mov edx, OFFSET oddMsg
    call WriteString
    jmp Done

EvenLabel:
    mov edx, OFFSET evenMsg
    call WriteString

Done:
    call Crlf
    pop ebx
    pop ecx
    ret
CheckParity ENDP

END main