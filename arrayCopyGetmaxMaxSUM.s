.global _start
.data
numbers: .word 1, 5, 10, 7, 5
double: .space 50

.text
_start:

mov r1, #5 //counter
ldr r2,=numbers
ldr r3,=double
bl get2xNum
bl getMax    //from array1
mov r4, r0   // result store in memory

ldr r2,=double
bl getMax    // from array 2
mov r5, r0
bl getSum
mov r6, r0
// assess leds
mov r7, #0xff000000
orr r7, #0x200000
str r6, [r7, #0]


get2xNum:
	push {lr, r1, r2, r3}
	mov r8, #2
	while:
		cmp r1, #0
		beq loopDone

		ldr r4, [r2]
		mul r5, r4, r8
		str r5, [r3]
		add r2, #4
		add r3, #4
		sub r1, r1, #1
		b while
		loopDone:
		pop {lr, r1, r2, r3}
		bx lr
// funcion end----------------------------------

getMax:
	push {lr, r1, r2, r3}
	mov r4, #0 // max val
	
	m_while:
		cmp r1, #0
		beq maxLdone
		ldr r3, [r2]
		cmp r3, r4
		bgt maxUpdate
		add r2, #4
		sub r1, r1, #1
		b m_while
		
	maxUpdate:
		mov r4, r3
		add r2, #4
		sub r1, r1, #1
		b m_while
	maxLdone:
		mov r0, r4
		pop {lr, r1, r2, r3}
		bx lr
		
// maxFun done ---------------------------------

getSum:
	push {lr, r1, r2, r3, r4}
	add r0, r4, r5
	
	pop {lr, r1, r2, r3, r4}
	bx lr
	
	
end:
mov r7, #0
swi 0
			
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	