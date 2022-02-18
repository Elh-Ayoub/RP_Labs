include win64a.inc

.data
	cWritten dq 0 ;
	Msg db "Calculate the equation 18c/2b  :",0dh,0ah,0 ;
	input_c db "Value of c:  8",0dh,0ah,0 ;
	input_b db "Value of b:  3",0dh,0ah,0 ;
	stdout dq 0
	titl2 db "Result",0
	buf1 db 1024 dup (0)
	buf2 db 1024 dup (0)
	buf3 db 1024 dup (0)
	result_temp db "Result :  %d ",0dh,0ah,0
	ttl db "Elementary console password entry program",0
	cRead dq ?
	cRead1 dq ?
	buf0 dq ?
	buf4 dq ?
	c1 dd 8
	b dd 3
.code
WinMain proc
	sub rsp,28h
	mov rbp,rsp
	invoke GetStdHandle,STD_OUTPUT_HANDLE
	mov stdout,rax
	invoke WriteConsole,stdout,ADDR Msg,sizeof Msg,ADDR cWritten,0
	invoke WriteConsole,stdout,ADDR input_b,sizeof input_b,ADDR cWritten,0
	invoke WriteConsole,stdout,ADDR input_c,sizeof input_c,ADDR cWritten,0

	;;;;;;;;;;;;;;;;;;;;;;
	;Calculate equation
	mov eax, c1
	mov ecx, 18
	mul ecx
	mov ecx, eax
	
	mov eax, 2
	mov ebx, b
	mul ebx
	mov ebx, eax
	
	mov eax, ecx
	div ebx
	
	invoke wsprintf, ADDR buf2, ADDR result_temp, eax
	invoke WriteConsole,stdout,ADDR buf2,sizeof buf2,ADDR cWritten,0
	invoke MessageBox,0,addr buf2,addr titl2,MB_ICONINFORMATION

	;e:
	;invoke ExitProcess,0 ;invoke RtlExitUserProcess,0 ;ExitProcess,0
	
WinMain endp
end

	