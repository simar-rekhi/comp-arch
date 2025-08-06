INCLUDE Irvine32.inc

; Author: Simar Rekhi
; Date: 08-06-2025
; Description:
COMMENT &
	PROC SetColor
	- receives two params: forecolor and backcolor
	- calls SetTextColor
	- write a test program too
&

.data
	msg BYTE "FORECOLOR IS BLUE & BACKCOLOR IS YELLOW"
.code
main PROC
	;TEST PROGRAM COMES HERE
	push 1 ; BLUE [ebp + 8]
	push 14 ; YELLOW [ebp + 12]
	call SetColor

	exit
main ENDP

;--------------------------------
; SetColor procedure

;--------------------------------
SetColor PROC
	enter 0,0

;   mov eax, forecolor + (backcolor*16)
	movzx eax, byte ptr [ebp + 8]  ; fore
	movzx ebx, byte ptr [ebp + 12] ; back
	shl ebx, 4  ; this multiplies ebx by 16
	or eax, ebx  ; combines the colors
	call SetTextColor
	mov edx, OFFSET msg
	call WriteString
	leave
	ret 8

SetColor ENDP
END main