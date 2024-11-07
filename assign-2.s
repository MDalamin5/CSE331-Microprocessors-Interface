.global _start

val:.word 5
vall:.word 7

summ:.word 0
subb:.word 0
mull:.word 0


_start:
ldr r0,=val
ldr r1, [r0] // use r1

ldr r2,=vall
ldr r3, [r2] // use r3


add r4, r3, r1

sub r6, r3, r1

mul r7, r3, r1

ldr r5, =summ
ldr r8, =subb
ldr r9, =mull

str r4, [r5]
str r6, [r8]
str r7, [r9]

// checking
mov r10, r4
mov r11, r6
mov r12, r7