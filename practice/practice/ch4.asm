; Author:
; Date:
; Description:
COMMENT !
	using LOOP compute the sum of elements in arrayD
!

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
arrayD WORD 100h, 200h, 300h, 400h

.code
main PROC
	
	mov ax, 0
	mov edi, OFFSET arrayD ; stores address of first ele of arrayD
	mov ecx, LENGTHOF arrayD ; for us, ecx = 4

	L1:
		add ax, [edi]
		add edi, TYPE arrayD
		LOOP L1
	
	INVOKE ExitProcess, 0
main ENDP
END main


