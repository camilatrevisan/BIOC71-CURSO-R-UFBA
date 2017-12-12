##############################
#####Anotações aula 5 ########
##### Manipulação de dados,###
#####análise exploratória#####
##############################
getwd()
####Funcao subset####
#x = objeto a ser dividido
#subset = condição lógica indicando o que deve ser mantido
#select= indica as colunas a serem selecioandas em um dataframe
dragoes_completo = read.csv("dragoes_completo.csv", sep=";")
vermelhos.grandes = subset(
  x=dragoes_completo
  ,subset = tamanho_asa >= 15 & cor == "vermelho" #subconjunto somente com vermelhos acima de 15 metros
  , select=n_chifres:idade #manter apenas a coluna n_chifres
)
vermelhos.grandes

####Familia apply####
numericos= data.frame(dragoes_completo$peso,dragoes_completo$n_chifres,dragoes_completo$tamanho_asa,dragoes_completo$idade)
somas = apply(numericos, MARGIN = 2, FUN =  sum, na.rm=T)#permite aplicar funções com outros parametros, e filtrar, MARGIN 1 = linhas, 2=linhas e colunas|Aplica uma funçao a todas as linhas ou todas as colunas de um array (dataframe numérico ou matriz), retorna um vetor ou matriz

#Função lapply() Aplica uma função a cada elemento de uma lista, e retorna uma lista. Pode lidar com qualquer tipo de dado, a depender de FUN
lapply(X, FUN, ...)
#X um lista ou objeto que será convertido em lista (pode ser data.frame ou matriz)
#FUN é a função que se quer aplicar nos elementos de, sem parênteses
lista.somas = lapply(numericos, FUN =  sum, na.rm=T)
lista.somas
#permite executar a mesma funcao em dados de diferentes tipos ao mesmo tempo

#####Função sapply()####
#Aplica uma função a cada elemento de uma lista, e retorna uma vetor com os resultados. Pode lidar com qualquer tipo de dado, a depender de FUN
lapply(X, FUN, ...)
#X um lista ou objeto que será convertido em lista (pode ser data.frame ou matriz)
#FUN é a função que se quer aplicar nos elementos de X, sem parênteses
#... são os argumentos que serão passados para a função FUN
vetor.somas = sapply(numericos, FUN =  sum, na.rm=T)
vetor.somas

####Função tapply()#####
#tapply(X, INDEX, FUN, ...)
#Aplica uma função a subsets do objeto
#X = um objeto, tipicamento um vetor
#INDEX uma lista de fatores, com comprimento igual a X, usado para criar subconjuntos nos quais FUN será aplicada
#FUN é a função que se quer aplicar nos elementos de X, sem parênteses
#... são os argumentos que serão passados para a função FUN
x = 1:20
y = factor(rep(letters[1:5], each = 4))
tapply(x, INDEX=y, FUN = sum)

media.por.cor2=tapply(dragoes_completo$n_chifres, INDEX = dragoes_completo$cor, FUN = mean)
class(media.por.cor2)

####Analise exploratoria####
#Antes de tudo, verifique a estrutura dos dados, NAs e erros de digitação
str(dragoes_completo) #Mostra um resumo da tabela

head(dragoes_completo)#mostra o topo da tabela

sum(is.na(dragoes_completo))#mostra quantos NA tem na tabela, só mostra a qtd, n mostra onde nem remove

summary(dragoes_completo)#para as colunas numericas, da distribuicao dos dados(min, máx, 1quartil, mediana, media, 3quartil). se se for categorico te da qtos tem de cada categoria. mostra em qual coluna tem o NA

unique(dragoes_completo$cor)#identifica erros de digitacao
dragoes_limpo = dragoes_completo #copie seus dados para um outro objeto
dragoes_limpo=dragoes_limpo[,-1] #coluna 1 é inútil
dragoes_limpo$cor[dragoes_limpo$cor =="dorado" ] = "dourado"
dragoes_limpo$cor[dragoes_limpo$cor =="vremelho" ] = "vermelho"
dragoes_limpo$cor[dragoes_limpo$cor =="banco" ] = "branco"
dragoes_limpo$cor = tolower(dragoes_limpo$cor) # tolower muda maiúsculas para minusculas, toupper altera tudo pra maiuscula
unique(dragoes_limpo$cor)

dragoes_limpo$cor = factor(dragoes_limpo$cor)#transformando novamente em fator
dragoes_limpo = dragoes_limpo[!is.na(dragoes_limpo$peso),]#removendo NA
unique(dragoes_limpo$cor)#confere novamente
summary(dragoes_limpo)#confere novamente

#para ir alem das estatisticas mostradas no summary, usa a funcao apply

sds = lapply(X = dragoes_limpo,FUN = sd ,na.rm=T ) #sd não funciona para fatores

#para usar funcoes que vc cria
#erro padrão da média, é igual ao desvio padrão dividido pela raiz do número de amostras
erro.padrao.media = function(x) {
    sd(x)/sqrt(length(x))
}
erros = aggregate(dragoes_limpo$idade
                  ,by=list(dragoes_limpo$dieta)
                  ,FUN = erro.padrao.media
)

#Detectando outliers
par(mfrow=c(1,2))
boxplot(dragoes_limpo$tamanho_asa)#pelo boxplot tem um ponto meio away... mas será um outlier?
dotchart(dragoes_limpo$tamanho_asa)#plota todos os pontos pelo valor de x, um em cada linha. pela distribuiçao dos pontos vc identifica se eh um outlier

#homogeneidade da variancia; Teste de Bartlett ou de Levene (mais robusto, pacote car)
library(car)
leveneTest(dragoes_limpo$peso ~dragoes_limpo$dieta)
#observando os residuos, se for normal, eles tao distribuidos doidao no plot
plot(lm(dragoes_limpo$peso ~dragoes_limpo$idade))

#qqnorm() é uma investigação rápida de normalidade da variável
qqnorm(dragoes_limpo$tamanho_asa) #plota os dados contra uma distribuição normal
qqline(dragoes_limpo$tamanho_asa) #plota uma linha para facilitar a comparação. se as distribuições forem  exatamente iguais, todos os pontos caem em cima da linha

#qqplot() compara duas distribuições qualquer
qqplot(dragoes_limpo$tamanho_asa,dragoes_limpo$peso)

#distribuição normal
#Usadas para gerar dados artificais com as propriedades desejadas. 
#O R possui as seguintes distribuições por padrão: beta, binomial, Cauchy, qui-quadrado, exponencial, F, gamma, geométrica, hipergeométrica, log-normal, multinomial, binomial negativa, normal, Poisson, t de Student, uniforme, Weibull

rnorm(n, mean = 0, sd = 1) #gera n observações amostradas de uma normal de media 0 e sd 1
dnorm(3, mean = 0, sd = 1, log = FALSE)# retorna a probabilidade de um valor x, com media 0 e sd 1
pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE) # retorna a probabilidade acumulada de que um numero aleatório seja menor que q (usada para encontrar o valor de p<=0,05)
qnorm(p, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE) # retorna o valor correspondente a uma probabilidade acumulada p

