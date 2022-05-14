teste:                    # esse inicio so foi utilizado para realizacao dos testes
addi x10, x0, 5           # inicializacao do registrador x10
addi x11, x0, 3           # inicializacao do registrador x10
addi x12, x0, 0           # inicializacao do registrador x10
jal x1, Capacitancia      # chamada da funcao Capacitancia
jal x0, teste_fim         # termina o teste

Capacitancia:             # inicio da funcao
beq x10, x0, C            # se a capacitancia for 0 vai para o calculo dela
beq x11, x0, Q            # se a carga for 0 vai para o calculo dela
beq x12, x0, V            # se a tensao for 0 vai para o calculo dela
jalr x0, 0(x1)            # se nenhum elemento for 0 o programa retorna

C:                        # calculo da capacitancia
beq x12, x0, exit         # se a tensao for 0 vai para exit
div x10, x11, x12         # divide a carga pela tensao e armazena em x10
jalr x0, 0(x1)            # retorna a funcao com o valor requisitado armazenado em x10

Q:                        # calculo da carga
mul x10, x10, x12         # multiplica capacitancia e tensao, note que se outro elemento for 0 isso ira gerar um 0 que sera retornado
jalr x0, 0(x1)            # retorna a funcao com o valor requisitado armazenado em x10

V:                        # calculo da tensao
beq x10, x0, exit         # se a capacitancia for 0 vai para exit
div x10, x11, x10         # divide a carga pela capacitania e armazena em x10
jalr x0, 0(x1)            # retorna a funcao com o valor requisitado armazenado em x10

exit:                     # exit
addi x10, x0, 0           # coloca 0 em x10
jalr x0, 0(x1)            # retorna a funcao com 0 em x10

teste_fim: