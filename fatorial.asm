.data
	mensagem: 	 .asciiz "Digite o valor de N = "
	resposta: 	 .asciiz "O valor eh = "
	
.text
	.main:
		la $a0, mensagem 		# Carrega string mensagem
		jal printfString		# print(mensagem)
		jal scanfInt			# Le a variavel n
		move $t0,$v0			# Copia n para t0 
		move $a0,$t0			# Copia t0 para a0	
		li,$v0,1			# Seta 1 na var v0
		jal fatorial			# Chama a funcao fatorial(n) 
		move $t1,$v0			# Copia v0 para t1
		la $a0, resposta		# Carrega string resposta
		jal printfString		# print(resposta)
		move $a0,$t1			# Copia o t1 para a0
		jal printfInt			# print(t1)
		jal fechar			# Fecha o programa
	
	fatorial:
		addiu $sp,$sp,-4		# Empilhando o retorno
		sw $ra,($sp)			# Empilhando o retorno
		beq $a0,0,zero			# if(n == 0)
			j nnzero
			zero:
				add $v0,$a0,1	# Como eh 0 mudamos para 1
				j um
		nnzero:
		beq $a0,1,um			# if(n == 1)
			j nnum
			um:
				jr $ra		# retorno
		nnum:
		multu $v0,$a0 			# m * n
		mflo $v0			# Carregando o valor da multiplicacao pro v0
		sub $a0,$a0,1			# n - 1
		jal fatorial			# fatorial(n)
		lw $ra,($sp)			# Desempilhando o retorno
		addiu $sp,$sp,4			# Desempilhando o retorno
		jr $ra				# retorno
	
	printfString:	# Imprime uma string
		li $v0,4			# Carrega o valor 4 para v0
		syscall				# Faz a chamada de sistema correspondente
		jr $ra
	
	printfInt:	# Imprime um inteiro
		li $v0,1			# Carrega o valor 4 para v0
		syscall				# Faz a chamada de sistema correspondente
		jr $ra
	
	scanfInt:	# Le um inteiro
		li $v0,5			# Carrega o valor 4 para v0
		syscall				# Faz a chamada de sistema correspondente
		jr $ra
	
	fechar:		# Fecha o programa
		li $v0,10			# Carrega o valor 4 para v0
		syscall				# Faz a chamada de sistema correspondente
