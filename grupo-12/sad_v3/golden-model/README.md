# Golden Model 

## Descrição 

O script utilizado para gerar o arquivo de estímulos para o testbench foi escrito em Python. Ele cria um arquivo que contém 50 blocos de entradas para as computações da SAD.

## Formato do Arquivo

O arquivo gerado tem extensão .dat e cada linha contém três elementos separados por espaço:

    - Um número sem sinal de 32 bits simulando a entrada da memória A.
    - Um número sem sinal de 32 bits simulando a entrada da memória B.
    - Um número sem sinal de 14 bits simulando a saída da SAD a cada etapa do cálculo.

Cada bloco possui 16 linhas, não há separação entre os blocos.

## Execução do Script

Não existem depêndencias externas. Com isso não se faz necessário instalar nada além do proprio interpretador python.

Execute o script golden-model.py utilizando python3 ou versão superior. Um arquivo de estímulos será gerado no diretório local onde o arquivo foi executado. 




