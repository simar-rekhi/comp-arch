; BOILERPLATE FOR CODING ASSIGNMENTS

; Author: Simar Rekhi
; Date: mm-dd-yyyy
; Description:
COMMENT !
	adds 5 to EAX
	adds 5 to EDX
	generate a listing file & examine machine code
!

; ENVIRONMENT SETUP
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD


.code
main PROC
	; move values to EAX and EDX regs
	mov EAX, 5
	mov EDX, 5

	INVOKE ExitProcess,0
main ENDP
END main