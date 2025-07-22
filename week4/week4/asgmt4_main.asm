; Author: Simar Rekhi
; Date: 07-04-2025
; Description
COMMENT !
	loop over an array to exchange the even position with the odd position
	thru indexed addressing 
	ex: 2, 5, 7, 8, 1, 3 ==> 5, 2, 8, 7, 3, 1
!

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	arr BYTE 2, 5, 7, 8, 1, 3  ; declaring our BYTE array arr in memory

.code
main PROC
	mov ESI, 0  ; initializing our indexing register with 0
	mov ECX, LENGTHOF arr  ; stores the loop counter as lengthof(array)
	mov AL, 0  ; initialize AL register, this will store the temp value of even value during exchange
	mov BL, 0  ; initialize BL register, this will store the temp vale of odd value during exchange

L1:
	mov AL, arr[ESI]  ; store value at odd index in AL 
	mov BL, arr[ESI + 1]  ; store value at even index in BL
	mov arr[ESI], BL  ; half swap : move even value to odd index
	mov arr[ESI + 1], AL   ; full swap : move odd value to even index

	add ESI, 2  ; increasing ESI by 2 to move to the next odd index
	loop L1

	invoke ExitProcess, 0
main ENDP
END main
