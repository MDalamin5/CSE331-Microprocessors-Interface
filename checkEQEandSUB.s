.global _start
_start:

mov r1, #5
mov r2, #7

bl doSubtraction
mov r8, r3

mov r1, #10
mov r2, #15
bl doSubtraction
mul r4, r3, r8
b end

doSubtraction:
	push {lr}
	bl ifEqual
	cmp r0, #1
	beq doSub
	b end
	doSub:
		sub r3, r1, r2
	pop {lr}
	bx lr
	
//------------------------
		
	
	
	
	
	
ifEqual:
	push {lr, r1, r2}
	cmp r1, r2
	beq isEQE
	mov r0, #1
	pop {lr, r1, r2}
	bx lr
	isEQE:
		mov r0, #0
	pop {lr, r1, r2}
	bx lr
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
end:
mov r0, #1
mov r7, #0
swi 0
	
	