; Author: Simar Rekhi
; Date: 07-04-2025
; Description
COMMENT !
	switch upper and lower halves of DWORD variable 'three'
	12345678h ==> 56781234h
	making use of the 16-but registers AX and BX that store lower part of EAX and EBX
!

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	three DWORD 12345678h

.code
main PROC
	mov EAX, three  ; moves the content from memory to 32-bit register
	mov DX, AX  ; stores lower word 5678h in DX reg
	mov AX, WORD ptr [three + 2]  ; since high word 1234h is stores 2 bytes after low
	mov WORD ptr [three], AX ; store low word first
	mov WORD ptr [three + 2], DX ; store high word next

	mov EAX, three
	invoke ExitProcess, 0
main ENDP
END main
