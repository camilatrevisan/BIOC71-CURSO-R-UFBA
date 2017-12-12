############################
#####Anotações aula 4 ######
#####    Gráficos     ######
############################


# Chame o tipo de arquivo desejado, passando informações de tamanho, resolução, tipo de fonte, e nome de arquivo
png("SocialNetworkExample.png",width = 900,height = 900)#Nome e tamanho do arquivo, cria arquivo em branco

#plote seu gráfico normalmente, ele será escrito no arquivo e não irá aparecer na tela
plot(graph.subset,
     layout= layout_nicely(graph=graph.subset),
     vertex.label=NA,
     vertex.color=colors[membership(graph.subset.modulos)],
     vertex.size = 5
     )
#Primeiro vc tem que ter rodado a análise e jogado o resultado dentro de um objeto, o que vc vai plotar no gráfico é esse objeto contendo o resultado

#feche o dispositivo, usando dev.off(), senão o arquivo ficará corrompido
dev.off()#só qdo vc esta alterando o arquivo, abrir na tela é ok

#gráfico básico no R: plot()
plot(x= iris$Petal.Length,#Define o eixo x,
     y=iris$Sepal.Width,#Define o eixo y 
     col=iris$Species)#Define qual criterio para colorir os pontos

plot(x= iris$Petal.Length,#Define o eixo x,
     y=iris$Sepal.Width,#Define o eixo y 
     col=c("sienna","orchid","olivedrab"))#Define qual criterio para colorir os pontos, cor pode ser por numero ou nome entre aspas
#exemplo com as coisa turo arrumadina cos exemplos
plot(x= iris$Petal.Length,
     y=iris$Sepal.Width, col=rainbow(3),
     xlab="nomeDoEixo",#define nome dos eixos
     ylab="nomedoEixo",
     col.axis="purple",#rainbow e numero de cores, que tem q ser o numero de fatores
    family = "serif",#define familia de fontes
    cex=2, #tamanho do ponto no grafico
    lty = "dotdash",#tipo da linha em grafico de linah
    xlim =c(3,4),#tambem determina onde os eixos vao se cruzar
    ylim =c(1,4), #dentro da funcao, corta o grafico nos limites que vc dá
    las=3,#determina a orientacao dos valores nos eixos x e y
    bty="n" #linhas em volta do grafico - o: todas, l x e y, 7opostas 
    )


text(4, 4, "teste") #insere texto na coordenada indicada no grafico
colors() # Cores aceitas pelo R
#pacote viridis tem paleta de cores para daltonicos
plot(iris$Petal.Length ~ iris$Sepal.Width, col=rainbow(3))#primeiro é y, segundo é x
#parametros da função plot, dentro da funcao
main = "titulo do grafico"
#tipo de gráfico (ponto, linhas, etc) 	“p”,“l”,“b”…
type = "p" #isso dentro da funcao do plot

######Enfeites de gráfico#######
par() #mexe na área de plotagem, margem, tamanho, paineis, etc
par( #chama a funcao par e altera tudo que for feito apos ela. 
  mfrow=c(1,2))     # define que é pra plotar os graficos em uma linha com duas colunas
#dentro de par vc pode definir coisas que sejam iguais para todos os grafico, que sejam relacionados a cor e area do grafico. alguns tem q ser dentro de cada grafico msm
plot(x=iris$Sepal.Length, y=iris$Petal.Length,        #primeiro gráfico
     col = iris$Species,                          
     main = "Graficuzinho")     

plot(x=iris$Sepal.Length, y=iris$Sepal.Width,         #segundo gráfico
     col = iris$Species,                          
     main = "Graficuzao")


dev.off() #reseta o que vc ja coisou antes, pode definir de novo as configs do par e tal.

#outras coisas q vc pode jogar em cima do grafico
abline(#linha de regressao
  h=mean(iris$Sepal.Width),#linha horizontal (vertical é v) passando na media de sepal.width
  col= "red")#cor da linha
#adicionar ponto no grafico
points(x=7, y=2)
arrows(x0=3, y0=3, x1=2, y1=2) #coloca uma seta no grafico
segments(x0=3, y0=3, x1=2, y1=2)#coloca um segmento de reta no grafico

#####Grafico com medias e desvio padrao#####
m1=mean(dragoes$y[dragoes$x=="aventureiros"]);m2=mean(dragoes$y[dragoes$x=="fazendeiros"])
m3=mean(dragoes$y[dragoes$x=="vacas"]);m4=mean(dragoes$y[dragoes$x=="virgens"],na.rm = T)
s1=sd(dragoes$y[dragoes$x=="aventureiros"]);s2=sd(dragoes$y[dragoes$x=="fazendeiros"])
s3=sd(dragoes$y[dragoes$x=="vacas"]);s4=sd(dragoes$y[dragoes$x=="virgens"],na.rm = T)
avg=c(m1,m2,m3,m4)
sdev=c(s1,s2,s3,s4)
plot(x= 1:4, y= avg,cex=1.5,pch=16, col=1:4,ylim=range(c(avg-sdev, avg+sdev)))
arrows(x0=1:4, y0=avg-sdev, x1=1:4, y1=avg+sdev, length=0.05, angle=90, code=3)#faz os coisinhos em cima da barra do desvio padrao; 


#Boxplot
boxplot(dragoes$y ~ dragoes$x, col=rainbow(length(dragoes$x)))

#####Aggregate####

media.por.comida = aggregate(x=dragoes$y,#indica qual coluna vc quer usar
                             by = list(dragoes$x), #agrupar pelos níveis da coluna x
                             FUN = mean, #FUN eh a funcao q vc quer executar 
                             na.rm=T) #para remover os NA's


