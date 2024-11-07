.global _start
.data
marks: .word 85, 72, 86, 78, 92, 75, 83, 94
.text
_start:
	
mov r0, #0 // total mark
ldr r1,=marks
mov r2, #8 // counter

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












