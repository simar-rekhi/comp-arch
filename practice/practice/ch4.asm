; Author
; Date
; Description:
COMMENT !
	in every pair in an array, swap values at even and odd pos
	1, 2, 3, 4 => 2, 1, 4, 3
!

.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode: DWORD

.data
	arr BYTE 1, 2, 3, 4

.code
main PROC

	mov ECX, LENGTHOF arr
	mov esi, 0

	L1:
		; exchange pos 1 and 2
		mov al, arr[esi] ; al = 1
		xchg arr[esi + 1], al ; al = 2 and arr[esi + 1] = 1
		mov arr[esi], al ; arr[esi] = 2 ie exchange completed in a pair
		add esi, 2 ; lets you shift the pointer to a new pair altogether
		LOOP L1

	INVOKE ExitProcess, 0

main ENDP
END main