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

.data

title		BYTE	"PROGRAMMING ASSIGNMENT 6: Designing low-level I/O procedures", 0
author		BYTE	"Written by: Jeff Blake", 0
instruct1	BYTE	"Please provide 10 unsigned decimal integers.", 0
instruct2	BYTE	"Each number needs to be small enough to fit inside a 32 bit register.", 0
instruct3	BYTE	"After you have finished inputting the raw numbers I will display a list", 0
instruct4	BYTE	"of the integers, their sum, and their average value.", 0

.code
main PROC

; (insert executable instructions here)

	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
