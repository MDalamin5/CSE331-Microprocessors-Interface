.global _start
.data
marks: .word 25, 14, 68, 20, 56, 74, 99, 15, 10, 9, 35
.text
_start:
	
mov r0, #0 // total mark
ldr r1,=marks
mov r2, #11 // counter

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
	
// display showing

mov r4, #0xff000000
orr r4, #0x00200000
orr r4, #0x20

mov r5, #0x660000
orr r5, #0x005b00
orr r5, #0x6d
str r5, [r4, #0x00000000]












