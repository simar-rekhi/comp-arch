; Author:
; Date:
; Description:
COMMENT !
	using loop to copy a string
!

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
str1 BYTE "i like pineapples",0
str2  BYTE SIZEOF str1 DUP(0)


.code
main PROC
	
	mov ecx, SIZEOF str1 ; set the counter
	mov esi, 0

	L1:
		mov al, str1[esi]
		mov str2[esi], al
		inc esi  ; alternatively, add esi, TYPE str1
		LOOP L1
	
	INVOKE ExitProcess, 0
main ENDP
END main


