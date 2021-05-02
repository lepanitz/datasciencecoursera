#Aula sobre distribuições de probabilidades no R

library(ggplot2)

#Aplicação Distribuiçao Binominal

#Poderíamos está interessado em responder 
#a seguinte pergunta: Ao lançarmos uma moeda quatro vezes,
#qual a probabilidade de ocorrer cara, exatamente, duas vezes?.


moeda <- data.frame('cara'=
                      rep(c('0',"1","2","3","4"), 
                          c(1, 4, 6, 4, 1)))


ggplot(moeda, aes(x = cara, y=..count../sum(..count..), fill = cara)) +
  geom_bar(width=0.3) +
  labs(title = "Lançamento de uma moeda quatro vezes",
       x = "Quantidade de caras",
       y = "Probabilidade",
       fill='Qtd de caras')


#O R inclui algumas operações com as distribuições de probabilidade. 
#No caso, existe 4 operações básicas indicadas pelas letras:

#d calcula a densidade de probabilidade f(x) no ponto;

#p calcula a função de probabilidade acumulada F(x) no ponto;

#q calcula o quantil correspondente a uma dada probabilidade;

#r gera uma amostra aleatória da distribuição.



#Para responder a pergunta anterior, 
#Probabilidade de ocorrer exatamente 2 caras em 4 lançamentos de uma moeda.

dbinom(x=2, #Calcula a probabilidade de P(X=x)
       size=4, #Quantidade total de lançamentos
       prob=0.5,) #Probabilidade inicial de ocorrer o sucesso uma vez



# Ocorrer no máximo 3 caras em 4 lançamentos de uma moeda.

pbinom(q=3, #Quantidade de caras
       size=4, #Quantidade total de lançamentos
       prob=0.5, #Probabilidade inicial de ocorrência (lançar uma moeda uma única vez, qual a probabilidade de ocorrer cara)
       lower.tail = TRUE #P[X<= x]
)

#utilizando a função plot para construir o gráficos das probabilidades

caras <- 0:4

probabilidade <- dbinom(x=caras,   # Quantidade de sucessos
                        size = 4,  # Quantidade de lançamentos
                        prob=0.5)  # Probabilidade a priori de sucesso
probabilidade


plot(caras, probabilidade, 
     type='h',   # Desenha uma linha vertical
     col='green',   # Cor da linha
     lwd=5)      # Espessura da linha/ponto



#Aplicação da distribuição de Poisson

#Nos últimos 30 dias foram registrados a quantidade de acidentes
#por dia em uma determinada cidade.


acidente <- data.frame('acd'= c(9, 6, 9, 11, 10, 10, 6, 10, 9, 4, 8, 10,
                                10, 7, 9, 11, 4, 6, 11, 8, 5, 3, 5, 9, 6))

table(acidente$acd)


ggplot(acidente, aes(x = as.factor(acd), y=..count../sum(..count..),
                     fill = as.factor(acd))) +
  geom_bar(width=0.1) +
  labs(title = "Acidentes por dia",
       x = "Quantidade de acidentes",
       y = "Frequência",
       fill='QTD acidentes')


#Não é possivel afirmar qual a quantidade máxima de acidentes
#que podem ocorrer em um único dia.

#O modelo de Poisson é adequado para dados de contagem dentro
#de um intervalo (temporal ou espacial) fixo.

#Observando os dados, temos que a média e o desvio padrão da quantidade 
#de acidentes por dia são de:

mean(acidente$acd)

sd(acidente$acd)

#Observando o gráfico é razoável dizer que: 
#a prob. de ocorrer 9 acidentes em um único dia é de 0,20.

#Porem, observando a amostra, não é possivel de afirmar qual a
#probabilidade de ocorrer 12 acidentes em um único dia.

#Para responder essa questao, temos que fazer o uso 
#de um modelo probabilístico, neste caso, Poisson.

#Neste modelo, uma estimativa relacionada ao parâmetro λ
#deve ser a média amostral, isto é, λ=8.

dpois(x = 2,
      lambda = 8)

#Criando um grafico com as probabilidade para todos os dias



acid_dia <- 0:20
probs <- dpois(x = acid_dia,
               lambda = 8)

plot(acid_dia, probs, 
     type='h',   # Desenha uma linha vertical
     col='red',   # Cor da linha
     lwd=4)      # Espessura da linha/ponto

