; Author: Simar Rekhi
; Date: 07-04-2025
; Description
COMMENT !
	loop to iterate over a DWORD array calculate the sum of its elements (possibly thru indexing/offset)
	sum must be saved in a variable
!

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	arr1 DWORD 20, 40, 60, 80, 100  ; initializing our array
	arrSum DWORD 0  ; 0-initialized DWORD label to store sum of array

.code
main PROC
	mov ESI, 0  ; initializing our indexing register with 0
	mov EAX, 0  
	mov ECX, LENGTHOF arr1  ; sets the loop counter for ECX

L1:
	add EAX, arr1[ESI*4]  ; using scale factor for correct indexing
	inc ESI  ; updating ESI register by adding 1
	loop L1

	mov arrSum, EAX   ; save final sum in arrSum

	invoke ExitProcess, 0
main ENDP
END main 