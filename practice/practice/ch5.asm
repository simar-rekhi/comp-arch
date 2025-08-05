INCLUDE Irvine32.inc

; Author:
; Date:
; Description
COMMENT !
	using the irvine library: 
	clear the screen, delay prog by 500 ms, dump regs and flags
!

.code
main PROC
	call Clrscr
	mov eax, 500
	call Delay
	call DumpRegs

	exit
main ENDP
END main