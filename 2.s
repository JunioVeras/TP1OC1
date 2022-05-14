teste:                    # esse inicio so foi utilizado para realizacao dos testes
addi x10, x10, 18         # inicializa x10 com o valor de n (valor do fibonacci que se deseja calcular)
jal x1, fibonacci         # chama a funcao fibonacci
jal x0, teste_fim         # vai para o fim do teste

fibonacci:                # funcao fiboncacci (para n < 2 o programa retorna o proprio n)
addi x5, x10, 0           # coloca o valor n em x5

fib:
addi x29, x0, 2           # coloca o valor 2 em x29
bge x5, x29, rec          # se x5 eh maior ou igual a 2 vai para rec
addi x10, x5, 0           # x10 recebe x5
jalr x0, 0(x1)            # retorna para a linha do endereco x1

# PRIMEIRA PARTE (calculo de fibonacci de n-1 recursivo)
rec:
addi sp, sp, -12          # aloca 3 elementos de 4 bytes na pilha do endereco sp
sw x1, 0(sp)              # o primeiro elemento armazena o endereco de x1
sw x5, 4(sp)              # o segundo elemento armazena o valor atual de x5
addi x5, x5, -1           # subtrai 1 de x5
jal x1, fib               # armazena pc + 4 em x1 e vai para fib

# SEGUNDA PARTE (calculo de fibonacci de n-2 recursivo)
lw x5, 4(sp)              # armazena em x5 o segundo elemento armazenado na pilha
sw x10, 8(sp)             # armazena x10 no terceiro elemento alocado da pilha
addi x5, x5, -2           # subtrai 2 de x5
jal x1, fib               # armazena pc + 4 em x1 e vai para fib

# TERCEIRA PARTE (soma de fibonacci de n-1 e de n-2 recursivo)
lw x6, 8(sp)              # armazena em x6 o terceiro elemento armazenado na pilha
add x10, x10, x6          # soma x6 em x10
lw x1, 0(sp)              # armazena em x1 o primeiro elemento armazenado na pilha
addi sp, sp, 12           # desaloca os 3 últimos elementos da pilha
jalr x0, 0(x1)            # retorna para a linha do endereco x1

teste_fim:
