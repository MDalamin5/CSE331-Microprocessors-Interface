.data
var: .word 1, 2, 3, 4, 5
b_arr: .space 

.global _start
_start:

 ldr r0,=b_arr
 mov r1, #0xff000000
 orr r1, r1, #0x00200000
 orr r1, r1, #0x00000040
 
 // name: ALI
 mov r3, #2
 ldr r2, [r1, #0]
 str r2, [r0]
 loop:
 cmp r3, #0
 beq end
 add r0, r0, #4
 ldr r2, [r1, #0]
 str r2, [r0]
 sub r3, r3, #1
 b loop
 
 end:
 mov r7, #1
 swi 0
 
 
 
 
 
 
 
 
 
	