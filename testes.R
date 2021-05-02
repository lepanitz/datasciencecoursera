##pacotes
install.packages("dplyr")
library(dplyr)
install.packages("TinyTeX")
library(tinytex)

##pacotes

##funções##
#moda
getmode <- function(v) {
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

##funções##

print("olá mundão!")
x <- c(1,3, 5)
y <- c(3, 2, 10)
rbind(x, y)
x <- list(2, "a", "b", TRUE)
x
x[[1]]
x <- 1:4
y <- 2:3
x
y
x+y
x <- c(17, 14, 4, 5, 13, 12, 10) 
x

#AULAS DE ESTATÍSTICA DA UFT

#lista de exercícios 1 para 13/05

##exercício 1
e1.df1 <- data.frame(dia = c(1:30),
                 vitmas = c(5,8,8,9,11,7,7,6,9,9,11,12,8,10,5,11,13,11,13,8,5,11,12,11,10,12,9,9,7,12))#cria dataframe 1 com as variáveis do exercício
###letra a (ok)
e1.df2 <- group_by(e1.df1,vitmas)%>%summarise(frq_absoluta=length(dia))#cria dataframe 2 agrupado com a frequencia absoluta             
e1.tot <- sum(e1.df2$frq_absoluta)#calcula o total da frequencia absoluta
e1.df2$fr_relativa <- e1.df2$frq_absoluta/e1.tot #calcula a frequencia relativa e adciona no dataframe 2
resultado1a<-e1.df2 #resultado final 

###letra b (ok)
hist(e1.df1$vitmas) #cria histograma com distribuição de frequencia da quantidade de vitimas

###letra c
amplitude<-range(e1.df1$vitmas)#amplitude
media<-mean(e1.df1$vitmas) #média
mediana<-median(e1.df1$vitmas) #mediana
moda<-(unique(e1.df1$vitmas))[which.max(tabulate(match(e1.df1$vitmas, (unique(e1.df1$vitmas)))))] #moda
desviopadrao<-sd(e1.df1$vitmas) #desvio padrão
resultado1c<- data.frame (medidas = c("minimo","maximo","media","mediana","moda","desviopadrao"),
                         valores = c(amplitude,media,mediana,moda,desviopadrao))

##exercicio 2
e2.df1 <- data.frame(municipio = c(1:30),
                     tx_med_geom = c(3.67,1.8,3.76,4.10,4.20,1.28,8.40,2.33,4.17,6.52,3.96,6.30,5.55,7.35,3.65,2.93,2.65,9.0,5.30,5.82,7.77,4.66,1.88,2.10,4.28,2.78,5.99,0.90,5.05,2.34))#cria dataframe 1 com as variáveis do exercício
## letra a 
AA<-max(e2.df1$tx_med_geom)- min(e2.df1$tx_med_geom)#amplitude total
i<-sqrt(30)#definição do intervalo de classes
h<-AA/i #amplitude do internavo de classes

classes <- c("0--|1.5","1.5--|3","3--|4.5","4.5--|6","6--|7.5","7.5--|9")#nome das classes
quebra <- c(0,1.5,3,4.5,6,7.5,9)#valores para quebra das classes
e2.df2 <- data.frame (table(cut(e2.df1$tx_med_geom,breaks=quebra,right=FALSE,labels=classes)))#cria tabela de frequencia com intervalos de classe
e2.df2 <- rename(e2.df2,tx_med_geom=Var1)
e2.df2 <- rename(e2.df2,frq_absoluta=Freq)#renomeia as colunas
e2.tot <- sum(e2.df2$frq_absoluta)#calcula o total da frequencia absoluta
e2.df2$fr_relativa <- e2.df2$frq_absoluta/e2.tot #calcula a frequencia relativa e adciona no dataframe 2
e2.df2 #resultado final

##letra b
hist(e2.df1$tx_med_geom)

##letra c
range(e2.df1$tx_med_geom)#amplitude
mean(e2.df1$tx_med_geom) #média
median(e2.df1$tx_med_geom) #mediana
(unique(e2.df1$tx_med_geom))[which.max(tabulate(match(e2.df1$tx_med_geom, (unique(e2.df1$tx_med_geom)))))] #moda
sd(e2.df1$tx_med_geom) #desvio padrão

##exercicio 3
A <- c(2,3,4)
B <- c(3,4,5)
C <- c(5,6,7)
##letra a
resultado3a <-intersect(A,B)
##letra b
resultado3b <-union((union(B,C)%>% setdiff(A)),B)
##letra c
Ac<-(union(B,C)%>% setdiff(A))
Bc<-(union(A,C)%>% setdiff(B))
AcBc <-intersect(Ac,Bc)
resultado3c<-union(union(A,B),C)%>% setdiff(AcBc)

##exercicio 4


#aula 29/04 - probabilidades
## probabilidade de sair 3 vezes cara em 4 lançamentos da moeda
dbinom(x=3, size = 4, prob = 0.5)
## probabilidade de sair cara até 3 vezes em 4 lançamentos da moeda
pbinom(q=3, size = 4,prob = 0.5,lower.tail = TRUE)
## FALSE inverte o resultado
pbinom(q=3, size = 4,prob = 0.5,lower.tail = FALSE)
##poisson probabilidade de ocorrer 12 acidentes com uma taxa de ocorrencia de 8
dpois(x=12, lambda = 8)
##
acid_dia <- 0:50
probs <- dpois(x=acid_dia, lambda = )



