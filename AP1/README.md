# Atividade Prática I

Relatório da Atividade Prática I (AP1)

## Grupo 12

- Lucas Draeger de Andrade (Matrícula 20206224)
- Bruno Seixas (Matrícula 18104532)

## Descrição dos circuitos

### Demux 1 para 4

#### Circuito desenvolvido

* Circuito desenvolvido: Demux 1 para 4 
* Principais pontos durante o desenvolvimento: 
    * compreender o uso do process e do case
        * Em especial como funcionam e o porque dos sinais que precisamos passar como parâmetros para o process


O circuito demultiplexador 1 -> 4 é um circuito que recebe um sinal de 1 bit, que quando está ativo ou seja em nivel lógico alto,permite que um segundo sinal seletor de  defina qual das 4 possiveis saidas ira receber este sinal em nível logico alto, enquanto as outras saidas continuam zeradas. 

#### Simulação

Descrição breve do que foi feito para simular o demux 4 para 1.
Incluir qualquer problema encontrado na simulação, observações sobre atrasos e resultados da simulação (se funcionou, houve erros, testou todos os casos, etc). 

Exemplo de tabela em markdown (pode ser útil para descrição dos estímulos testados):

| A | B | S |
|:-:|:-:|:-:|
| 0 | 0 | 0 |
| 0 | 1 | 1 |
| 1 | 0 | 1 |
| 1 | 1 | 0 |


### Mux 4 para 1

#### Circuito desenvolvido

* Circuito desenvolvido: Mux 4 para 1 
* Principais pontos durante o desenvolvimento: 
    * ...

O circuito Multiplexador 4 -> 1 é um circuito que recebe 4 sinais diferentes, que podem variar em tamanho (podem ter N bits), em paralelo um segundo sinal chamado de seletor, de 2 bits, define qual dos 4 sinais recebidos será apresentado como sinal de saida. Este sinal seletor possui 2 bits logo 2^2 possibilidades, portanto cobre os 4 sinais de entrada possiveis. O sinal de saida também tem N bits, ou seja o mesmo numero de bits da entrada, logicamente. 

#### Simulação
Descrição breve do que foi feito para simular o Mux 4 para 1.

### Decodificador BCD 7-Segmentos (lógica)

#### Circuito desenvolvido

* Circuito desenvolvido: Decoder BCD -> Display 7-Segmentos usando expressões lógicas.  
* Principais pontos durante o desenvolvimento: 
    * 

O decodificador BCD -> 7 Segmentos é um circuito que possui uma entrada em valor binario BCD, ou seja, um valor binario de 4 bits que permite 2^4 = 16 possibilidades de saida. Com isso podemos apresentar no display de 7 segmentos os 16 caracteres que representam o sistema hexadecimal (De 0 - F). O display de 7-segmentos possui 7 bits que representam 7 segmentos que podem ser iluminados ou não dependendo do sinal que cada um destes segmentos recebe. Dessa forma, caso o decoder receba o valor 0001 em BCD ele deve converter essa entrada para o valor 10011111, onde os valores onde o sinal não está ativo são os sinais nos quais os segmentos serão iluminados. 

Nesta implementação utilizamos operações lógicas com os bits do sinal de entrada BCD e em seguida convertemos as possibilidades para as 7 saidas possiveis considerando os displays de 7 segmentos com os valores a,b,c,d,e,f,g, começando do segmento superior no sentido horário com o g sendo o segmento central. Uma importante nota é que neste caso temos cada uma das saidas como sinais de 1 bit. 

#### Simulação
Descrição breve do que foi feito para simular o BCD 7Seg.

### Decodificador BCD 7-Segmentos (case)

#### Circuito desenvolvido

* Circuito desenvolvido: Decoder BCD -> Display 7-Segmentos usando case.  
* Principais pontos durante o desenvolvimento: 
    

O decodificador BCD -> 7 Segmentos é um circuito que possui uma entrada em valor binario BCD, ou seja, um valor binario de 4 bits que permite 2^4 = 16 possibilidades de saida. Com isso podemos apresentar no display de 7 segmentos os 16 caracteres que representam o sistema hexadecimal (De 0 - F). O display de 7-segmentos possui 7 bits que representam 7 segmentos que podem ser iluminados ou não dependendo do sinal que cada um destes segmentos recebe. Dessa forma, caso o decoder receba o valor 0001 em BCD ele deve converter essa entrada para o valor 10011111, onde os valores onde o sinal não está ativo são os sinais nos quais os segmentos serão iluminados. 

Nesta implementação temos uma entrada BCD de 4 bits e uma saida abcdefg de 7 bits. Utilizamos os Processos e o Case, o que facilitou muito a implementação da logica. Dessa forma deixamos o codigo menos verboso e mais facil de corrigir. Então para cada possivel entrada BCD mapeada podemos selecionar a saida esperada. 

#### Simulação
Descrição breve do que foi feito para simular o BCD 7Seg.

## Outras observações

    * A maior dificuldade do projeto foi a instalção correta do modelSim e instalação dos componentes necessários para acessar as informações relacionadas as placas Cyclone e suas familias. 

    * Usando o git para vercionamento dos arquivos também encontrei dificuldade de encontrar um formato de arquivo gitignore para aceitar somente os arquivos que desejo que sejam analisados pelo git. 


-> Falar sobre tempos de atraso 

* A implementação usando process e case é muito mais facil de entender e muito mais rapida de implementar, além de facilitar a correção de erros.
