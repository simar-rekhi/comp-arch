; BOILERPLATE FOR CODING ASSIGNMENTS

; Author: Simar Rekhi
; Date: mm-dd-yyyy
; Description:
COMMENT !
	symbolic constants in for days of the week
	initialize an array variable in .data with the above constants
	build successfully
!

; ENVIRONMENT SETUP
.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

;define constants

MON = 1
TUES = 2
WED = 3
THURS = 4
FRI = 5
SAT = 6
SUN = 7

.data
	days BYTE MON, TUES, WED, THURS, FRI, SAT, SUN

.code
main PROC
	INVOKE ExitProcess, 0
main ENDP
END main