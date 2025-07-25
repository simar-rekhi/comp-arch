INCLUDE Irvine32.inc
; Author: Simar Rekhi
; Date: 07-25-2025
; Description:

COMMENT!
    random choosing between 3 text colors with given probabilities 
    displays 20 lines of text
!

.data
count      = 20
msgText    BYTE "Random Color Line", 0

; Colors (foreground + background)
WhiteColor = white + (black * 16)
BlueColor  = blue  + (black * 16)
GreenColor = green + (black * 16)

.code
main PROC
    call Randomize          ; Initialize random generator
    mov ecx, count          ; Loop counter

nextLine:
    mov eax, 10             ; Random number range: 0–9
    call RandomRange        ; Result in EAX

    cmp eax, 2
    jbe ChooseWhite         ; 0–2 -> White (30%)

    cmp eax, 3
    je ChooseBlue           ; 3 -> Blue (10%)

    ; Else:  4–9 -> Green (60%)
    jmp ChooseGreen

ChooseWhite:
    mov eax, WhiteColor
    call SetTextColor
    jmp DisplayText

ChooseBlue:
    mov eax, BlueColor
    call SetTextColor
    jmp DisplayText

ChooseGreen:
    mov eax, GreenColor
    call SetTextColor

DisplayText:
    call Crlf
    mov edx, OFFSET msgText
    call WriteString

    loop nextLine

    ; Reset color and exit
    mov eax, lightGray + (black * 16)
    call SetTextColor
    call Crlf
    call WaitMsg
    exit
main ENDP
END main

