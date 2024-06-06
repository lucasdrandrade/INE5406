import random 

golden_model = open('estimulos.dat', 'w')
result = 0
n = 32

for j in range(n*25):

    memA = ""
    memB = ""
    byteA = ""
    byteB = ""
    
    for i in range(n): 
        
        auxA = str(random.randint(0, 1)) 
        auxB = str(random.randint(0, 1))
        memA += auxA
        memB += auxB
        byteA += auxA
        byteB += auxB

        if i == 7:
            
            int_memA0 = int(byteA,base=2)
            int_memB0 = int(byteB,base=2)
            int_total0 = abs(int_memA0-int_memB0)
            byteA = ""
            byteB = ""

        if i == 15:

            int_memA1 = int(byteA,base=2)
            int_memB1 = int(byteB,base=2)
            int_total1 = abs(int_memA1-int_memB1)
            byteA = ""
            byteB = ""

        if i == 23:

            int_memA2 = int(byteA,base=2)
            int_memB2 = int(byteB,base=2)
            int_total2 = abs(int_memA2-int_memB2)
            byteA = ""
            byteB = ""

        if i == 31:
            int_memA3 = int(byteA,base=2)
            int_memB3 = int(byteB,base=2)
            int_total3 = abs(int_memA3-int_memB3)
            byteA = ""
            byteB = ""

    if ((j%16) == 0):
        result = 0

    int_total01 =  int_total0+int_total1
    int_total23 =  int_total2+int_total3
    int_total0123 =  int_total01+int_total23
    result += int_total0123
    saida = format(result, '014b')

    str_memA = str(memA)
    str_memB = str(memB)
    str_saida = str_memA
    str_saida += " "
    str_saida += str_memB
    str_saida += " "
    str_saida += saida

    golden_model.write(str_saida)
    golden_model.write('\n')
