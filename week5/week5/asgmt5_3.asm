INCLUDE Irvine32.inc
; Author: Simar Rekhi
; Date: July 20, 2025
; Course and Section: COSC 2325-003
; Description:
COMMENT !
    Clear screen, center cursor, prompt for two integers, add, and display result.
    Must move to center before every display.
!

.data
prompt1   BYTE "Enter first integer: ", 0
prompt2   BYTE "Enter second integer: ", 0
resultMsg BYTE "The sum is: ", 0
int1      DWORD ?
int2      DWORD ?
sum       DWORD ?

.code
main PROC
    ; Clear screen
    call Clrscr

    ; --- First prompt ---
    mov dh, 12     ; row
    mov dl, 30     ; column
    call Gotoxy
    mov edx, OFFSET prompt1
    call WriteString
    call ReadInt
    mov int1, eax

    ; --- Second prompt ---
    mov dh, 14
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET prompt2
    call WriteString
    call ReadInt
    mov int2, eax

    ; --- Add the numbers ---
    mov eax, int1
    add eax, int2
    mov sum, eax

    ; --- Display result ---
    mov dh, 16
    mov dl, 30
    call Gotoxy
    mov edx, OFFSET resultMsg
    call WriteString

    mov eax, sum
    call WriteInt

    call Crlf
    exit
main ENDP
END main
