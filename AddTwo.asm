TITLE MASM Template						(NameReader.asm)

INCLUDE Irvine32.inc

; Brody Carney, Alexandera Avez
.data

	
	colorOfOutput = yellow + (magenta * 16)
	DefaultColor = (lightGray * 16)
	startmsg BYTE "What is the starting number?  ", 0
	endmsg BYTE "What is the ending number?  ", 0
	timesmsg BYTE  "How many times do you want to randomly generate a number?  ", 0
	goodbyemsg BYTE "Thanks for running the lottery simulator..." , 0
	favNumbermsg BYTE "What is your favorite number? ", 0
	luckymsg BYTE "Lucky you! Your number came up this many times: ", 0
	unluckymsg BYTE "Unlucky! Your number Didn't come up :( " , 0
	startNumber DWORD   0
	endNumber  DWORD    0
	numOfLoops  DWORD    0
	favNum DWORD 0
	numofFav DWORD 0







; Code section used to write the code for the program.
.code
main PROC
	call Randomize                      

	mov eax, colorOfOutput

	call SetTextColor              

	call ClrScr                          

	mov	edx, OFFSET startmsg 

	call WriteString               

	call ReadInt                   

	mov	startNumber, eax               

	mov	edx, OFFSET endmsg         

	call WriteString               

	call ReadInt                   

	mov	endNumber,eax
	
	mov	edx, OFFSET favNumbermsg         

	call WriteString               

	call ReadInt                   

	mov	favNum ,eax                       

	mov	edx, OFFSET timesmsg ; display input message to enter number of times value

	call WriteString               

	call ReadInt                   

	mov	numOfLoops, eax                       

	mov ecx, numOfLoops                       

	numberGenerator:

	mov	eax, endNumber                       

	sub eax, startNumber                  

	call RandomRange
	inc eax               

	add eax, startNumber
	
	cmp eax, favNum
	JNE next
	inc numofFav
	next:
	                  

	call WriteDec                        

	call CrLf                            

	loop numberGenerator 
	cmp numofFav, 0
	JE elsebody
	mov	edx, OFFSET luckymsg
	call WriteString
	mov eax, numofFav
	call WriteDec
	JMP ending
	elsebody:
	mov	edx, OFFSET unluckymsg
	call WriteString
	ending:

	call CrLf  
	mov	edx, OFFSET goodbyemsg 

	call WriteString

	exit
main ENDP

END main