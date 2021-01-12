.data
    Lado1:    .asciiz "Lado 1:\n"
    Lado2:    .asciiz "Lado 2:\n"
    Lado3:    .asciiz "Lado 3:\n"
    Lado4:    .asciiz "Lado 4:\n"
    Soma:    .asciiz "=> "

.text
    # Lendo lado 1
    li $v0, 4 		# Preparando o processador para receber uma string.
    la $a0, Lado1 	# Lendo o endereço de memória da variável Lado1 e armazenando em $a0.
    syscall 		# Executando a instrucao.
    li $v0, 5 		# Preparando o processador para receber um número inteiro.
    syscall		# Executar instrucao.
    move $t1, $v0	# Copiando os dados do registrador $v0 para $t1, é necessário isso para que o valor em $v0 não se perca.
    
    # Lendo lado 2
    li $v0, 4		# Preparando o processador para receber uma string.
    la $a0, Lado2
    syscall
    li $v0, 5
    syscall
    move $t2, $v0	# Copiando os dados do registrado de origem para o de destino.
    
    # Lendo lado 3
    li $v0, 4
    la $a0 Lado3
    syscall
    li $v0, 5
    syscall
    move $t3, $v0	# Copiando os dados do registrador de origem para o de destino.
    
    #Lendo lado 4
    li $v0, 4
    la $a0, Lado4
    syscall
    li $v0, 5
    syscall
    move $t4, $v0 	# Copiando os dados do registrador $v0 para o registrador de destino $t4.
    
    # $t1, $t2, $t3, e $t4
    add $t5,$t1,$t2 	# Fazendo a soma dos lados, $t5 = $t1 + $t2
    add $t6,$t3,$t4	# $t6 = $t3 + $t4
    add $t0,$t5,$t6	# $t0 = $t5 + $t6
    
    # Resultado na tela
    li $v0, 4 		# Preparando o processador para receber a string.
    la $a0, Soma	# Ler endereço de memória da variável Soma e colocar no registrador $a0.
    syscall		# Executar instrucao.
    li $v0, 1		# Preparando o processador pra receber um número inteiro.
    la $a0, ($t0)	# $a0 = ($t0), ($t0) é o número que você digitou.
    syscall		# Executando instrucao.
    li $v0, 10		# Preparando o processador para finalizar o programa.
    syscall		# Executando a instrucao.
    li $v0, 10		# Preparando o processador para finalizar o programa. 
    syscall		# Executando instrucao.
