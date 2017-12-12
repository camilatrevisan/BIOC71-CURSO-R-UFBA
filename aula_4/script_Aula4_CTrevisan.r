##########################
####Exercicio aula 04 ####
#### Introducao ao R  ####
#### Camila Trevisan  ####
##########################

##### Apostila 5. Criação e Edição de Gráficos no R #####
riqueza = c(15,18,22,24,25,30,31,34,37,39,41,45)#Cria um vetor com os valores de riqueza
area = c(2,4.5,6,10,30,34,50,56,60,77.5,80,85)#cria um vetor com os valores de area
area.cate = rep(c("pequeno", "grande"), each=6)#cria um vetor categorizando os valores em pequeno e grande
#####Fazendo os primeiros graficos#####
plot(riqueza~area) #plota os valores de riqueza em funcao da area
plot(area,riqueza) # o mesmo que o anterior
boxplot(riqueza~area.cate)#cria um boxplot da riqueza em funcao das categorias
barplot(riqueza)#cria um grafico de barras dos valores de riqueza
arvores = read.csv("esaligna.csv")
#plot pra todos
plot(arvores$dap~arvores$ht) #grafico de dispersao do dap em funcao do tamanho da arvore
plot(arvores$tronco~arvores$ht)#grafico de dispersao da biomassa do tronco em funcao do tamanho da arvore
plot(arvores$dap~arvores$classe) #como 'classe' sao catogorias,plotou um boxplot, nao teria como fazer dispersao
plot(arvores$dap~arvores$talhao) #plot do dap em funcao do talhão
plot(arvores$dap)#plota os valores da coluna dap pela posicao dele na tabela
plot(arvores$ht)#plota os valores pela posicao dele na tabela
#boxplot pra todos
boxplot(arvores$dap~arvores$ht) #faz um boxplot pra cada par de valores, como so tem um valor para cada categoria, nao cria os bigodes nem a caixa
boxplot(arvores$tronco~arvores$ht)#faz um boxplot pra cada par de valores
boxplot(arvores$dap~arvores$classe)#boxplot com a variacao dos valores de dap em cada classe
boxplot(arvores$dap~arvores$talhao) #boxplot com a variacao dos valores de dap em cada talhao
boxplot(arvores$dap) #cria um boxplot com os valores da coluna media
boxplot(arvores$ht)#cria um boxplot com os valores da coluna ht
#Barplot
barplot(arvores$tronco,arvores$ht) #Nao da pra fazer um em funcao do outro, so plota os valores em barras
barplot(arvores$dap,arvores$classe) #da erro, pois a coluna classe possui valores nao numericos
barplot(arvores$dap,arvores$talhao) #plota os numeros dos talhoes e os dap. msm talhao sendo categoria, é numerico, entao plota
barplot(arvores$dap) #plota grafico de barras dos valores da coluna dap
barplot(arvores$ht)#plota grafico de barras dos valores da coluna ht
#####Aprendendo a editar graficos#####
?plot
riqueza <- c(15,18,22,24,25,30,31,34,37,39,41,45)#cria vetor com os valores de riqueza
area <- c(2,4.5,6,10,30,34,50,56,60,77.5,80,85)#cria vetor com os tamanhos das areas
plot(riqueza~area,#plota a riqueza em funcao da area
     xlab= "Tamanho da Ilha (ha)",#muda o titulo do eixo x 
     ylab="Riqueza de Espécies",#muda o titulo do eixo y
     main= "Aves da Ilha de Samoa")#muda o titulo do grafico
?par
par(pch=8, cex=2, las=1, family="serif")#define os parametros pros proximos plots (tipo de ponto, tamanho dos pontos e legendas, orientacao da legenda dos eixos, tipo de fonte)
plot(riqueza~area, #repetindo o plot para aplicar as definicoes do par
     xlab= "Tamanho da Ilha (ha)",
     ylab="Riqueza de Espécies",
     main= "Aves da Ilha de Samoa")
#plotando varios graficos numa mesma janela
par(mfrow=c(2,1))#define que os proximos graficos serao plotados em duas linhas em uma coluna
plot(riqueza~area)#plota o primeiro grafico
boxplot(riqueza~area.cate)#plota o segundo grafico

par(mfrow=c(1,2))#define que os proximos graficos serao plotados em uma linha em duas colunas
plot(riqueza~area)#plota o primeiro grafico
boxplot(riqueza~area.cate)#plota o segundo grafico

par(mfrow=c(2,1))#define que os proximos graficos serao plotados em duas linhas em uma coluna
par(mar=c(4,14,2,6))#define as margens da janela onde serao plotados os graficos, mesma margem pros dois plots
plot(riqueza~area)#plota o primeiro grafico
boxplot(riqueza~area.cate)#plota o segundo grafico

par(mfrow=c(1,2))#define que os proximos graficos serao plotados em uma linha em duas colunas
par(mar=c(14,4,8,2))#define as margens da janela onde serao plotados os graficos, mesma margem pros dois plots
plot(riqueza~area)#plota o primeiro grafico
boxplot(riqueza~area.cate)#plota o segundo grafico

par(mfrow=c(1,2))#define que os proximos graficos serao plotados em uma linha em duas colunas
par(mar=c(8,4,8,1))#define as margens pro primeiro plot
plot(riqueza~area)#plota o primeiro grafico
par(mar=c(5,2,4,0.5))#define as margens do segundo plot, valor inicial tava mto grande, reduzi pra 5
boxplot(riqueza~area.cate)#plota o segundo grafico
dev.off()

#####Mudando diferentes graficos#####
riqueza = c(15,18,22,24,25,30,31,34,37,39,41,45)
area = c(2,4.5,6,10,30,34,50,56,60,77.5,80,85)
area.cate = rep(c("pequeno", "grande"), each=6)

plot(riqueza~area)#plotando a riqueza em funcao da area
plot(riqueza~area, bty="l", tcl=0.3)#bty muda a borda da area de plotagem, e mudou a orientacao tamanho dos tickmarks dos eixos x e y
boxplot(riqueza~area.cate, bty="l", tcl=0.3)
par(bty="l")
par(tcl=0.3)
boxplot(riqueza~area.cate)#bty e tcl so funcionaram qdo chamados dentro do par, dentro do boxplot nao

#####Inserindo mais informacoes em graficos####
riqueza = c(15,18,22,24,25,30,31,34,37,39,41,45)
area = c(2,4.5,6,10,30,34,50,56,60,77.5,80,85)
abundancia = rev(riqueza)

plot(riqueza~area)
lines(lowess(area, riqueza))#plota uma linha entre os eixos

model =  lm(riqueza~area)#cria um modelo linear entre riqueza e area dentro do objeto model
plot(riqueza~area)#plota a riqueza em funcao da area
abline(model)#traça a reta do modelo

plot(riqueza~area)
abline(15,0.4)#cria uma reta que corta o eixo y em 15, com inclinacao de 0.4

plot(riqueza~area)
abline(v=mean(area))#traça uma reta na media de area
abline(h=mean(riqueza))#traca uma reta na media 

plot(riqueza~area)
text(20,40,"texto")#insere um texto no ponto indicado

plot(riqueza~area)
mtext("legenda no lado errado", side=4, line=.5, at=20,cex=2, family="serif")#cria legenda no local e com os parametros indicados (side: lado que sera plotada a legenda, line: ajusta a posicao da legenda horizontalmente, at: ajusta a posicao vertical, cex: tamanho: family: fonte)

plot(riqueza~area)#plota o primeiro grafico
par(new=TRUE)#permite plotar outro grafico por cima do primeiro
plot(abundancia~area)#plota o segundo grafico por cima do primeiro

plot(riqueza~area)
par(new=TRUE)
plot(abundancia~area, axes=FALSE, ann=FALSE, pch=16)#axes=false: nao cria os eixos do segundo grafico, ann = false: suprimir a legenda do eixo, pch 16 para diferenciar os pontos dos dois graficos
axis(4)#plota o eixo do segundo grafico no lado 4 da area de plotagem

plot(riqueza~area)
rect(20,20,40,40)#cria um retangulo no local indicado

#Salvando graficos
jpeg(filename = "Rplotaula.jpg", #nome do arquivo
     width = 480,height = 480, #tamanho do grafico
     units = "px",#define unidades como 'pixel'
     pointsize = 12, #definicao da imagem
     quality = 100,#qualidade do jpeg
     bg = "white",#cor do fundo
     res = NA,#resolucao
     restoreConsole = TRUE)#volta o foco pra o console apos criacao do arquivo

par(mfrow=c(1,2))#define que os proximos graficos serao plotados em um linha e duas colunas
par(mar=c(14,4,8,2))#define as margens da area de plotagem dos graficos
plot(riqueza~area)#plota o primeiro
boxplot(riqueza~area.cate)#plota o segundo

dev.off()#fecha o arquivo. repete ate dar a mensagem Error in dev.off() :não é possível desligar dispositivo 1 (o dispositivo nulo)

png("meugrafico%02d.png")#cria os proximos plots com esse titulo padrao mudando somento o numero (ate 99), na pasta de trabalho, no formato png
#mesma coisa que o anterior, mas no formato bmp, jpeg, png e tiff, podendo salvar ate 999 graficos
bmp(filename = "Rplot%03d.bmp")
jpeg(filename = "Rplot%03d.jpg")
png(filename = "Rplot%03d.png")
tiff(filename = "Rplot%03d.bmp")
dev.off()

####Exercícios 5 - Criação de Gráficos####

#5.1 Editando alguns parâmetros gráficos
arvores = read.csv("esaligna.csv")
plot(arvores$dap~arvores$ht
     ,xlab="Altura das árvores (m)"
     ,ylab="Diâmetro à altura do peito (cm)"
     ,bty="l" 
     ,tcl=0.3
     ,main="Diâmetro à altura do peito X Altura das árvores"
     ,cex=2)
#5.2 Dois gráficos juntos
par(mfrow=c(1,2))
boxplot(arvores$dap~arvores$talhao, main= "A")#primeiro grafico

#calculando as medias
m1=mean(arvores$dap[arvores$talhao=="16"])
m2=mean(arvores$dap[arvores$talhao=="17"])
m3=mean(arvores$dap[arvores$talhao=="18"])
m4=mean(arvores$dap[arvores$talhao=="22"])
m5=mean(arvores$dap[arvores$talhao=="23"])
m6=mean(arvores$dap[arvores$talhao=="32"])
#calculando os desvios padrao
s1=sd(arvores$dap[arvores$talhao=="16"])
s2=sd(arvores$dap[arvores$talhao=="17"])
s3=sd(arvores$dap[arvores$talhao=="18"])
s4=sd(arvores$dap[arvores$talhao=="22"])
s5=sd(arvores$dap[arvores$talhao=="23"])
s6=sd(arvores$dap[arvores$talhao=="32"])

avg=c(m1,m2,m3,m4,m5,m6)
sdev=c(s1,s2,s3,s4,s5,s6)

plot(x= 1:6, y= avg,cex=1.5,pch=16, col=1:6,ylim=range(c(avg-sdev, avg+sdev)), text(5.5, 20, "B"), main="B")
arrows(x0=1:6, y0=avg-sdev, x1=1:6, y1=avg+sdev, length=0.05, angle=90, code=3)

#5.3 Adivinhando o codigo
dados = read.csv("table3.csv")
par(mfrow=c(1,2),bty="l",tcl=0.3, family="serif")
plot(dados$y1~dados$x1,xlab="Log(Patch size)(ha)", ylab="Euclidean distances",xlim= c(0.5,2.5),ylim =c(0.0,3.0), pch=17)
model =  lm(dados$y1~dados$x1)
abline(model)
boxplot(dados$x2~dados$y2, outline=FALSE,ylim =c(0.0,3.0))

                                                                                     