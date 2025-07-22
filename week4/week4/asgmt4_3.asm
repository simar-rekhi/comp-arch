; Author: Simar Rekhi
; Date: 07-04-2025
; Description
COMMENT !
	To set carry flag by the subtraction of two BYTE labels
	Note: since it has to be restricted to 2 lines of code, we are going to stick to 
	register, immediate as our mode of transfer
!

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD


.code
main PROC
	mov AL, 3  ; move 3 to 6-bit lower register AL
	sub AL, 5  ; subtract 5 from the contents stored in AL

	invoke ExitProcess, 0
main ENDP
END main
