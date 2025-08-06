INCLUDE Irvine32.inc

; Author: Simar Rekhi
; Date: 08-06-2025
; Description:
COMMENT &
	PROC FindThrees
	- receives 2 params: array pointer, array size
	- returns 1 in EAX if three consecutive 3s are found, else 0
	- preserves all regs except EAX
&

.data
	arr1 DWORD 3, 3, 3, 7, 8, 9           ; should return 1
	arr2 DWORD 1, 2, 3, 3, 4, 3           ; should return 0
	arr3 DWORD 3, 3, 3, 3, 3              ; should return 1
	arr4 DWORD 0, 0, 0, 0                 ; should return 0
	msg  BYTE "Result: ", 0
	nl   BYTE 0Dh,0Ah,0

.code

;-------------------------------
; Prototype
;-------------------------------
FindThrees PROTO, arrPtr: PTR DWORD, arrSize: DWORD

main PROC
	INVOKE FindThrees, ADDR arr1, LENGTHOF arr1
	mov edx, OFFSET msg
	call WriteString
	call WriteDec
	call Crlf

	INVOKE FindThrees, ADDR arr2, LENGTHOF arr2
	mov edx, OFFSET msg
	call WriteString
	call WriteDec
	call Crlf

	INVOKE FindThrees, ADDR arr3, LENGTHOF arr3
	mov edx, OFFSET msg
	call WriteString
	call WriteDec
	call Crlf

	INVOKE FindThrees, ADDR arr4, LENGTHOF arr4
	mov edx, OFFSET msg
	call WriteString
	call WriteDec
	call Crlf

	exit
main ENDP

;---------------------------------
; FindThrees Procedure
;---------------------------------

FindThrees PROC USES ebx ecx edx esi,
	arrPtr: PTR DWORD,
	arrSize: DWORD

	mov eax, 0                ; default return value = 0
	mov ecx, arrSize
	cmp ecx, 3
	jl done                   ; less than 3 elements can't have 3 threes

	mov esi, arrPtr           ; ESI points to the array
	mov ecx, arrSize
	sub ecx, 2                ; stop at arrSize - 2

check_loop:
	mov ebx, [esi]
	cmp ebx, 3
	jne skip

	mov ebx, [esi + 4]
	cmp ebx, 3
	jne skip

	mov ebx, [esi + 8]
	cmp ebx, 3
	jne skip

	mov eax, 1                ; found 3 consecutive 3s
	jmp done

skip:
	add esi, 4
	loop check_loop

done:
	ret
FindThrees ENDP

END main
