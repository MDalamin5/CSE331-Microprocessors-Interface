.global _start
.data
marks: .word 85, 72, 86, 78, 92, 75, 83, 94
grade: .space 40
.text
_start:
	
// mov r0, #0 // total mark
ldr r1,=marks
ldr r3,=grade
mov r2, #8 // counter

while_loop:
	cmp r2, #0
	beq end
	
	// if else statement
	ldr r4, [r1] // mark aray
	ldr r5, [r3] // grade arr
	cmp r4, #90
	bgt grade_a
	
	cmp r4, #80
	bgt grade_b
	
	cmp r4, #70
	bgt grade_c
	
	
	
	
	grade_a:
		mov r6, #65
		str r6, [r5]
		add r1, r1, #4 // array increment
		add r3, r3, #4 // increment
		sub r2, r2, #1 // counter decrement
		b while_loop
	
	grade_b:
		mov r7, #66
		str r7, [r5]
		add r1, r1, #4
		add r3, r3, #4 // increment
		sub r2, r2, #1
		b while_loop
		
	grade_c:
		mov r8, #67
		str r8, [r5]
		add r1, r1, #4 // mark increment
		add r3, r3, #4 // increment
		sub r2, r2, #1
		b while_loop
		
	
 end:
 mov r7, #1
 swi 0































/*
while_loop:
	cmp r2, #0
	beq end
	
	ldr r3, [r1]
	add r0, r0, r3
	add r1, r1, #4
	sub r2, r2, #1
	b while_loop
	
end:	
// leds showing
mov r6, #0xff000000
orr r6, #0x00200000
orr r6, #0x00

str r0, [r6, #0x00000000]
	
// display showing

mov r4, #0xff000000
orr r4, #0x00200000
orr r4, #0x20

mov r5, #0x7d0000
orr r5, #0x007d00
orr r5, #0x6d
str r5, [r4, #0x00000000]
*/













