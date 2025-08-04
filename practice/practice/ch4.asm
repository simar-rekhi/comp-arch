; Author
; Date
; Description:
COMMENT !
	MOV instructions to exchange upper and lower bits of a DWORD
	12345678H becomes 56781234h
!

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
	three DWORD 12345678h

.code
main PROC

	mov eax, three ; EAX = 1234 5678
	mov dx, ax  ; store in DX the lower part of three ie 5678
	mov ax, WORD PTR [three + 2] ; store in ax the higher part of three ie 1234
	mov WORD PTR [three], ax 
	mov WORD PTR [three + 2], dx
	mov eax, three

main ENDP
END main