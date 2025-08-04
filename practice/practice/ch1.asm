; BOILERPLATE FOR CODING ASSIGNMENTS

; Author: Simar Rekhi
; Date: mm-dd-yyyy
; Description:
COMMENT !
	A = (A+B) - (C+D)
	assign values to regs EAX, EBX, ECX, EDX
	do the neccessary addition and subtraction work
	mov the final result to A
!

; ENVIRONMENT SETUP
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD


.code
main PROC
	; load values in each register
	mov EAX, 20
	mov EBX, 15
	mov ECX, 10
	mov EDX, 35

	; move (A+B) to A and (C+D) to C
	add EAX, EBX  ; EAX = A+B
	add ECX, EDX  ; ECX = C+D

	; subtract val(ECX) from val(EAX)
	sub EAX, ECX

	INVOKE ExitProcess, 0
main ENDP
END main