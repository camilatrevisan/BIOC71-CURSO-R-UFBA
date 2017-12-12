#Carregar tabela com os dados
aves.c <- read.table("aves_cerrado.csv", row.names=1, header=T, sep=";", dec=",", as.is=T)
#Mostrar cabeçalho e final da tabela
head(aves.c)
tail(aves.c)
str(aves.c)
summary(aves.c)
#Quais tem NA?
aves.c[aves.c$urubu==NA,] 
#Assim não vai, pq NA não é um número, não dá pra comparar com nada. tenta assim:
is.na(aves.c)
#Aeeee! Assim vc viu todos os NA dentro da tabela. E só em urubu?
is.na(aves.c$urubu)
#Identificando qual linha de urubu tem NA
aves.c[is.na(aves.c$urubu),]
#E de todas as colunas
aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),]
#Salvar só as linhas com NA num objeto temporário
temp1 = aves.c[is.na(aves.c$urubu)|is.na(aves.c$carcara)|is.na(aves.c$seriema),]
#Trocando os NA por 0
aves.c$urubu[is.na(aves.c$urubu)] = 0
aves.c$carcara[is.na(aves.c$carcara)] = 0
aves.c$seriema[is.na(aves.c$seriema)] = 0
aves.c[aves.c$urubu==0|aves.c$carcara==0|aves.c$seriema==0,]
temp1
table(aves.c$fisionomia)
#Verificamos que tem um ce e o resto Ce. Vamos corrigir!
aves.c$fisionomia[aves.c$fisionomia=="ce"] = "Ce"
#Conferindo se funfou
table(aves.c$fisionomia)
#Convertendo para um fator, ordenado da fisionomia mais aberta para a menos
aves.c$fisionomia = factor(aves.c$fisionomia, levels=c("CL","CC","Ce"))
str
str(aves.c)
summary(aves.c)
