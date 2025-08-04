; BOILERPLATE FOR CODING ASSIGNMENTS

; Author: Simar Rekhi
; Date: mm-dd-yyyy
; Description:
COMMENT !
	defining text literals
	associating them with variables in memory
!

; ENVIRONMENT SETUP
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

; defining string literals as symbolic constants
msg1 TEXTEQU <"Hi! Nice to meet you!">
msg2 TEXTEQU <"Have a look at our menu:">


.data
	; allocating memory for our msg1 ad msg2 through variables txt1 and tx2
	txt1 BYTE msg1,0
	txt2 BYTE msg2,0

.code
main PROC
	INVOKE ExitProcess, 0
main ENDP
END main