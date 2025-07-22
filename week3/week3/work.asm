; Author: Simar Rekhi
; Date: 6-28-2025
; Description:
COMMENT ! 
	add 5 to EAX register
	add 5 to EDX register
	then show usage in variable form
!

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.code
main PROC
	
	add EAX, 5  ; added 5 to EAX 
	add EDX, 5  ; added 5 to EDX

	INVOKE ExitProcess,0

main ENDP
END main