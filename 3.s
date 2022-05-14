teste:                    # esse inicio so foi utilizado para realizacao dos testes
addi x10, x0, 0           # inicializacao do registrador x10 com o endereco do vetor
addi x11, x0, 6           # inicializacao do registrador x11 com o tamanho do vetor
addi x29, x0, 3           # inicializacao do registrador x29 para colocar no vetor 
sw x29, 0(x10)            # coloca o que esta em x29 na posicao 0 do vetor
addi x29, x0, 8           # inicializacao do registrador x29 para colocar no vetor 
sw x29, 4(x10)            # coloca o que esta em x29 na posicao 1 do vetor
addi x29, x0, 4           # inicializacao do registrador x29 para colocar no vetor 
sw x29, 8(x10)            # coloca o que esta em x29 na posicao 2 do vetor
addi x29, x0, 2           # inicializacao do registrador x29 para colocar no vetor 
sw x29, 12(x10)           # coloca o que esta em x29 na posicao 3 do vetor
addi x29, x0, 5           # inicializacao do registrador x29 para colocar no vetor 
sw x29, 16(x10)           # coloca o que esta em x29 na posicao 4 do vetor
addi x29, x0, 1           # inicializacao do registrador x29 para colocar no vetor 
sw x29, 20(x10)           # coloca o que esta em x29 na posicao 5 do vetor
jal x1, bubblesort        # chamada da funcao bubblesort
jal x0, teste_fim         # termina o teste

bubblesort:               # inicio da funcao
addi x5, x0, 0            # utiliza x5 como controlador do loop externo, iniciliza ele como 0
Reset:                    # Loop externo
addi x6, x5, 1            # utiliza x6 como controlador do loop interno, soma x5 + 1 e coloca nele
addi x5, x5, 1            # soma 1 em x5
addi x7, x10, 0           # inicializa x7 com o endereco inicial do vetor
beq x11, x5, Exit         # se ja ocorreram x11 - 1 iteracoes no loop externo vai para Exit

Loop:                     # Loop interno
beq x11, x6, Reset        # se ja ocorreram x11 - 1 iteracoes no loop interno vai para Exit
lw x29, 0(x7)             # armazena os dois elementos a se analizar do vetor em x29 e x30
lw x30, 4(x7)
blt x30, x29, Troca       # se o elemento em x30 eh menor que o elemento em x29 vai para Troca

Continua:				  # seta as variaveis para a proxima iteracao
addi x6, x6, 1            # soma 1 em x6
addi x7, x7, 4            # soma 4 em x7, representando o proximo endereco
jal x0, Loop              # volta ao Loop interno

Troca:                    # troca os valores dos enderecos lidos no loop
sw x29, 4(x7)             # armazena x29 no segundo endereco
sw x30, 0(x7)             # armazena x30 no primeiro endereco
jal x0, Continua          # vai para Continua

Exit:                     # termina a funcao
jalr x0, 0(x1)            # retorna a funcao com o vetor ordenado

teste_fim: