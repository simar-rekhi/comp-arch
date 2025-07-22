; Author: Simar Rekhi
; Date: 21 July 2025
; Description:

COMMENT !
	library test #1 - integer I/O 
!

INCLUDE Irvine32.inc

.data
COUNT = 4
BlueTextOnGray = blue + (lightGray * 16)
DefaultColor   = lightGray + (black * 16)

arrayD SDWORD 12345678h, 1A4B2000h, 3434h, 7AB9h
prompt BYTE "Enter a 32-bit signed integer: ", 0

.code
main PROC
    ; Set custom screen colors
    mov eax, BlueTextOnGray
    call SetTextColor
    call Clrscr

    ; Dump memory of arrayD
    mov esi, OFFSET arrayD        ; address of array
    mov ebx, TYPE arrayD          ; element size (4 bytes)
    mov ecx, LENGTHOF arrayD      ; number of elements
    call DumpMem

    ; Prepare to take input
    call Crlf                     ; blank line
    mov ecx, COUNT                ; loop counter

L1:
    mov edx, OFFSET prompt
    call WriteString              ; prompt message
    call ReadInt                  ; input into EAX
    call Crlf

    call WriteInt                 ; signed decimal
    call Crlf
    call WriteHex                 ; hexadecimal
    call Crlf
    call WriteBin                 ; binary
    call Crlf
    call Crlf

    loop L1                       ; repeat until ECX == 0

    ; Finish and reset colors
    call WaitMsg
    mov eax, DefaultColor
    call SetTextColor
    call Clrscr

    exit
main ENDP
END main
