.data
	#Valores de auxilio
	zeroFloat: .float 0.0
	
	#Mensagens do menu
	str_welcome: .asciiz "Simulacao de Calculadora\n\n"
	str_menu: .asciiz "\nMenu:\n1-Soma\n2-Subtracao\n3-Multiplicacao\n4-Divisao\n5-Potencia\n6-Raiz Quadrada\n7-Tabuada de 1 numero\n8-Calculo do IMC\n9-Fatorial\n10-Calculo da Sequencia Fibonacci\n11-Encerrar o programa\n"
	str_dig: .asciiz "\nDigite o numero de uma das opcoes acima:\n"
	str_invalid: .asciiz "\nDigite um numero valido!\n\n"
	
	#Mensagens da Soma
	str_soma_dig0: .asciiz "Digite um numero\n"
	str_soma_dig1: .asciiz "Digite outro numero\n"
	str_soma_result: .asciiz "O resultado sera:\n"
	str_soma_sum_symbol: .asciiz " + "
	str_soma_equal_symbol: .asciiz " = "
	str_soma_bl: .asciiz "\n"
	
	#Mensagens da Subtracao
	str_subtracao_dig0: .asciiz "Digite um numero\n"
	str_subtracao_dig1: .asciiz "Digite outro numero\n"
	str_subtracao_result: .asciiz "O resultado sera:\n"
	str_subtracao_sub_symbol: .asciiz " - "
	str_subtracao_equal_symbol: .asciiz " = "
	str_subtracao_bl: .asciiz "\n"
	
	#Mensagens de Multiplicacao
	str_multiplicacao_dig0: .asciiz "Digite um numero\n"
	str_multiplicacao_dig1: .asciiz "Digite outro numero\n"
	str_multiplicacao_result: .asciiz "O resultado sera:\n"
	str_multiplicacao_mult_symbol: .asciiz " X "
	str_multiplicacao_equal_symbol: .asciiz " = "
	str_multiplicacao_bl: .asciiz "\n"
	
	#Mensagens da Divisao
	str_divisao_dig0: .asciiz "Digite um numero\n"
	str_divisao_dig1: .asciiz "Digite outro numero\n"
	str_divisao_result: .asciiz "O resultado sera:\n"
	str_divisao_div_symbol: .asciiz " / "
	str_divisao_equal_symbol: .asciiz " = "
	str_divisao_bl: .asciiz "\n"
	
	#Mensagens da Potencia
	str_potencia_base: .asciiz "Digite a base:\n"
	str_potencia_expoente: .asciiz "Digite o expoente:\n"
	str_potencia_result: .asciiz "O resultado sera:\n"
	str_potencia_pow_symbol: .asciiz "^"
	str_potencia_equal_symbol: .asciiz " = "
	str_potencia_bl: .asciiz "\n"
	
	#Mensagens da Raiz Quadrada
	str_raiz_radicando: .asciiz "Digite o radicando:\n"
	str_raiz_result: .asciiz "O resultado sera:\n"
	str_raiz_sqrt_symbol_i: .asciiz "sqrt("
	str_raiz_sqrt_symbol_f: .asciiz ")"
	str_raiz_equal_symbol: .asciiz " = "
	str_raiz_bl: .asciiz "\n"
	
	#Mensagens da Tabuada
	str_tabuada_numero: .asciiz "Digite um numero:\n"
	str_tabuada_title: .asciiz "TABUADA: "
	str_tabuada_mult_symbol: .asciiz " X "
	str_tabuada_equal_symbol: .asciiz " = "
	str_tabuada_bl: .asciiz "\n"
	
	#Mensagens do Fatorial
	str_fatorial_dig: .asciiz "Digite um numero para calcular o seu fatorial:\n"
	str_fatorial_fat: .asciiz "\nO fatorial de "
	str_fatorial_eh: .asciiz " eh "
	str_fatorial_bl: .asciiz "\n"
	
	#Mensagens do IMC
	str_imc_dig_m: .asciiz "Digite o valor da massa(em kg):\n"
	str_imc_dig_a: .asciiz "Digite o valor da altura(em m):\n"
	str_imc_imc: .asciiz "O imc de massa "
	str_imc_e_al: .asciiz " kg e altura "
	str_imc_eh: .asciiz " m eh "
	str_imc_bl: .asciiz "\n"
	
	#Mensagens do Fibonacci
	str_fibonacci_inicio:	.asciiz "Digite o valor do inicio do intervalo:\n"
	str_fibonacci_fim:	.asciiz "Digite o valor do fim do intervalo:\n"
	str_fibonacci_resp:	.asciiz "O intervalo de "
	str_fibonacci_a:	.asciiz " a "
	str_fibonacci_eh:	.asciiz " eh :\n"
	str_fibonacci_coma:	.asciiz ", "
	str_fibonacci_bl: .asciiz "\n"
	
.text
	.globl main
		main:
			li $v0, 4
			la $a0, str_welcome	#Mensagem inicial
			syscall
		
		#MENU DE OPCOES
		menu:
			li $v0, 4
			la $a0, str_menu	#Mensagem com as opcoes
			syscall
			
			li $v0, 4
			la $a0, str_dig		#Mensagem pedindo para digitar um numero
			syscall
			
			li $v0, 5		#Le um numero inteiro
			syscall
			
			#"switch()"
			beq $v0, 1, soma
			beq $v0, 2, subtracao
			beq $v0, 3, multiplicacao
			beq $v0, 4, divisao
			beq $v0, 5, potencia
			beq $v0, 6, raiz_quadrada
			beq $v0, 7, tabuada
			beq $v0, 8, imc
			beq $v0, 9, fatorial
			beq $v0, 10, fibonacci
			beq $v0, 11, exit
			
			j invalid_number	#Numero invalido
			
			j menu		#Volta para o inicio do menu
			
		#SOMA
		soma:
			li $v0, 4		#Imprime a mensagem para digitar o primeiro valor
			la $a0, str_soma_dig0	
			syscall
			li $v0, 5		#Le o primeiro valor
			syscall
			blt $v0,$zero,invalid_number #caso invalido
			move $t0, $v0		#n1 = $v0
			li $v0, 4		#Imprime a mensagem para digitar o segundo valor
			la $a0, str_soma_dig0	
			syscall
			li $v0, 5		#Le o segundo valor
			syscall
			blt $v0,$zero,invalid_number #caso invalido
			move $t1, $v0		#n2 = $v0
			add $t2, $t0, $t1	#$t2 = n1 + n2
			#Imprime o texto : "O resultado sera: n1 + n2 = result"
			li $v0, 4
			la $a0, str_soma_result		
			syscall
			li $v0, 1
			la $a0, ($t0)
			syscall
			li $v0, 4
			la $a0, str_soma_sum_symbol	
			syscall
			li $v0, 1
			la $a0, ($t1)
			syscall
			li $v0, 4
			la $a0, str_soma_equal_symbol	
			syscall
			li $v0, 1
			la $a0, ($t2)
			syscall
			li $v0, 4
			la $a0, str_soma_bl	
			syscall
			j menu		#Volta para o menu
			
		
		#SUBTRACAO
		subtracao:
			li $v0, 4		#Imprime a mensagem para digitar o primeiro valor
			la $a0, str_subtracao_dig0	
			syscall
			li $v0, 5		#Le o primeiro valor
			syscall
			blt $v0,$zero,invalid_number #caso invalido
			move $t0, $v0		#n1 = $v0
			li $v0, 4		#Imprime a mensagem para digitar o segundo valor
			la $a0, str_subtracao_dig0	
			syscall
			li $v0, 5		#Le o segundo valor
			blt $v0,$zero,invalid_number #caso invalido
			syscall
			move $t1, $v0		#n2 = $v0
			sub $t2, $t0, $t1	#$t2 = n1 - n2
			#Imprime o texto : "O resultado sera: n1 - n2 = result"
			li $v0, 4
			la $a0, str_subtracao_result		
			syscall
			li $v0, 1
			la $a0, ($t0)
			syscall
			li $v0, 4
			la $a0, str_subtracao_sub_symbol	
			syscall
			li $v0, 1
			la $a0, ($t1)
			syscall
			li $v0, 4
			la $a0, str_subtracao_equal_symbol	
			syscall
			li $v0, 1
			la $a0, ($t2)
			syscall
			li $v0, 4
			la $a0, str_subtracao_bl	
			syscall
			j menu		#Volta para o menu
			
		#MULTIPLICACAO
		multiplicacao:
			li $v0, 4		#Imprime a mensagem para digitar o primeiro valor
			la $a0, str_multiplicacao_dig0	
			syscall
			li $v0, 5		#Le o primeiro valor
			syscall
			blt $v0,$zero,invalid_number #caso invalido
			add $t0, $zero, $v0	#$t0 = $v0 = n1
			li $v0, 4		#Imprime a mensagem para digitar o segundo valor
			la $a0, str_multiplicacao_dig1	
			syscall
			li $v0, 5		#Le o segundo valor
			syscall
			blt $v0,$zero,invalid_number #caso invalido
			add $t1, $zero, $v0	#$t1 = $v0 = n2
			mul $t2, $t0, $t1	#$t2 = n1 * n2
			#Imprime o texto : "O resultado sera: n1 X n2 = result"
			li $v0, 4
			la $a0, str_multiplicacao_result		
			syscall
			li $v0, 1
			la $a0, ($t0)	#Imprime o primeiro valor
			syscall
			li $v0, 4
			la $a0, str_multiplicacao_mult_symbol	
			syscall
			li $v0, 1
			la $a0, ($t1)	#Imprime o segundo valor
			syscall
			li $v0, 4
			la $a0, str_multiplicacao_equal_symbol	
			syscall
			li $v0, 1
			la $a0, ($t2)	#Imprime o resultado
			syscall
			li $v0, 4
			la $a0, str_multiplicacao_bl	
			syscall
			j menu		#Volta para o menu
		
		#DIVISAO
		divisao:
			lwc1 $f1, zeroFloat	#$f1 = 0(float)
			li $v0, 4		#Imprime a mensagem para digitar o primeiro valor
			la $a0, str_divisao_dig0	
			syscall
			li $v0, 6		#Le o primeiro valor
			syscall
			#caso invalido
			c.lt.s $f0, $f1
			bc1t invalid_number
			add.s $f2, $f1, $f0	#$f2 = 0.0 + n1 => $f2 = n1
			li $v0, 4		#Imprime a mensagem para digitar o segundo valor
			la $a0, str_divisao_dig0	
			syscall
			li $v0, 6		#Le o primeiro valor
			syscall
			#caso invalido
			c.le.s $f0, $f1
			bc1t invalid_number
			add.s $f3, $f1, $f0	#$f3 = 0.0 + n2 => $f3 = n2
			div.s $f4, $f2, $f3	#$f12 = n1 / n2
			#Imprime o texto : "O resultado sera: n1 / n2 = result"
			li $v0, 4
			la $a0, str_divisao_result		
			syscall
			li $v0, 2
			add.s $f12, $f1, $f2	#Imprime o primeiro valor
			syscall
			li $v0, 4
			la $a0, str_divisao_div_symbol	
			syscall
			li $v0, 2
			add.s $f12, $f1, $f3	#Imprime o segundo valor
			syscall
			li $v0, 4
			la $a0, str_divisao_equal_symbol	
			syscall
			li $v0, 2
			add.s $f12, $f1, $f4	#Imprime o resultado
			syscall
			li $v0, 4
			la $a0, str_divisao_bl	
			syscall
			j menu		#Volta para o menu
		
		#POTENCIA
		potencia:
			li $v0, 4			#Imprime uma mensagem para digitar a base
			la $a0, str_potencia_base
			syscall
			li $v0, 5			#Le o valor da base
			syscall
			blt $v0,$zero,invalid_number	 #caso invalido
			add $t0, $v0, $zero		#$t0 = base
			li $v0, 4			#Imprime uma mensagem para digitar a potencia
			la $a0, str_potencia_expoente
			syscall
			li $v0, 5			#Le o valor do expoente
			syscall
			blt $v0,$zero,invalid_number #caso invalido
			add $t1, $v0, $zero		#$t1 = expoente
			li $t3, 1			#$t3 = 1(resultado final)
			li $t2, 1			#i = 1
			
			#Loop
			loop_potencia:
				bgt $t2, $t1, fim_potencia	#while(i>=0)
				mul $t3, $t3, $t0		#resultado = resultado * base
				addi $t2, $t2, 1		#i++
				j loop_potencia			#Volta
			#Imprime o resultado -> base^expoente = resultado
			fim_potencia:				
				li $v0, 4
				la $a0, str_potencia_result
				syscall
				li $v0, 1
				la $a0, ($t0)
				syscall
				li $v0, 4
				la $a0, str_potencia_pow_symbol
				syscall
				li $v0, 1
				la $a0, ($t1)
				syscall
				li $v0, 4
				la $a0, str_potencia_equal_symbol
				syscall
				li $v0, 1
				la $a0, ($t3)
				syscall
				li $v0, 4
				la $a0, str_potencia_bl
				syscall
				j menu
				
		#RAIZ QUADRADA
		raiz_quadrada:
			lwc1 $f1, zeroFloat			#$f1 = 0(float)
			li $v0, 4				#Imprime a mensagem para digitar o radicando
			la $a0, str_raiz_radicando
			syscall
			li $v0, 6				#Le um numero
			syscall
			#caso invalido
			c.lt.s $f0, $f1
			bc1t invalid_number
			add.s $f2, $f1, $f0			#$f2 = n
			sqrt.s $f2, $f2				#$f2 = sqrt(n)
			#Imprime "O resultado sera: srqt(n) = resultado"
			li $v0, 4
			la $a0, str_raiz_result
			syscall
			li $v0, 4
			la $a0, str_raiz_sqrt_symbol_i
			syscall
			add.s $f12, $f1, $f0			#$f12 = n(radicando)
			li $v0, 2
			syscall
			li $v0, 4
			la $a0, str_raiz_sqrt_symbol_f
			syscall
			li $v0, 4
			la $a0, str_raiz_equal_symbol
			syscall
			add.s $f12, $f1, $f2			#$f12 = sqrt(n)
			li $v0, 2
			syscall
			li $v0, 4
			la $a0, str_raiz_bl
			syscall
			j menu
		
		#TABUADA
		tabuada:
			li $v0, 4			#Mensagem com o numero da Tabuada
			la $a0, str_tabuada_numero
			syscall
			li $v0, 5			#Le um numero
			syscall
			blt $v0,$zero,invalid_number	#valor invalido
			add $t0, $v0, $zero		#$t0 = n
			li $v0, 4			#Imprime a mensagem de titulo indicando a tabuado do n
			la $a0, str_tabuada_title
			syscall
			li $v0, 1			#Imprime n
			la $a0, ($t0)
			syscall
			li $v0, 4			#Imprime uma quebra linha
			la $a0, str_tabuada_bl
			syscall
			li $t1, 1			#i = 0
			li $t2, 10 			#Condicao de parada
			
			loop_tabuada:
				bgt $t1, $t2, fim_tabuada	#while(i <= 10)
				mul $t3, $t0, $t1		#$t3 = n * i
				li $v0, 1			#Imprime n
				la $a0, ($t0)
				syscall
				li $v0, 4			#Imprime X
				la $a0, str_tabuada_mult_symbol
				syscall
				li $v0, 1			#Imprime i
				la $a0, ($t1)
				syscall
				li $v0, 4			#Imprime =
				la $a0, str_tabuada_equal_symbol
				syscall
				li $v0, 1			#Imprime resultado(=n*i)
				la $a0, ($t3)
				syscall
				li $v0, 4			#Imprime uma quebra linha
				la $a0, str_tabuada_bl
				syscall
				addi $t1, $t1, 1		#i++
				j loop_tabuada
					
				fim_tabuada:
					j menu			#Volta para o menu
		
		#IMC
		imc:
			lwc1 $f6, zeroFloat			#$f6 = 0(float)
		
			li $v0,4 #imprime a string pedindo a massa
			la $a0, str_imc_dig_m
			syscall 
			li $v0, 6 #le o primeiro numero float
			syscall
			add.s $f1,$f0,$f6 # f1 = f6
			
			#caso invalido
			c.le.s $f1, $f6
			bc1t invalid_number
			
			li $v0,4 #imprime a string pedindo a altura
			la $a0, str_imc_dig_a
			syscall
			li $v0, 6 #le o segundo float
			syscall
			add.s $f2,$f0,$f6 # f2 = f0 + 0; f2 = f0
			#caso invalido
			c.le.s $f2, $f6
			bc1t invalid_number
			
			#inicio do calculo
			add.s $f0,$f1,$f6 #f0 = f1 + 0; f0 = f1
			div.s $f0,$f0,$f2   #f0 = f0 / f2
			div.s $f0,$f0,$f2   #f0 = f0 / f2	
			
			#fim da funcao
			li $v0,4 #imprime a string 
			la $a0, str_imc_imc
			syscall
			
			li    $v0, 2
			add.s $f12, $f1, $f6
			syscall
			
			li $v0,4 #imprime a string 
			la $a0, str_imc_e_al
			syscall
			
			li    $v0, 2
			add.s $f12, $f2, $f6
			syscall
			
			li $v0,4 #imprime a string 
			la $a0, str_imc_eh
			syscall
			
			li    $v0, 2
			add.s $f12, $f0, $f6
			syscall
			
			li $v0,4 #imprime a string 
			la $a0, str_imc_bl
			syscall
			
			j menu
		
		#FATORIAL
		fatorial:
			li $v0, 4
			la $a0, str_fatorial_dig	#Mensagem pedindo para digitar um numero
			syscall
			li $v0, 5	#Le um numero inteiro(fatorial(n))
			syscall
			blt $v0,$zero,invalid_number #caso invalido
			move $a0, $v0	#$a0 = n
			add $a1, $zero, $a0	#Copia n para $a1
			li $v1, 1
			beq $a0, $zero, fatorial_print 	#Se n == 0, $v1 = 1(resultado do fatorial(0))
			jal fatorial_recursivo	#Inicia a recursao
			add $v1, $zero, $v0		#Move o resultado do fatorial para $v1
			
			#Imprime o resultado do fatorial
			fatorial_print:
			li $v0, 4
			la $a0, str_fatorial_fat
			syscall
			li $v0, 1
			la $a0, ($a1)
			syscall
			li $v0, 4
			la $a0, str_fatorial_eh
			syscall
			li $v0, 1
			la $a0, ($v1)
			syscall
			li $v0, 4
			la $a0, str_fatorial_bl
			syscall
			
			#Volta para o menu
			j menu
			
			#Recursao de fatorial -> Retorna o valor do fatorial em $v0
			fatorial_recursivo:
				beq $a0, $zero, fatorial_parada		#Compara se n == 0, Se for pula para fatorial_parada
				addi $sp, $sp, -8			#Reserva 8 posicoes da stack
				sw $a0, 0($sp)				#Guarda o valor de n na stack
				sw $ra, 4($sp)				#Guarda o valor de $ra(retorno) na stack
				addi $a0, $a0, -1			#n--
				jal fatorial_recursivo			#Volta para fatorial_recursivo(recursao)
				addi $t0, $t0, 1			#i++
				mul $v0, $v0, $t0			#n = n * i
				j fatorial_return			#Pula para fatorial_return
		
			#Condicao de parada da recursao => n == 0 -> n = 1
			fatorial_parada:	
				li $v0, 1	#$v0 = n = 1
			
			#Carrega os valores da stack
			fatorial_return:
				lw $t0, 0($sp)		#Carrega o conteudo da posicao 0 da stack -> i
				lw $ra, 4($sp)		#Carrega o conteudo da posicao 4 da stack em $ra(posicao de retorno)
				addi $sp, $sp, 8	#Desalocao os 8 primeiros espacos da stack
				jr $ra			#Volta para a posicao de retorno
				
		#FIBONACCI
		fibonacci:
			li $v0, 4			#Imprime uma mensagem pedindo para digitar o valor de inicio(a) do intervalo
			la $a0, str_fibonacci_inicio
			syscall
			li $v0, 5			#Le o valor de inicio do intervalo(a)
			syscall
			ble $v0, $zero, invalid_number	#Se a<=0 -> NUMERO INVALIDO
			add $s0, $zero, $v0		#$s0 = a
			li $v0, 4			#Imprime uma mensagem pedindo para digitar o valor de fim(b) do intervalo
			la $a0, str_fibonacci_fim
			syscall
			li $v0, 5			#Le o valor de fim do intervalo(b)
			syscall
			ble $v0, $zero, invalid_number	#Se a<=0 -> NUMERO INVALIDO
			blt $v0, $s0, invalid_number	#Se b<a -> NUMERO INVALIDO
			add $s1, $zero, $v0		#$s1 = b
			
			li $v0, 4			#Imprime uma mensagem("O intervalo de ")
			la $a0, str_fibonacci_resp
			syscall
			li $v0, 1			#Imprime o numero de inicio do intervalo(a)
			la $a0, ($s0)
			syscall
			li $v0, 4			#Imprime uma mensagem(" a ")
			la $a0, str_fibonacci_a	
			syscall
			li $v0, 1			#Imprime o numero de fim do intervalo(b)
			la $a0, ($s1)
			syscall
			li $v0, 4			#Imprime uma mensagem(" eh:\n")
			la $a0, str_fibonacci_eh
			syscall
			
			li $t3, 2			#$t3 = 2 -> Caso de Parada da funcao recursiva
			add $t4, $s0, $zero		#i = a(inicio do intervalo)
			
			fibonacci_print:
				add $t0, $t4, $zero
				jal fibonacci_function	#Chamada da funcao recursiva do fibonacci para calcular o valor da posicao $t0 = i = $t4
				li $v0, 1		#Imprime o valor da posicao i da sequencia fibonacci
				la $a0, ($s2)
				syscall
				li $v0, 4		#Imprime uma mensagem(" , ")
				la $a0, str_fibonacci_coma
				syscall
				addi $t4, $t4, 1	#i++
				ble $t4, $s1, fibonacci_print	#i<=b(fim do intervalo) -> true = continua o loop, false = segue para o fim da funcao
				li $v0, 4
				la $a0, str_fibonacci_bl	#Imprime uma mensagem("\n")
				syscall
				j menu		#Volta para o menu
			
			#Funcao recursiva
			fibonacci_function:
				bgt $t0, $t3, fibonacci_recursive	#Caso de Parada -> n<=2
				
				#Return 1
				fibonacci_return:			
					addi $s2, $zero, 1		
					jr $ra
				
				#Return fibonacci(n-1)+fibonacci(n-2)
				fibonacci_recursive:
					addi $sp, $sp, -12
					sw $ra, 8($sp)
					sw $t0, 0($sp)
					addi $t0, $t0, -1		#fibonacci(n-1)
					jal fibonacci_function
					add $t1, $s2, $zero		#$t1 = fibonacci(n-1)
					sw $t1, 4($sp)
					lw $t0, 0($sp)
					addi $t0, $t0, -2		#fibonacci(n-2)
					jal fibonacci_function
					lw $t1, 4($sp)
					add $s2, $t1, $s2		#$s2 = fibonacci(n-1)+fibonacci(n-2)
					lw $ra, 8($sp)
					addi $sp, $sp, 12
					jr $ra				#return $s2 = return fibonacci(n-1)+fibonacci(n-2)
			
							
		#MENSAGEM DE NUMERO INVALIDO
		invalid_number:
			li $v0, 4
			la $a0, str_invalid
			syscall
			j menu
			
		#SAIR
		exit:
			li $v0, 10
			syscall
