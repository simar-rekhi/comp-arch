INCLUDE Irvine32.inc

; Author: Simar Rekhi
; Date: July 20, 2025
; Description:
COMMENT !
    clear screen, locate cursor in the midddle, input two numbers, add and display sum
    note - move to the middle before every display
!

.data
prompt1 BYTE "Enter first integer: ", 0
prompt2 BYTE "Enter second integer: ", 0
resultMsg BYTE "The sum is: ", 0
int1 DWORD ?
int2 DWORD ?
sum  DWORD ?

.code
main PROC
    ; Clear the screen
    call Clrscr

    ; Move cursor to center for first prompt
    mov dl, 12           ; row
    mov dh, 30           ; column
    call Gotoxy

    ; Prompt and read first integer
    mov edx, OFFSET prompt1
    call WriteString
    call ReadInt
    mov int1, eax

    ; Move to next line near center for second prompt
    mov dl, 14           ; row
    mov dh, 30           ; column
    call Gotoxy

    mov edx, OFFSET prompt2
    call WriteString
    call ReadInt
    mov int2, eax

    ; Add the numbers
    mov eax, int1
    add eax, int2
    mov sum, eax

    ; Move to next line for result
    mov dl, 16           ; row
    mov dh, 30           ; column
    call Gotoxy

    mov edx, OFFSET resultMsg
    call WriteString

    mov eax, sum
    call WriteInt

    call Crlf
    exit
main ENDP
END main
