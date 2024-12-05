.global _start
.data
arr: .word 10, 2, 30, 4, 5
.text
_start:

mov r1, #5 // counter
mov r2, #0 // result 
ldr r4,=arr
bl getMax



getMax:
	push {lr, r1}
	mov r3, #0 // max vlue
	while:
	cmp r1, #0
	beq loopDone
	ldr r5, [r4]
	cmp r5, r3
	bgt maxUpdate
	add r4, r4, #4
	sub r1, r1, #1
	b while
	
	maxUpdate:
		mov r3, r5
		add r4, r4, #4
		sub r1, r1, #1
		b while
		
	loopDone:
	mov r0, r3
	pop {lr, r1}
	bx lr
		
	


	
	