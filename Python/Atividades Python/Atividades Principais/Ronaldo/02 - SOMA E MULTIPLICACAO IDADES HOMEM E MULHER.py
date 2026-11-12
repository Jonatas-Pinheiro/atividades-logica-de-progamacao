i1=int(input("Digite a idade do primeiro homem"))
i2=int(input("Digite a idade do segundo homem"))
im1=int(input("Digite a idade da primeira mulher"))
im2=int(input("Digite a idade da segunda mulher"))
if(i1>i2) & (im1>im2):
    print("o calculo um é",i1+im2)
    print("o calculo dois é", i2*im1)
if(i1<i2) &(im1<im2):
    print("o calculo um é",i2+im1)
    print("o calculo dois é",i1*im2)
if(i1<i2) & (im1>im2) :
    print("o calculo um é", i2+im2)
    print("o calculo dois é", i1*im1)
if(i1>i2) & (im1<im2):
    print("calculo um é",i1+im1) 
    print("calculo dois é", i2*im2)