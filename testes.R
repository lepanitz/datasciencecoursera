##pacotes
install.packages("dplyr")
library(dplyr)
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
e1 <- c(5,8,8,9,11,7,7,6,9,9,11,12,8,10,5,11,13,11,13,8,5,11,12,11,10,12,9,9,7,12)
e1
class(e1)
###letra a (ok)
tb_e1 <- data.frame (table(e1)) #cria uma tabela com a distribuição de frequencia das variáveis
tb_e1
###letra b (ok)
hist(e1)
###letra c
range(e1)#amplitude
min(e1) #minimo
max(e1) #máximo
mean(e1) #média
median(e1) #mediana
(unique(e1))[which.max(tabulate(match(e1, (unique(e1)))))] #moda
sd(e1) #desvio padrão
summary(e1)#sumarização automática

##exercicio 2
e2 <- c(3.67,1.8,3.76,4.10,4.20,1.28,8.40,2.33,4.17,6.52,3.96,6.30,5.55,7.35,3.65,2.93,2.65,9.0,5.30,5.82,7.77,4.66,1.88,2.10,4.28,2.78,5.99,0.90,5.05,2.34)
e2
class(e2)
## letra a 
tb_e2 <- data.frame (table(e2)) #cria uma tabela com a distribuição de frequencia das variáveis
tb_e2
##letra b
hist(e2)
##letra c
range(e2)#amplitude
min(e2) #minimo
max(e2) #máximo
mean(e2) #média
median(e2) #mediana
(unique(e2))[which.max(tabulate(match(e2, (unique(e2)))))] #moda
sd(e2) #desvio padrão






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



