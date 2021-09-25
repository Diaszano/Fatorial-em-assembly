.data
	mensagem: 	 .asciiz "Digite o valor de N = "
	#mensagemTamanho: .word 22
	resposta: 	 .asciiz "O valor eh = "
	#respostaTamanho: .word 13
	
.text
	.main:
		
		la $a0, mensagem
		jal printfString
		jal scanfInt
		move $t0,$v0
		move $a0,$t0
		
		la $a0, resposta
		jal printfString
		move $a0,$t0
		li,$v0,1
		jal fatorial
		move $t1,$v0
		move $a0,$t1
		jal printfInt
		jal fechar
	
	fatorial:
		addiu $sp,$sp,-4
		sw $ra,($sp)
		beq $a0,0,zero
			j nnzero
			zero:
				add $v0,$a0,1
				j um
		nnzero:
		beq $a0,1,um
			j nnum
			um:
				jr $ra
		nnum:
		multu $v0,$a0
		sub $a0,$a0,1
		mflo $v0
		jal fatorial
		lw $ra,($sp)
		addiu $sp,$sp,4
		jr $ra
	
	
	printfString:	# Imprime uma string
		li $v0,4
		syscall
		jr $ra
	
	printfInt:	# Imprime um inteiro
		li $v0,1
		syscall
		jr $ra
	
	scanfInt:	# Le um inteiro
		li $v0,5
		syscall
		jr $ra
	
	fechar:
		li $v0,10
		syscall
	
	
		
			
	