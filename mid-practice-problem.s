/*
.global _start
_start:
	
	 mov r0, #0 // febo sum
	 mov r1, #0 // counter
	 mov r2, #0 // a
	 mov r3, #1 // b
	 mov r4, #0 // next
	 while_loop:
	 	cmp r1, #5
		beq end
		
		add r0, r0, r2
		add r4, r2, r3
		mov r2, r3
		mov r3, r4
		
		add r1, r1, #1 // loop update
		b while_loop
	
	end:
	mov r7, #1
	swi 0
	
*/
   
   /*
// 2. Take 5 numbers in an array by using the "Push Buttons" and show the sum of these numbers on the LED.

.global _start
_start:

	mov r1, #0xff000000
	orr r1, #0x00200000
	orr r1, #0x00000040
	mov r3, #0 // counter
	mov r0, #0x66d // sum
	
	// input type like: 1, 2, 3, 4, 5 and sum 15
	while_loop:
		cmp r3, #2
			beq end
		ldr r2, [r1, #0]
		add r0, r0, r2
		add r3, r3, #1

	b while_loop
	
	end:
	mov r4, #0xff000000
	orr r4, #0x00200000
	orr r4, #0x20
	
	str r0, [r4, #0x00000000]
		
	end2:
		mov r7, #1
		swi 0
	


*/

// take input from switch and store another array and find the max element form this array

/*
// array copy...
.global _start
.data
numbers: .word 1, 2, 3, 4, 5, 6
b_arr: .space 30

_start:

ldr r0,=numbers
ldr r1,=b_arr

mov r2, #6
while_loop:
	cmp r2, #0
	beq copy_done
	ldr r3, [r0]
	str r3, [r1]
	add r0, r0, #4
	add r1, r1, #4
	
	sub r2, r2, #1
	
	b while_loop
	
	copy_done:
	mov r7, #1
	swi 0

*/

/*
.global _start
.data
b_arr: .space 30

.text
_start:

// access switch memore
mov r0, #0xff000000
orr r0, #0x00200000
orr r0, #0x00000040


ldr r1,=b_arr  // access blank array location

mov r2, #2 // taking 3 value form user and insert into the array

while_loop:
	cmp r2, #0
	beq end
	
	ldr r3, [r0, #0x00000000]
	str r3, [r1]
	add r1, #4
	
	sub r2, #1
	b while_loop
	

end:
	mov r7, #1
	swi 0


*/

/*
    .data
str:        .asciz "Hippopotamus"      @ Input string
vowels:     .space 20                  @ Array to store vowels (assuming max length of 20)
consonants: .space 20                  @ Array to store consonants (assuming max length of 20)

    .text
    .global _start
_start:
    LDR r0, =str                       @ Load address of input string
    LDR r1, =vowels                    @ Load address of vowels array
    LDR r2, =consonants                @ Load address of consonants array

loop:
    LDRB r3, [r0], #1                  @ Load next character from string and increment pointer
    CMP r3, #0                         @ Check for null terminator
    BEQ end                            @ Exit loop if end of string

    @ Check for vowels (both uppercase and lowercase)
    CMP r3, #'A'                       @ Check if r3 == 'A'
    BEQ store_vowel
    CMP r3, #'E'                       @ Check if r3 == 'E'
    BEQ store_vowel
    CMP r3, #'I'                       @ Check if r3 == 'I'
    BEQ store_vowel
    CMP r3, #'O'                       @ Check if r3 == 'O'
    BEQ store_vowel
    CMP r3, #'U'                       @ Check if r3 == 'U'
    BEQ store_vowel
    CMP r3, #'a'                       @ Check if r3 == 'a'
    BEQ store_vowel
    CMP r3, #'e'                       @ Check if r3 == 'e'
    BEQ store_vowel
    CMP r3, #'i'                       @ Check if r3 == 'i'
    BEQ store_vowel
    CMP r3, #'o'                       @ Check if r3 == 'o'
    BEQ store_vowel
    CMP r3, #'u'                       @ Check if r3 == 'u'
    BEQ store_vowel
    B store_consonant                  @ If not a vowel, go to consonant storage

store_vowel:
    STRB r3, [r1], #1                  @ Store character in vowels array and increment pointer
    B loop                             @ Repeat for the next character

store_consonant:
    STRB r3, [r2], #1                  @ Store character in consonants array and increment pointer
    B loop                             @ Repeat for the next character

end:
    MOV r7, #1                         @ Exit syscall (for Linux-based systems)
    SWI 0                              @ Trigger syscall to exit


*/


// Name writing in memory


/*

.data
name: .space 40

    .text
    .global _start
_start:

ldr r0,=name
mov r1, #0xff000000
orr r1, #0x00200000
orr r1, #0x40

mov r2, #6 // name length
// name: AlAmin
while_loop:
	cmp r2, #0
	beq end
	
	ldr r3, [r1, #0x00000000]
	str r3, [r0]
	add r0, r0, #4
	sub r2, r2, #1
	
	b while_loop
	
end:
	mov r7, #1
	swi 0
	
	
	*/
	



	.data
arr:    .word 1, 3, 5, 6, 7           @ Original array
b_arr:  .space 20                     @ Array to store sorted elements (5 elements * 4 bytes)
n:      .word 5                       @ Number of elements to sort

.text
.global _start
_start:
    ldr r0,=arr
	mov r1, #5 // num of elements of the array
	ldr r5,=b_arr
	
	while_loop:
		cmp r1, #0
		beq end
		
		ldr r2, [r1] // load array first elelmets
		mov r4, r2 // assuming max
		mov r3, #5 // inner loop counter
		inner_loop:
			cmp r3, #0
			beq while_loop
			
			// if else comparing
			cmp r1, r4
			bgt get_max
			add r3, r3, #1 // index update
			add r1, r1, #4 // array next elements
			
	
	
	
	
	
			get_max:
				str r4, [r5]
				add r5, #4
				add r3, r3, #1
				b inner_loop
	
	
	
	
	
	
	
	
	
	
	
	
	

end:
    MOV r7, #1                        @ Exit system call
    SWI 0                             @ Exit
