/*

Length for three sides of a triangle is given as: Base=4, Perpendicular=3 and Hypotenuse=5.

Write a program in ARM assembly that uses Pythagorean theorem to check if a triangle is a Right Triangle or not. 

If it is a right triangle, the program must store 0x00505559 in memory location 0xFF200000.

If it is not a right triangle, the program should store 0x45504F4E in memory location 0xFF200000. 
*/
.data
base: .word 4
perpendicular: .word 3
hypotenuse: .word 5


.text

.global _start
_start:


ldr r2,=base
ldr r3,[r2] 

ldr r4, =perpendicular
ldr r5, [r4]

ldr r6, =hypotenuse
ldr r7, [r6]

mul r8, r3, r3  // bsae2
mul r9, r5, r5 // perpend2
mul r10, r7, r7 // hyp2

add r11, r8, r9 // sum of b2 + per2

cmp r10, r11

BEQ true
mov r1, #0x45000000
orr r1,r1, #0x500000
orr r1,r1, #0x4f00
orr r1,r1, #0x4e

mov r12, #0xFF000000
orr r12, r12, #0x200000
//mov r0, #0xfffffff0
str r1, [r12, #0x00000000]
b end

true:
mov r0,   #0x500000
orr r0,   #0x5500
orr r0,   #0x59

mov r12, #0xFF000000
orr r12, r12, #0x200000
//mov r0, #0xfffffff0
str r0, [r12, #0x00000000]

end:


	