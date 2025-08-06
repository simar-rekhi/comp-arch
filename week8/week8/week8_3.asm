INCLUDE Irvine32.inc

; Author: Simar Rekhi
; Date: 08-06-2025
; Description:
COMMENT &
	PROC MultArray
	- receives 3 params: pointers to 2 arrays of DWORD, # of ele
	- create a PROTO declaration
	- display first value of each array
&

.data
	arr1 DWORD 10, 20, 30, 40
	arr2 DWORD 5, 10, 15, 20
	msg1 BYTE "Array 1, ele 1: ",0
	msg2 BYTE "Array 2, ele 1: ", 0
	numElements DWORD 4

.code
;-----------------------------
; MultArray prototype
;-----------------------------

MultArray PROTO, ptr1: PTR DWORD, ptr2: PTR DWORD, count: DWORD
main PROC
	INVOKE MultArray, ADDR arr1, ADDR arr2, numElements
	exit
main ENDP

;-----------------------
; MultArray Procedure
;-----------------------

MultArray PROC USES eax ebx ecx edx esi,
	ptr1:PTR DWORD,
	ptr2:PTR DWORD,
	count:DWORD

	;display first value of array 1
	mov edx, offset msg1
	call WriteString

	mov esi, [ptr1]
	mov eax, [esi]
	call WriteDec
	call crlf

	;display first value of array 2
	mov edx, offset msg2
	call WriteString

	mov esi, [ptr2]
	mov eax, [esi]
	call WriteDec
	call crlf

	ret
MultArray ENDP

END main
