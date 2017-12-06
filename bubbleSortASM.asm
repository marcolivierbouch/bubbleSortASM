.code

;Params
;RCX = array
;RDX = capacity
bubbleSort PROC

	cmp rdx, 2													; Dont sort if the array is less than two number
	jl _exit

	mov r10, rdx														
	dec r10																
	shl r10, 3													; Get total capacity in long long format
	push r10													; Keep temp value of capacity

	xor r9, r9													; r9 check if we swapped or not (1 = true) (0 = false)
	bts r9, 0													; Dont exit on first check of r9

	_iLoop:
		btr r9, 0												; Bit test and reset bit 0 at false						
		jnc _exit												; Exit if we didnt swapped once

		xor rbx, rbx												; rbx is the counter of loop (j)
		xor rsi, rsi													

		dec rdx													; capacity -- # check one less value every loop
		cmp rdx, 1												; if capacity == 1 its mean that we checked the complete array then exit 
		je _exit

		mov rsi, [rsp]												; Get temp value of capacity

		_jLoop:	
			mov r8, [rcx + rsi]										; Get the number after the current number 
			cmp [rcx + rsi - 8], r8										; Compare the current number with the number after
			jg _swap													
			jle _continueLoop
		
			_swap:
				bts r9, 0										; Set swapped at true
				push [rcx + rsi] 										
				push [rcx + rsi - 8]									
				pop	qword ptr[rcx + rsi]								; pop to swap the numbers added in the stack
				pop qword ptr[rcx + rsi - 8]							

			_continueLoop:											; jmp here if you dont need to swap
				inc rbx											; Increase the loop counter
				sub rsi, 8										; Get the next number (inc 8 bytes because using size_t)
				cmp rbx, rdx										; if the loop counter == capacity than jmp to iLoop
				je _iLoop 
				jmp _jLoop

	_exit:
		add rsp, 8												; pop 8 bits of the stack because of the capacity temp value
		ret

bubbleSort ENDP

