.386
.model flat, stdcall
.stack 4096

ExitProcess proto, dwExitCode: dword
.code

main PROC

;your assembly code comes here

INVOKE ExitProcess, 0
main ENDP
END main