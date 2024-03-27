section .text
[bits 16]
org 0h
host_exe_header:
.signature: dw 'MZ'     ; the 'MZ' characters
.last_page_size: dw 1   ; number of used bytes in the final file page, 0 for all
.page_count: dw 1       ; number of file pages including any last partial page
.reloc: dw 0            ; number of relocation entries after the header
.paragraphs: dw 0       ; size of header + relocation table, in paragraphs
.minalloc: dw 0         ; minimum required additional memory, in paragraphs
.maxalloc: dw 0xFFFF    ; maximum memory to be allocated, in paragraphs
.in_ss: dw 1000h           ; initial relative value of the stack segment
.in_sp: dw 0xFFFF       ; initial sp value
.checksum: dw 0         ; checksum: 1's complement of sum of all words
.in_ip: dw mainstart        ; initial ip value
.in_cs: dw  0      ; initial relative value of the text segment
.offset: dw 0         ; offset of the relocation table from start of header
.overlay: dw start          ; overlay value (0h = main program)
.overlay2: dw 0
.reserv : times 1 db 0x90 
mainstart:
main:
jmp start
db 'build in index32 developer tools.... '
mains:

;body start
; txt body
	mov si,L9000
	mov eax,[si]
	call scr
	mov bx,L9006
	mov al,[bx]
	mov edi,140000h
	mov ecx,1ffffh
	push ds
	push es
	mov edx,0
	mov ds,dx
	mov es,dx
	call memfilld
	pop es
	pop ds
	mov bx,L9010
	mov di,bx
	mov bx,L9001
	mov si,bx
	mov eax,[si]
	mov [di],eax
	LLLL5017:
	mov si,L9011
	mov ax,[si]
	mov si,boxdx
	mov [si],ax
	mov si,L9013
	mov ax,[si]
	mov si,boxdy
	mov [si],ax
	mov si,L9012
	mov ax,[si]
	mov si,boxdx1
	mov [si],ax
	mov si,L9014
	mov ax,[si]
	mov si,boxdy1
	mov [si],ax
	mov si,L9010
	mov al,[si]
	mov si,boxdcolor
	mov [si],al
	call boxd32
	mov si,L9011
	xor eax,eax
	mov ax,[si]
	mov si,L9012
	xor ebx,ebx
	mov bx,[si]
	sub ebx,eax
	mov eax,ebx
	push eax
	xor ecx,ecx
	xor edx,edx
	mov ebx,4
	div ebx
	xor ecx,ecx
	xor edx,edx
	mul ebx
	pop ebx
	sub ebx,eax
	mov si,L9012
	xor eax,eax
	mov ax,[si]
	sub eax,ebx
	mov si,boxx
	mov [si],ax
	mov si,L9013
	mov ax,[si]
	mov si,boxy
	mov [si],ax
	mov si,L9012
	mov ax,[si]
	mov si,boxx1
	mov [si],ax
	mov si,L9014
	mov ax,[si]
	mov si,boxy1
	mov [si],ax
	mov si,L9010
	mov al,[si]
	mov si,boxcolor
	mov [si],al
	call box32
	mov bx,L9011
	mov eax,[bx]
	mov bx,L9006
	mov ecx,[bx]
	add eax,ecx
	mov bx,L9011
	mov [bx],eax
	mov bx,L9013
	mov eax,[bx]
	mov bx,L9006
	mov ecx,[bx]
	add eax,ecx
	mov bx,L9013
	mov [bx],eax
	mov bx,L9012
	mov eax,[bx]
	mov bx,L9006
	mov ecx,[bx]
	add eax,ecx
	mov bx,L9012
	mov [bx],eax
	mov bx,L9014
	mov eax,[bx]
	mov bx,L9006
	mov ecx,[bx]
	add eax,ecx
	mov bx,L9014
	mov [bx],eax
	mov bx,L9002
	mov ecx,[bx]
	mov bx,L9007
	mov di,bx
	mov bx,L9010
	mov si,bx
	mov eax,[si]
	add eax,ecx
	mov [si],eax
	mov ecx,[di]
	cmp eax,ecx
	jg LA4023
	jmp LLLL5017
	LA4023:
	call setvideo
	call waits
	mov bx,L9010
	mov [bx],ax
	mov si,L9004
	mov eax,[si]
	call scr

;end of body
exit:
      mov si,rreservemem
      mov eax,[si]
	mov ax,0
	mov ds,ax
      mov ebx,180004h
      mov [ebx],eax
	retf
	mov ax,cs
	mov ds,ax
	mov ax,0ffffh
	mov ax,cs
	xor ax,ax
	push ax
	xor ax,ax
	int 0x21
	ret
ret
len32:
          push ebx                
          push ecx                
          push edx                
          push esi                
          push edi                
          push ebp                
          push ds                
          mov bp,0                
          mov ds,bp
	    mov ecx,0
len321:
	    ds
	    mov al,[esi]
	    cmp al,0
	    jz len323
	    inc esi
	    inc ecx
	    jmp len321
len323:
		mov eax,ecx
                    pop ds          
                    pop ebp         
                    pop edi         
                    pop esi         
                    pop edx         
                    pop ecx         
                    pop ebx         
	ret
ret
strcat:
	mov ax,0
	mov ds,ax
	mov ah,0
strcat2:
	mov al,[edi]
	cmp al,ah
	jz strcat3
	inc edi
	jmp strcat2
strcat3:
	mov al,[esi]
	mov [edi],al
	cmp al,ah
	jz strcat4
	inc esi
	inc edi
	jmp strcat3
strcat4:
	mov ax,cs
	mov ds,ax
	ret
COPYMEM32:
          push eax                
          push ebx                
          push ecx                
          push edx                
          push esi                
          push edi                
          push ebp                
          push ds                
          mov bp,0                
          mov ds,bp
          cmp edx,0
          JZ COPYMEM326
          COPYMEM3211:
          cmp ecx,0
          JZ COPYMEM326
          COPYMEM321:
                    ds
                    mov al,[esi]
                    ds
                    mov [edi],al
                    clc             
                    add edi,edx
                    inc esi         
                    dec ecx         
                    jnz COPYMEM321
                    COPYMEM326:
                    pop ds          
                    pop ebp         
                    pop edi         
                    pop esi         
                    pop edx         
                    pop ecx         
                    pop ebx         
                    pop eax         
                    RET             
MEM32:                
          push esi                
          and eax,0ffffh
          clc                
          shl eax,4
          and esi,0ffffh
          clc                 
          add eax,esi
          pop esi                
          RET                
MOVEMEM32:
          push eax                
          push ebx                
          push ecx                
          push edx                
          push esi                
          push edi                
          push ebp                
          push ds                
          mov bp,0                
          mov ds,bp
          MOVEMEM3211:
          cmp ecx,0
          JZ MOVEMEM326
          MOVEMEM321:
                    ds
                    mov al,[esi]
                    ds
                    mov [edi],al
                    dec edi
                    dec esi         
                    dec ecx         
                    jnz MOVEMEM321
                    MOVEMEM326:
                    pop ds          
                    pop ebp         
                    pop edi         
                    pop esi         
                    pop edx         
                    pop ecx         
                    pop ebx         
                    pop eax         
                    RET             
GOTOXY:                
          push ebx                
          push ecx                
          push edx                
          push esi                
          push edi                
          push ebp                
          mov si,ax
          mov di,bx
          and si,0fffh
          and di,0fffh
          xor cx,cx
          xor dx,dx
          mov ax,si
          mov bx,2                
          clc                
          mul bx                
          mov si,ax
          mov ax,di
          mov bx,160
          clc                
          mul bx                
          mov bx,si
          clc                
          add ax,bx
          and eax,0ffffh
          mov ebx,0b8000h
          clc                
          add eax,ebx
          pop ebp                
          pop edi                
          pop esi                
          pop edx                
          pop ecx                 
          pop ebx                
          RET                
PRINT32:                
          push eax             
          push ebx             
          push ecx             
          push edx             
          push esi             
          push edi             
          push ebp             
          cmp ecx,0
          JZ PRINT3213
          push esi             
          mov si,x             
          cs             
          mov al,[si]             
          cs             
          mov bl,[si+1]             
          pop esi             
          and ax,0ffh
          and bx,0ffh
          call GOTOXY
          mov edi,eax
          cmp ecx,255
          JB PRINT3212
          mov ebx,255
          PRINT3212:
          mov edx,2
          call COPYMEM32
          push esi             
          mov si,x             
          cs             
          mov al,[si]          
          cs             
          mov bl,[si+1]        
          pop esi             
          and ax,0ffh
          and bx,0ffh
          mov si,bx
          clc                
			
          add ax,cx
          cmp ax,80
          JB PRINT328
          mov bx,80
          sub ax,bx
          xor dx,dx
          xor cx,cx
          mov bx,80
          clc                
          div bx               
          clc                
          add ax,si
          cmp ax,24
          JB PRINT328
          mov ax,24
          PRINT328:
          push esi             
          mov si,x             
          cs             
          mov [si+1],al        
          cs             
          mov [si],dl 
          pop esi             
          PRINT3213:
          pop ebp              
          pop edi              
          pop esi              
          pop edx              
          pop ecx              
          pop ebx              
          pop eax              
          RET                
timer:
	push ebx
	push ds
	mov ax,0x40
	mov ds,ax
	mov bx,0x6c
	mov eax,[bx]
	pop ds
	pop ebx
ret
sleep:
	mov ecx,eax
	xor eax,eax
	cmp eax,ecx
	jz sleep6
	call timer
	clc
	add ecx,eax
	jo sleep8
	call timer
	cmp eax,ecx
	jz sleep6
	sleep1:
		call timer
		cmp eax,ecx
		jz sleep6
		jb sleep1
	jmp sleep6
	sleep8:
	sleep5:
		call timer
		cmp eax,ecx
		jz sleep6
		ja sleep5
	jmp sleep1
sleep6:
ret
inkey:
	mov ah,0x1
	int 0x16
	jnz waits
nwaits:
	xor ax,ax
	ret
waits:
	xor ax,ax
	int 0x16
	xor cl,cl
	mov ah,cl
	ret
echo:
          push ax
          push bx
          push cx
          push dx
          push di
          push si
          push bp
          push es
          mov ax,cs
          mov es,ax
          xchg si,bp
          mov bx,bp
          cs
          mov cl,[bx]
          inc bp
          and cx,0ffh
          mov bx,x
          cs
          mov dx,[bx]
          mov bx,color
          cs
          mov al,[bx]
          mov bl,al
          mov bh,0
          mov al,0
          mov ah,13h
          int 10h
          pop es
          pop bp
          pop si
          pop di
          pop dx
          pop cx
          pop bx
          pop ax
          RET
val:
		mov ax,0
		mov ds,ax
		mov ecx,0
		mov edx,0
		mov ebx,1
		mov eax,0
val2:
		mov al,[esi]
		cmp al,48
		jb val3
		cmp al,57
		ja val3
		jmp val4
val3:
		cmp cl,0
		jz val40
		jmp val5
val4:
		cmp cl,9
		jz val55
		inc cl
		inc esi
		jmp val2
val55:
		dec cl
val5:
		dec esi
val6:
		push ecx
		push edx
		xor eax,eax
		mov al,[esi]
		clc
		sub al,48
		xor ecx,ecx
		xor edx,edx
		push ebx
		imul ebx
		xor ecx,ecx
		xor edx,edx
		pop ebx
		push eax
		mov eax,10
		imul ebx
		mov ebx,eax
		pop eax
		pop edx
		pop ecx
		clc
		add edx,eax
		dec esi
		dec cl
		cmp cl,0
		jz val40
		jmp val6
val40:
		mov eax,edx
		mov bp,cs
		mov ds,bp
		mov [di],eax
ret
STR32:     
        push eax                
        push ebx                
        push ecx                
        push edx                
        push edi                
        push esi                
        push ebp                
        push ds                
        mov eax,[si]
        mov ebp,0
        mov ds,bp                
        mov ebp,1000000000
        STR321:                
                  xor edx,edx
                  xor ecx,ecx
                  mov ebx,ebp
                  clc            
                  div ebx        
                  mov esi,edx
                  mov ah,'0'
                  clc            
                  add al,ah
                  mov [edi],al
                  inc edi         
                  mov eax,ebp
                  xor edx,edx
                  xor ecx,ecx
                  mov ebx,10
                  clc            
                  div ebx        
                  mov ebp,eax
                  mov eax,esi
                  cmp ebp,0
                  JNZ STR321
                          
          pop ds                
          pop ebp                
          pop esi                
          pop edi                
          pop edx                
          pop ecx                
          pop ebx                
          pop eax                
          RET          
start:
		;start stack 64k
	mov ax,cs
	mov cx,0x1000
	add ax,cx
	mov ax,0xffff
	xor ax,ax
	push ax
		;end stack 64k
		;start alocate
	mov bx,L18
	mov ax,endf
	mov cx,8
	add ax,cx
	mov [bx],ax
		;end alocate
		;start randomize
	call timer
	mov bx,L20
	xor cx,cx
	mov cl,al
	mov ax,257
	add ax,cx
	mov [bx],ax
		;end randomize
      xor ax,ax
      mov ds,ax
      mov edx,1234567890
      mov ebx,180000h
      mov eax,[ebx]
      cmp eax,edx
      jz reservemem
      mov eax,4
      clc
      add ebx,eax
      mov eax,100h
      clc
      add eax,ebx
      mov [ebx],eax
      mov eax,1234567890
      mov ebx,180000h
      mov [ebx],eax
reservemem:
      mov ebx,180004h
      mov eax,[ebx]
      mov si,rreservemem
      cs
      mov [si],eax
      mov ax,cs
      mov ds,ax

jmp mains
RESERVES:
          push ebx
          push ecx
          push edx
          push edi
          push esi
          push ebp
          push ds 
          push es 
          JMP RESERVES2
          RESERVES2:
          xor ax,ax
          mov ds,ax
          mov ebx,180004h
          mov eax,[ebx]

          mov edx,eax
          clc               
          add edx,ecx
          add edx,4
          mov [ebx],edx
          mov ebx,eax
          mov esi,eax
          mov [ebx],ecx
          mov eax,esi
          clc
          add eax,4
          clc
          add eax,ecx
          dec eax
          mov ebx,eax
          mov al,0
          mov [ebx],al
          mov eax,esi
          clc
          add eax,4
          pop es
          pop ds
          pop ebp
          pop esi
          pop edi
          pop edx
          pop ecx
          pop ebx
                   
          RET     
FILL32:             
          push eax  
          push ebx  
          push ecx  
          push edx  
          push esi  
          push edi  
          push ebp  
          push ds   
          mov bp,0  
          mov ds,bp
          cmp edx,0
          JNZ FILL3211
          inc edx       
          FILL3211:
          FILL321:      
                    mov [edi],al
                    clc 
                    add edi,edx
                    dec ecx      
                    JNZ FILL321
          pop ds                
          pop ebp                
          pop edi                
          pop esi                
          pop edx                
          pop ecx                
          pop ebx                
          pop eax                
          RET                
scr:
	mov ebx,255
	cmp eax,ebx
	ja scr1
	mov ah,0
	int 10h
	ret
scr1:
	mov bx,ax
	mov ax,4f02h
	int 10h
	ret
setvideo:
	push ds
	push es
	mov dx,0
	mov esi,140000h
	mov ds,dx
	mov es,dx
setvideo2:
	mov ax,4f05h
	mov bx,0
	int 10h
	inc dx
setvideo3:
	mov edi,0a0000h
	mov ecx,4000h
	call memcopyd
	cmp dx,4
	jb setvideo2
	pop es
	pop ds
	ret
hline32:
	mov si,hlinex
	mov ax,[si]
	mov bx,640
	cmp ax,bx
	jb hline32xxl
	dec bx
	mov [si],bx
hline32xxl:
	mov bx,-1
	cmp ax,bx
	jg hline32xxh
	inc bx
	mov [si],bx
hline32xxh:
	mov si,hliney
	mov ax,[si]
	mov bx,400
	cmp ax,bx
	jb hline32yyl
	dec bx
	mov [si],bx
hline32yyl:
	mov bx,-1
	cmp ax,bx
	jg hline32yyh
	inc bx
	mov [si],bx
hline32yyh:
	mov si,hlinex1
	mov ax,[si]
	mov bx,640
	cmp ax,bx
	jb hline32xxxl
	dec bx
	mov [si],bx
hline32xxxl:
	mov bx,-1
	cmp ax,bx
	jg hline32xxxh
	inc bx
	mov [si],bx
hline32xxxh:
	mov si,hlinex
	mov ax,[si]
	mov si,hlinex1
	mov bx,[si]
	cmp ax,bx
	ja hline32end
	jz hline32end
	mov si,hliney
	xor eax,eax
	mov ax,[si]
	mov ebx,640
	mov ecx,0
	mov edx,0
	mul ebx
	mov ebx,140000h
	add eax,ebx
	mov si,hlinex
	xor ebx,ebx
	mov bx,[si]
	add eax,ebx
	mov edi,eax
	mov si,hlinex1
	xor eax,eax
	mov ax,[si]
	sub eax,ebx
	mov ecx,eax
	mov si,hlinecolor
	mov al,[si]
	push ds
	push es
	mov bp,0
	mov ds,bp
	mov es,bp
	call memfill
	pop es
	pop ds
hline32end:
	ret
vline32:
	mov si,vlinex
	mov ax,[si]
	mov bx,640
	cmp ax,bx
	jb vline32xxl
	dec bx
	mov [si],bx
vline32xxl:
	mov bx,-1
	cmp ax,bx
	jg vline32xxh
	inc bx
	mov [si],bx
vline32xxh:
	mov si,vliney
	mov ax,[si]
	mov bx,400
	cmp ax,bx
	jb vline32yyl
	dec bx
	mov [si],bx
vline32yyl:
	mov bx,-1
	cmp ax,bx
	jg vline32yyh
	inc bx
	mov [si],bx
vline32yyh:
	mov si,vliney1
	mov ax,[si]
	mov bx,400
	cmp ax,bx
	jb vline32xxxl
	dec bx
	mov [si],bx
vline32xxxl:
	mov bx,-1
	cmp ax,bx
	jg vline32xxxh
	inc bx
	mov [si],bx
vline32xxxh:
	mov si,vliney
	mov ax,[si]
	mov si,vliney1
	mov bx,[si]
	cmp ax,bx
	ja vline32end
	jz vline32end
	mov si,vliney
	xor eax,eax
	mov ax,[si]
	mov ebx,640
	mov ecx,0
	mov edx,0
	mul ebx
	mov ebx,140000h
	add eax,ebx
	mov si,vlinex
	xor ebx,ebx
	mov bx,[si]
	add eax,ebx
	mov edi,eax
	mov si,vliney
	xor ebx,ebx
	mov bx,[si]
	mov si,vliney1
	xor eax,eax
	mov ax,[si]
	sub eax,ebx
	mov ecx,eax
	mov si,vlinecolor
	mov al,[si]
	push ds
	push es
	mov bp,0
	mov ds,bp
	mov es,bp
	mov dx,640
	call FILL32
	pop es
	pop ds
vline32end:
	ret
box32:
	mov si,boxx
	mov ax,[si]
	mov bx,640
	cmp ax,bx
	jb box32xxl
	dec bx
	mov [si],bx
box32xxl:
	mov bx,-1
	cmp ax,bx
	jg box32xxh
	inc bx
	mov [si],bx
box32xxh:
	mov si,boxy
	mov ax,[si]
	mov bx,400
	cmp ax,bx
	jb box32yyl
	dec bx
	mov [si],bx
box32yyl:
	mov bx,-1
	cmp ax,bx
	jg box32yyh
	inc bx
	mov [si],bx
box32yyh:
	mov si,boxx1
	mov ax,[si]
	mov bx,640
	cmp ax,bx
	jb box32xxxl
	dec bx
	mov [si],bx
box32xxxl:
	mov bx,-1
	cmp ax,bx
	jg box32xxxh
	inc bx
	mov [si],bx
box32xxxh:
	mov si,boxy1
	mov ax,[si]
	mov bx,400
	cmp ax,bx
	jb box32yyyl
	dec bx
	mov [si],bx
box32yyyl:
	mov bx,-1
	cmp ax,bx
	jg box32yyyh
	inc bx
	mov [si],bx
box32yyyh:
	mov si,boxx
	mov ax,[si]
	mov si,boxx1
	mov bx,[si]
	cmp ax,bx
	ja box32end
	jz box32end
	mov si,boxy
	mov ax,[si]
	mov si,boxy1
	mov bx,[si]
	cmp ax,bx
	ja box32end
	jz box32end
	mov si,boxy
	mov ax,[si]
	mov si,boxy1
	mov bx,[si]
	sub bx,ax
	mov [si],bx
	cmp bx,0
	jz box32end
	mov si,boxy
	xor eax,eax
	mov ax,[si]
	mov ebx,640
	mov ecx,0
	mov edx,0
	mul ebx
	mov ebx,140000h
	add eax,ebx
	mov si,boxx
	xor ebx,ebx
	mov bx,[si]
	add eax,ebx
	mov edi,eax
	mov si,boxx1
	xor eax,eax
	mov ax,[si]
	sub eax,ebx
	mov ecx,eax
	mov si,boxcolor
	mov al,[si]
	mov edx,1
	mov si,boxy1
	mov bx,[si]
	mov si,bx
	mov ebx,640
	mov bp,0
	push ds
	push es
	mov ds,bp
	mov es,bp
box32loop:
	push edi
	push ecx
	call memfill
	pop ecx
	pop edi
	add edi,ebx
	dec si
	cmp si,0
	jnz box32loop
	pop es
	pop ds
box32end:
	ret
boxd32:
	mov si,boxdx
	mov ax,[si]
	mov bx,640
	cmp ax,bx
	jb boxd32xxl
	dec bx
	mov [si],bx
boxd32xxl:
	mov bx,-1
	cmp ax,bx
	jg boxd32xxh
	inc bx
	mov [si],bx
boxd32xxh:
	mov si,boxdy
	mov ax,[si]
	mov bx,400
	cmp ax,bx
	jb boxd32yyl
	dec bx
	mov [si],bx
boxd32yyl:
	mov bx,-1
	cmp ax,bx
	jg boxd32yyh
	inc bx
	mov [si],bx
boxd32yyh:
	mov si,boxdx1
	mov ax,[si]
	mov bx,640
	cmp ax,bx
	jb boxd32xxxl
	dec bx
	mov [si],bx
boxd32xxxl:
	mov bx,-1
	cmp ax,bx
	jg boxd32xxxh
	inc bx
	mov [si],bx
boxd32xxxh:
	mov si,boxdy1
	mov ax,[si]
	mov bx,400
	cmp ax,bx
	jb boxd32yyyl
	dec bx
	mov [si],bx
boxd32yyyl:
	mov bx,-1
	cmp ax,bx
	jg boxd32yyyh
	inc bx
	mov [si],bx
boxd32yyyh:
	mov si,boxdx
	mov ax,[si]
	mov si,boxdx1
	mov bx,[si]
	cmp ax,bx
	ja boxd32end
	jz boxd32end
	mov si,boxdy
	mov ax,[si]
	mov si,boxdy1
	mov bx,[si]
	cmp ax,bx
	ja boxd32end
	jz boxd32end
	mov si,boxdy
	mov ax,[si]
	mov si,boxdy1
	mov bx,[si]
	sub bx,ax
	mov [si],bx
	cmp bx,0
	jz boxd32end
	mov si,boxdy
	xor eax,eax
	mov ax,[si]
	mov ebx,640
	mov ecx,0
	mov edx,0
	mul ebx
	mov ebx,140000h
	add eax,ebx
	mov si,boxdx
	xor ebx,ebx
	mov bx,[si]
	add eax,ebx
	mov edi,eax
	mov si,boxdx1
	xor eax,eax
	mov ax,[si]
	sub eax,ebx
	mov ecx,eax
	mov si,boxdcolor
	mov al,[si]
	mov edx,1
	mov si,boxdy1
	mov bx,[si]
	mov si,bx
	mov ebx,640
	push eax
	push ebx
	push edx
	mov eax,ecx
	mov ecx,0
	mov edx,0
	mov ebx,4
	div ebx
	mov ecx,eax
	pop edx
	pop ebx
	pop eax
	mov bp,0
	push ds
	push es
	mov ds,bp
	mov es,bp
boxd32loop:
	push edi
	push ecx
	call memfilld
	pop ecx
	pop edi
	add edi,ebx
	dec si
	cmp si,0
	jnz boxd32loop
	pop es
	pop ds
boxd32end:
	ret
byteEAX:
push ebx
mov ah,al
mov bx,ax
shl ebx,16
or eax,ebx
pop ebx
ret
memcopyd:
cmp ecx,0
jnz memcopyd2
ret
memcopyd2:
cld
memcopyd10 db 66h,67h
rep movsd
ret
memford:
cmp ecx,0
jnz memford2
ret
memford2:
std
memford10 db 66h,67h
rep movsb
cld
ret
memcopy:
cmp ecx,0
jnz memcopy2
ret
memcopy2:
cld
memcopy10 db 66h,67h
rep movsb
ret
memfilld:
	call byteEAX
	cmp ecx,0
	jz memfilld3
memfilld2:
cld
memfilld10 db 66h,67h
rep stosd
memfilld3:
ret
memfill:
	cmp ecx,0
	jz memfill3
memfill2:
cld
memfill10 db 66h,67h
rep stosb
memfill3:
ret
hlined32:
	mov si,hlinex
	mov ax,[si]
	mov bx,640
	cmp ax,bx
	jb hlined32xxl
	dec bx
	mov [si],bx
hlined32xxl:
	mov bx,-1
	cmp ax,bx
	jg hlined32xxh
	inc bx
	mov [si],bx
hlined32xxh:
	mov si,hliney
	mov ax,[si]
	mov bx,400
	cmp ax,bx
	jb hlined32yyl
	dec bx
	mov [si],bx
hlined32yyl:
	mov bx,-1
	cmp ax,bx
	jg hlined32yyh
	inc bx
	mov [si],bx
hlined32yyh:
	mov si,hlinex1
	mov ax,[si]
	mov bx,640
	cmp ax,bx
	jb hlined32xxxl
	dec bx
	mov [si],bx
hlined32xxxl:
	mov bx,-1
	cmp ax,bx
	jg hlined32xxxh
	inc bx
	mov [si],bx
hlined32xxxh:
	mov si,hlinex
	mov ax,[si]
	mov si,hlinex1
	mov bx,[si]
	cmp ax,bx
	ja hlined32end
	jz hlined32end
	mov si,hliney
	xor eax,eax
	mov ax,[si]
	mov ebx,640
	mov ecx,0
	mov edx,0
	mul ebx
	mov ebx,140000h
	add eax,ebx
	mov si,hlinex
	xor ebx,ebx
	mov bx,[si]
	add eax,ebx
	mov edi,eax
	mov si,hlinex1
	xor eax,eax
	mov ax,[si]
	sub eax,ebx
	mov ecx,eax
	mov si,hlinecolor
	mov al,[si]
	push eax
	push ebx
	push edx
	mov eax,ecx
	mov ecx,0
	mov edx,0
	mov ebx,4
	div ebx
	mov ecx,eax
	pop edx
	pop ebx
	pop eax
	push ds
	push es
	mov bp,0
	mov ds,bp
	mov es,bp
	call memfilld
	pop es
	pop ds
hlined32end:
	ret
nosound:
	mov dh,0fch
	in al,61h
	and al,dh
	out 61h,al
	ret
sound:
	mov ebx,eax
	mov eax,1193181
	mov ecx,0
	mov edx,0
	div ebx
	mov bx,ax
	mov dh,3
	in al,61h
	or al,dh
	out 61h,al
	mov al,0b6h
	out 43h,al
	mov al,bl
	out 42h,al
	mov al,bh
	out 42h,al
	ret
memlen:
mov edi,esi
mov al,[esi]
cmp al,0
jz memlen22
mov ecx,100000h
mov al,0
cld
memlen10 db 66h,67h
repne scasb
je memlen11
memlen22:
mov ecx,0
ret
memlen11:
mov ecx,edi
sub ecx,esi
dec ecx
ret
memlower:
cmp ecx,0
jz memlower22
mov edi,esi
memlower20:
memlower30 db 66h,67h
lodsb
cmp al,65
jb memlower90
cmp al,90
ja memlower90
or al,20h
memlower90:
memlower40 db 66h,67h
stosb
loop memlower20
cld
memlower10 db 66h,67h
rep movsb
memlower22:
ret
memhigth:
cmp ecx,0
jz memhigth22
mov edi,esi
memhigth20:
memhigth30 db 66h,67h
lodsb
cmp al,97
jb memhigth90
cmp al,122
ja memhigth90
and al,223
memhigth90:
memhigth40 db 66h,67h
stosb
loop memhigth20
cld
memhigth10 db 66h,67h
rep movsb
memhigth22:
ret
findchr:
cmp ecx,0
jz findchr22
mov edi,esi
findchr30 db 66h,67h
cld
findchr10 db 66h,67h
repne scasb
je findchr20
findchr22:
mov eax,-1
ret
findchr20:
mov eax,edi
sub eax,esi
dec eax
ret
comps:
cmp ecx,0
jz comps20
inc ecx
comps30 db 66h,67h
cld
comps10 db 66h,67h
repe cmpsb
jecxz comps20
mov ecx,2
dec esi
dec edi
mov ax,0
mov bx,0
mov al,[esi]
mov bl,[edi]
cmp ax,bx
ja comps21
mov ecx,1
comps21:
mov eax,ecx
ret
comps20:
mov eax,0
ret
findstr:
push esi
findstrs:
mov al,[edi]
mov bp,ax
push edi
push esi
call memlen
pop esi
cmp ecx,0
jz findstr223
mov ax,bp
call findchr
cmp eax,-1
jz findstr223
mov esi,edi
pop edi
push esi
push edi
mov esi,edi
call memlen
pop edi
pop esi
cmp ecx,0
jz findstr22
push esi
push edi
dec esi
call comps
pop edi
pop esi
cmp eax,0
jz findstr20
jmp findstrs
findstr222:
pop esi
findstr223:
pop esi
findstr22:
mov eax,-1
pop esi
ret
findstr20:
mov edi,esi
pop esi
mov eax,edi
sub eax,esi
dec eax
ret
WRITE16:           
          push bx                
          push dx                
          mov dx,si
          mov bx,di
          mov ah,40h
          int 21h                
          pop dx                 
          pop bx                
          RET                
READ16:                
          push bx                
          push dx                
          mov dx,si
          mov bx,di
          mov ah,3fh
          int 21h                
          pop dx                 
          pop bx                
          RET      
WRITE32:             
          push eax   
          push ebx   
          push ecx   
          push edx   
          push esi   
          push edi   
          push ebp   
          push ds    
          push es    
          mov bp,0   
          mov ds,bp
          mov es,bp
          WRITE321:
          cs
          mov [write32addrs1],esi
          cs
          mov [write32counter1],ecx
          cs
          mov [write32f1],di
          mov ax,0                
          cs
          mov [write32seg2],ax
          mov eax,ecx
          cmp eax,0
          JZ WRITE325
          xor edx,edx
          xor ecx,ecx
          mov ebx,0ffffh
          clc                
          div ebx                
          cs
          mov [write32counter3],eax
          cs
          mov [write32output],edx
          mov ax,cs
          mov bx,2000h
          clc                
          add ax,bx
          cs
          mov [write32seg1],ax
          mov si,0                
call MEM32
          cs
          mov [write32addrs2],eax
          mov eax,0
          cs
          mov [write32counter2],eax
          mov eax,0ffffh
          cs
          mov [write32size],eax
          cs
          mov eax,[write32counter3]
          cmp eax,0
          JZ WRITE323
          WRITE322:
          cs
                    mov ax,[write32seg2]
                    mov ds,ax
          cs
                    mov ecx,[write32size]
          cs
                    mov esi,[write32addrs1]
          cs
                    mov edi,[write32addrs2]
                    mov edx,1
          push eax
          push ebx
          push ecx
          push edx
          push esi
          push edi
          push ebp
          push ds
                    call memcopy
          pop ds
          pop ebp
          pop edi
          pop esi
          pop edx
          pop ecx
          pop ebx
          pop eax
          cs
                    mov ax,[write32seg1]
                    mov ds,ax
                    mov si,0                
          cs
                    mov di,[write32f1]
                    mov cx,0ffffh
                    call WRITE16
          cs
                    mov eax,[write32addrs1]
          cs
                    mov ebx,[write32size] 
                    clc                
                    add eax,ebx
          cs
                    mov [write32addrs1],eax
          cs
                    mov eax,[write32counter3]
                    dec eax                
          cs
                    mov [write32counter3],eax
                    cmp eax,0
                    JNZ WRITE322
          WRITE323:
          cs
          cmp DWORD [write32output],0
          JZ WRITE325
          cs
          mov ax,[write32seg2]
          mov ds,ax
          cs
          mov ecx,[write32output]
          cs
          mov esi,[write32addrs1]
          cs
          mov edi,[write32addrs2]
          mov edx,1
          push eax
          push ebx
          push ecx
          push edx
          push esi
          push edi
          push ebp
          push ds
          call memcopy
          pop ds
          pop ebp
          pop edi
          pop esi
          pop edx
          pop ecx
          pop ebx
          pop eax
          cs
          mov ax,[write32seg1]
          mov ds,ax
          mov si,0                
          cs
          mov di,[write32f1]
          cs
          mov cx,[write32output]
          call WRITE16
          WRITE324:
WRITE325:
                    pop es                
                    pop ds                
                    pop ebp                
                    pop edi                
                    pop esi                
                    pop edx                
                    pop ecx                 
                    pop ebx                
                    pop eax                
                    RET                
READ32:                
          push eax                
          push ebx                
          push ecx                
          push edx                
          push esi                
          push edi                
          push ebp                
          push ds                
          push es                
          mov bp,0                
          mov ds,bp
          mov es,bp
          READ321:                
          cs
          mov [read32addrs1],esi
          cs
          mov [read32counter1],ecx
          cs
          mov [read32f1],di
          cs
          mov DWORD [read32seg2],0
          mov eax,ecx
          cmp eax,0
          JZ READ325
          xor edx,edx
          xor ecx,ecx
          mov ebx,0ffffh
          clc                
          div ebx                
          cs
          mov [read32counter3],eax
          cs
          mov [read32output],edx
          mov ax,cs
          mov bx,2000h
          clc                
          add ax,bx
          cs
          mov [read32seg1],ax
          mov si,0                
          call MEM32
          cs
          mov [read32addrs2],eax
          mov eax,0
          cs
          mov [read32counter2],eax
          mov eax,0ffffh
          cs
          mov [read32size],eax
          cs
          mov eax,[read32counter3]
          cmp eax,0
          JZ READ323
          READ322:                
          cs
	          mov ax,[read32seg1]
                    mov ds,ax
                    mov si,0             
          cs
                    mov di,[read32f1]
                    mov cx,0ffffh
                    call READ16
          cs
                    mov ax,[read32seg2]
                    mov ds,ax
          cs
                    mov ecx,[read32size]
          cs
                    mov esi,[read32addrs2]
          cs
                    mov edi,[read32addrs1]
                    mov edx,1
          push eax
          push ebx
          push ecx
          push edx
          push esi
          push edi
          push ebp
          push ds
          call memcopy
          pop ds
          pop ebp
          pop edi
          pop esi
          pop edx
          pop ecx
          pop ebx
          pop eax
          cs
                    mov eax,[read32addrs1]
          cs
                    mov ebx,[read32size] 
                    clc                
                    add eax,ebx
          cs
                    mov [read32addrs1],eax
          cs
                    mov eax,[read32counter3]
                    dec eax                
          cs
                    mov [read32counter3],eax
                    cmp eax,0
                    JNZ READ322
          READ323:                
          cs
          cmp DWORD [read32output],0
          JZ READ325
          cs
          mov ax,[read32seg1]
          mov ds,ax
          mov si,0                
          cs
          mov di,[read32f1]
          cs
          mov ecx,[read32output]
          call READ16
          cs
          mov ax,[read32seg2]
          mov ds,ax
          cs
          mov cx,[read32output]
          cs
          mov esi,[read32addrs2]
          cs
          mov edi,[read32addrs1]
          mov edx,1
          push eax
          push ebx
          push ecx
          push edx
          push esi
          push edi
          push ebp
          push ds
          call memcopy
          pop ds
          pop ebp
          pop edi
          pop esi
          pop edx
          pop ecx
          pop ebx
          pop eax
          READ324:               
                    READ325:     
                    pop es       
                    pop ds       
                    pop ebp      
                    pop edi      
                    pop esi      
                    pop edx      
                    pop ecx      
                    pop ebx      
                    pop eax      
                    RET         
chain:
	mov bx,0x100
	mov dx,bx
	mov cx,65050
	mov bx,65298
	mov ax,[bx]
	mov bx,ax
	mov ah,0x3f
	int 0x21
	mov bx,65298
	mov ax,[bx]
	mov bx,ax
	mov al,2
	mov ah,0x3e
	int 0x21
	ret
cicle:
	cmp eax,0
	jz cicle2
	mov ecx,eax
	cicle1:
		dec ecx
		cmp ecx,0
		jnz cicle1
cicle2:
ret
bitmapattr:
	mov eax,[esi]
	mov ecx,4
	add esi,ecx
	mov ebx,[esi]
	add esi,ecx
	ret

section .data
          read32addrs1 dd 0
          read32addrs2 dd 0
          read32counter1 dd 0
          read32counter2 dd 0
          read32counter3 dd 0
          read32output     dd 0
          read32f1             dw 0
          read32seg1        dw 0
          read32seg2        dw 0
          read32size         dd 0
          write32addrs1 dd 0
          write32addrs2 dd 0
          write32counter1 dd 0
          write32counter2 dd 0
          write32counter3 dd 0
          write32output     dd 0
          write32f1             dw 0
          write32seg1        dw 0
          write32seg2        dw 0
          write32size         dd 0
hlinex     dw 0
hliney     dw 0
hlinex1     dw 0
hliney1     dw 0
hlinecolor     db 0
hlinedx     dw 0
hlinedy     dw 0
hlinedx1     dw 0
hlinedy1     dw 0
hlinedcolor     db 0
vlinex     dw 0
vliney     dw 0
vlinex1     dw 0
vliney1     dw 0
vlinecolor     db 0
boxdx     dw 0
boxdy     dw 0
boxdx1     dw 0
boxdy1     dw 0
boxdcolor     db 0
boxx     dw 0
boxy     dw 0
boxx1     dw 0
boxy1     dw 0
boxcolor     db 0
x     db 0
y     db 0
color dw 07h
L4 db 0,0,0,0,0
L18 dw 0,0
L20 dw 0,0,0,0,0,0,0,0
L21 dw 0,0,0,0
L6 db 'press a key to go on, esc key to exit scroll',13,10,0
L16 db '..........................................',13,10,0
L17 db '0000000000 ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
L22 db '00000000000 ',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
L50 times 260 db 32
L51 db 0
rreservemem dd 0
rreservemem2 dd 0
;start tail

L9000 dd  256
L9001 dd 0
L9002 dd  1
L9003 dd  2
L9004 dd  3
L9005 dd  4
L9006 dd  15
L9007 dd  14
L9008 dd  10
L9009 dd  399
L9010 dd 0
L9011 dd  10
L9012 dd  250
L9013 dd  10
L9014 dd  150

endf db 0 
