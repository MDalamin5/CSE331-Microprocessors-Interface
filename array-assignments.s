.global _start
.data
arr1: .word 2, 4, 6, 8, 10
arr2: .word 1, 2, 3, 4, 5
blank_arr: .space 40

.text
_start:

ldr r0,=arr1
ldr r1,=arr2
ldr r2,=blank_arr
mov r8, #5

hello_loop:
ldr r3, [r0]
ldr r4, [r1]
ldr r5, [r2]
add r6, r4, r3
str r6, [r2]
add r0, #4
add r1, #4
add r2, #4
subs r3, #1
bne hello_loop


