.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode: dword
.code

main PROC

;ADDING TWO 32-bit INTEGERS

COMMENT $
	This is how multi-line comments are made.
	move to eax the number 5
	add to eax the number 6
$

	mov eax,5 
	add eax,6 

INVOKE ExitProcess, 0
main ENDP
END main