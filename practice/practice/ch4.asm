; Author:
; Date:
; Description:
COMMENT !
	given an array of DWORD: 1, 2, 3
	rearranges values/ reverses order to: 3, 2, 1
	using xchg, direct offset and some intermediate data transfer between registers
!

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
arrayD DWORD 1, 2, 3

.code
main PROC
	mov EAX, [arrayD] ; EAX = 000000001h
	xchg EAX, [arrayD + 8]  ; after exchange, EAX = 3 and [arrayD + 8] = 1
	mov [arrayD], EAX ; [arrayD] = 3
	; now, arrayD = 3, 2, 1
	INVOKE ExitProcess, 0
main ENDP
END main


