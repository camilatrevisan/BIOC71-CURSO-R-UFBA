##############################
#####Exercicios aula 5 #######
#####  Camila Trevisan   #####
##############################

#Importando a planilha
aves.c = read.table("aves_cerrado.csv", row.names=1, header=T, sep=";", dec=",", as.is=T)

#Verificação inicial do data frame
head(aves.c)
tail(aves.c)
str(aves.c)
summary(aves.c)

#Substituindo NA por 0
aves.c[aves.c$urubu==NA,] #nao funciona assim;

#Assim, animal...
is.na(aves.c)#teste logico para identificar se tem NA no objeto aves.c
is.na(aves.c$urubu)#Se tem na coluna urubu
aves.c[is.na(aves.c$urubu),]#Retorna as linhas de urubu onde tem NA
aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),]#retorna as linhas das colulas urubu, carcara e seriema que contem NA

#Salvando esse pedaço(linhas com NA de todas as aves)
temp1 <- aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),]

#substituindo os NA por 0 nas tres aves
aves.c$carcara[is.na(aves.c$carcara)] = 0
aves.c$seriema[is.na(aves.c$seriema)] = 0
aves.c$urubu[is.na(aves.c$urubu)] = 0

#Verificando se funcionou, comparando com o pedaço salvo antes
aves.c[aves.c$urubu==0|aves.c$carcara==0|aves.c$seriema==0,]
temp1
#verificando os valores da coluna fisionomia
table(aves.c$fisionomia)
#Identificado um erro de digitacao, substituindo ce por Ce:
aves.c$fisionomia[aves.c$fisionomia=="ce"] = "Ce"
#verificando se corrigiu
table(aves.c$fisionomia)
#Transformando a coluna fisionomia em fator um com 3 niveis 
aves.c$fisionomia = factor(aves.c$fisionomia, levels=c("CL","CC","Ce"))
#verifica a distribuicao dos dados
str(aves.c)
#estatisticas sumarias dos dados numericos, para conferir se esta como fator mesmo
summary(aves.c) 

#Média, Mediana e Quantis
mean(aves.c[,2:4])#calcularia a media das colunas 2 a 4, mas da erro


sapply(aves.c[,2:4],mean) #calcula a media das colunas 2 a 4 de aves.c
sapply(aves.c[,2:4],median)#calcula a mediana das colunas 2 a 4 de aves.c

apply(aves.c[,2:4],2,median) #mesma coisa com a funcao apply, indicando que a operacao sera feita na coluna

apply(aves.c[,2:4], 2, mean, trim=0.1) #media truncada, retirando 10% das observacoes
#nao ha mta diferença entre os valores, o que é esperado em uma distribuicao normal, indicando que os dados podem ter distribcao normal

#da os quartis da coluna urubu
quantile(aves.c$urubu) ## O mesmo que o retornado pelo summary
summary(aves.c$urubu)
quantile(aves.c$urubu, probs= seq(from=0,to=1,by=0.1))#pode mudar de quantos em quantos % mostra
#quartis, médias e medianas para as tres aves de uma vez
summary(aves.c[,2:4])

#Exploração de uma Variável Categórica
caixeta = read.csv("caixeta.csv", as.is=T)#carrega o csv
names(caixeta)#
table(caixeta$especie)
sort(table(caixeta$especie), decreasing=T)

