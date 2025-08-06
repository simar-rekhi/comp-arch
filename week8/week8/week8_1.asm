INCLUDE Irvine32.inc

; Author: Simar Rekhi
; Date: 08-06-2025
; Description:
COMMENT &
	create PROC AddThree
	- receives three int params, calculates and returns sum in EAX reg
	- also write test program that calls test three with several diff values
&

.data
	msg1 BYTE "Sum is: ",0
.code
main PROC
	; TEST PROGRAM COMES HERE
	; TEST 1: 5 + 10 + 15 = 30
	push 5
	push 10
	push 15
	call AddThree
	mov edx, OFFSET msg1
	call WriteString
	call WriteDec
	call crlf


	; TEST 2: 3 + 3 + 0 = 6
	push 3
	push 3
	push 0
	call AddThree
	mov edx, OFFSET msg1
	call WriteString
	call WriteDec
	call crlf


	exit
main ENDP

;----------------------------
; AddThree PROC


; add eax, first_arg, then second_arg, then third_arg

;-----------------------------

AddThree PROC
	
	enter 0, 0  ; basic setup of stack frame completed in 1 line
	
	mov eax, [ebp + 8]
	add eax, [ebp + 12]
	add eax, [ebp + 16]

	leave  ; takes care of pushing ebp to esp and popping ebp afterwards
	ret 12 ; cleans up three args
AddThree ENDP

END main