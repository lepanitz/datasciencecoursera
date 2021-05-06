###Aula de R - Estatística Descritiva

##Banco de dados do Livro de estatistica básica do Morettin e Busab - mlisa

##Importando banco de dados
#milsa <- read.csv2("~/Documentos/Disciplinas 2021/analise_de_dados_pgdr/mlisa.txt", sep="")

##Criando um Data.Frame e nomeando de dados
dados <- data.frame(milsa)

#Resumo o bando de dados

str(dados)

#Vizualizando as primeiras linhas do banco de dados

head(dados)

#Vizualizando as ultimas linhas do banco de dados
tail(dados)

##As variáveis civil, instrucao e regiao são do tipo qualitativas,
##porém estão representadas por números.
##É possivel associar nomes a esses números à uma categoria:
  
dados$civil <- factor(dados$civil,label = c("solteiro", "casado"), levels = 1:2)
dados$instrucao <- factor(dados$instrucao,
                          label = c("1° Grau", "2° Grau", "Superior"),
                          lev = 1:3, ord= T)
dados$regiao <- factor(dados$regiao,
                       label = c("capital", "interior", "outro"),
                       lev = c(2, 1, 3))
mean(dados$salario)

##criando a variavel idade, considerando os meses
dados$idade <- dados$ano + dados$mes/12

##Usando o comando attach para reconhecer as variaveis dentro do DF
attach(dados)
mean(salario)


#Distribuição de Frequencia

#frequencia simples

freq = table(civil)
freq

#Frequencias relativas
freq_rel = prop.table(freq)
freq_rel

#Frequencias relativas em percentual
freq_rel = 100*prop.table(freq)
freq_rel

#Outra opção mais completa está disponível no pacote descr.
library(descr)
freq(civil)


#Distribuicao de frequencia por classes, pacote ftdh
library(fdth)
tabClasses= fdt(salario)
tabClasses

# também construir uma tabela bivariada para as variáveis civil e instrucao:
  
crosstab(civil, instrucao)

#Obter todas as medidas Resumo

#Medidas de Posição

#Média
mean(idade)

#Mediana
median(idade)

#Moda
names(table(idade))[table(idade)==max(table(idade))]

#quantils
quantile(salario)


#Medidas de dispersão

#Amplitude Total
AT = max(idade)-min(idade)
AT

#Variância amostral
var(salario)

#Desvio-padrão
sd(salario)

#Mesclando estatisticas de variaveis qualitativas e quantitativas
tapply(salario, instrucao, mean)

tapply(salario, instrucao, sd)


compmeans(salario,instrucao)

#Apresentação em Graficos

# Gráfico em Barras
barplot(table(instrucao), main = "Grau de Instrução")

barplot(table(civil, instrucao), legend = T,
        main = "Estado Civil versus Grau de Instrução")

barplot(table(civil, instrucao), beside = T,
        legend = T,horiz = T,
        main = "Estado Civil versus Grau de Instrução")

#gráfico de Dispersão
plot(idade, salario, main = "Gráfico de Dispersão", xlab = "Idade em anos",ylab = "Sálario-hora em Reais")


#Histograma com curva
hist(salario,xlab = "Sálario",ylab = "Densidade",col = blues9,freq = F,
xlim = c(-5,30),main = "")
curve(dnorm(x,mean = mean(salario),sd = sd(salario)), add = T)











         
