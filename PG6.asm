TITLE Program 6A     (PG6.asm)

; Author:					Jeffrey Blake
; Last Modified:			11/26/2018
; OSU email address:		jeffreyb@oregonstate.edu
; Course number/section:	CS271-400
; Project Number: 6A        Due Date: 2 Dec 2018
; Description:				Write a small test program that gets 10 valid integers from the user and stores the numeric values in anarray. 
;							The program then displays the integers, their sum, and their average

INCLUDE Irvine32.inc

; (insert constant definitions here)

SIZE = 10

displayString    MACRO buffer
	push	edx                    ;from lecture example
	mov		edx, buffer
	call	WriteString
	pop		edx                    ;Restore edx
ENDM

mReadStr	MACRO varName			; from lecture example
	push	ecx
	push	edx
	mov		edx, OFFSET varName
	mov		ecx, (SIZEOF varName) – 1 
	call	ReadString
	pop		edx
	pop		ecx
ENDM

.data

progTitle	BYTE	"PROGRAMMING ASSIGNMENT 6: Designing low-level I/O procedures", 0
author		BYTE	"Written by: Jeff Blake", 0
instruct1	BYTE	"Please provide 10 unsigned decimal integers.", 0
instruct2	BYTE	"Each number needs to be small enough to fit inside a 32 bit register.", 0
instruct3	BYTE	"After you have finished inputting the raw numbers I will display a list", 0
instruct4	BYTE	"of the integers, their sum, and their average value.", 0
prompt		BYTE	"Please enter an unsigned number: ", 0
error		BYTE	"ERROR: You did not enter an unsigned number or your number was too big."
tryAgain	BYTE	"Please try again: ", 0
myNums		DWORD	MAX		DUP(?)
inString	BYTE	30		DUP(?)
tempNum		DWORD	?
sum			DWORD	0
space		BYTE	", ", 0


.code
main PROC

	push	OFFSET instruct4
	push	OFFSET instruct3
	push	OFFSET instruct2
	push	OFFSET instruct1
	push	OFFSET author
	push	OFFSET progTitle
	call	intro
	push	OFFSET prompt
	push	OFFSET myNums
	call	readVal

	exit	; exit to operating system
main ENDP

; (insert additional procedures here)
;*********************************************************************************************
;Procedure to introduce the program ,and give user instructions.
;receives: the program title and intructions
;returns: prints the program title, author name, and  instructions
;preconditions:  none
;registers changed: edx
;*********************************************************************************************
intro	PROC

	push	ebp
	mov		ebp, esp
;Display program title on the output screen.
	displayString	[ebp+8]
	call	Crlf
;Display my name to output screen
	displayString	[ebp+12]
	call	Crlf
	call	Crlf
	call	Crlf
;Display program instructions to output screen using a loop
	mov		eax, 16
	mov		ecx, 4
PrintInstruct:
	displayString	[ebp+eax]
	call	Crlf
	add		eax, 4
	loop	PrintInstruct

	pop		ebp
	ret		8
intro	ENDP

;*********************************************************************************************
;Procedure to get 10 numbers inputted from user
;receives: the program title and intructions
;returns: prints the program title, author name, and  instructions
;preconditions:  none
;registers changed: edx
;*********************************************************************************************
readVal	PROC

;Set up stack
	push	ebp
	mov		ebp, esp

	pop		ebp
	ret		8

ReadVal	ENDP

END main
