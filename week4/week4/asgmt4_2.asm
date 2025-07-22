; Author: Simar Rekhi
; Date: 07-04-2025
; Description
COMMENT !
	To show the addition of two negative integers using BYTE
	in a way that causes the OF flag to be set
!

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	; setting up two SBYTE data labels in memory
	val1 SBYTE -120
	val2 SBYTE -120
	sum SBYTE ?   ;implies uninitialized label


.code
main PROC
	mov AL, val1  ; move val1 to 6-bit lower register AL
	add AL, val2  ; add val2 to AL
	mov sum, AL   ; move contents of AL into sum

	invoke ExitProcess, 0
main ENDP
END main
