.global _start
.data
array: .space 50
.text
_start:

// get input from push button and store in array

mov r0, #2
mov r1, #0xff000000
orr r1, #0x200000
orr r1, #0x50

ldr r2,=array

while:
	cmp r0, #0
	beq done
	ldr r3, [r1, #0]
	str r3, [r2]
	add r2, #4
	sub r0, #1
	b while
	
	done:
	mov r7, #0
	swi 0
	