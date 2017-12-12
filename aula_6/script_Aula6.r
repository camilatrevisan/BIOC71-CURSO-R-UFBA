##############################
#####    Script aula 6   #####
#####  Camila Trevisan   #####
##############################
#####      Funcoes       #####
##############################


media <-function(x)#funcao com nome media
{
  soma=sum(x)#faz a soma dos valores de x e coloca no objeto soma
  nobs=length(x)#conta os elementos de x e coloca no objeto nobs
  media=soma/nobs#divide a soma pelo numero de observacoes
  return(media)#retorna o valor da media
}

#Testando a funcao
ls()#lista os objetos no environment
media#retorna a estrutura da funcao media
media()#da erro pois nao tem o argumento da funcao
dados=rnorm(20,2,1)#cria uma distribuicao normal aleatoria com 20 elementos, media 2 e desvio padrao 1
media(dados)#calcula a media de dados
dados1=rnorm(200,2,1)#cria uma distribuicao normal aleatoria com 200 elementos, media 2 e desvio padrao 1
media(dados1)#calcula a media de dados1
dados2=(rnorm(10000,2,1))#cria uma distribuicao normal aleatoria com 10000 elementos, media 2 e desvio padrao 1
media(dados2)#calcula a media de dados2
sd(dados)#calcula o desvio padrao de dados
dados3=rnorm(20,2,0.01)#cria uma distribuicao normal aleatoria com 20 elementos, media 2 e desvio padrao 0.01
media(dados3)#calcula a media de dados3
dados4=rnorm(200,2,0.01)#cria uma distribuicao normal aleatoria com 200 elementos, media 2 e desvio padrao 1
media(dados4)#calcula a media de dados4
dados[2]<-NA#troca o valor da posicao 2 em dados por NA
dados#plota os valores de dados
media(dados)#tenta calcular a media de dados, mas nao consegue pq tem NA nos dados

#calculando a media em dados com NA
media<-function(x,rmNA=TRUE)  #funcao media, que contem um argumento e informa se tem NA ou nao
{
  if(rmNA==TRUE)#se tiver NA no dataset segue os passos abaixo
  {
    dados=(na.omit(x))#omite os NA de x e salvar em dados
    n.NA=length(x)-length(dados)#cria um objeto com o numero de observacoes apos a remocao dos NA's
    cat("\t", n.NA," valores NA excluídos\n")#printa a quantidade de observacoes removidas
  }
  else#caso contrario
  {
    dados=x#cria um objeto dados com os valores de x
  }
  soma=sum(dados)#faz a soma dos valores de dados e coloca no objeto soma
  nobs=length(dados)#conta os elementos de dados e coloca no objeto nobs
  media=soma/nobs#divide a soma pelo numero de observacoes
  return(media)#retorna o valor da media
}

media(dados)#calcula  a media de dados

#calcular a variancia
var.curso<-function(x)#criar uma funcao var.curso
{
  media=media(x)#calcula a media de x
  dados=na.omit(x)	#cria objeto dados com x sem NA
  disvquad=(dados-media)^2#cria objeto disvquad com os desvios quadraticos de dados
  var.curso=sum(disvquad)/(length(dados)-1)#cria objeto var.curso com a soma dos desvios quadraticos dividida pelo numero de objetos menos um 
  return(var.curso)#retorna a variancia
}

var.curso(dados)#retorna resultado da funcao var.dados
var(dados)### retorna o resultado da funcao var (variancia)
var(dados,na.rm=TRUE)#retorna o resultado de var sem os NA's
var(dados,na.rm=FALSE)#calcula sem tirar os NA's, nao retorna resultado

#Função para calcular o Índice de Dispersão
ID.curso<-function(x)#cria uma funcao ID.curso
{
  id=var.curso(x)/media(x)#que cria um ojeto id com o resultado da var.curso(x) dividido pela media de x
  return(id)#retorna o valor de id
}

#simulando dados
#aleatorio
aleat=rpois(200,2)#cria uma distribuicao de Poisson
aleat

#distribuicao uniforme
unif=runif(200,0,4)#cria uma distribuicao com 200 obsvercaoes entre 0 e 4
unif#plota unif
unif=round(unif,0)#arredonda os valores para numeros inteiros
unif#plota unif

#agregada
agreg=round(c(runif(100,0,1),runif(100,5,10)))#agrega duas distribuicoes, arredonda elas e salva num obj agreg
agreg

#calculando coefiente de dispersao para as tres distribuicoes criadas
ID.curso(aleat)

ID.curso(unif)

ID.curso(agreg)

#Função para criar o teste de signficância do ID
test.ID <- function(x, nsim=1000)
{ 
  ID.curso=function(x){var(x)/mean(x)}# essa função precisa das funcoes media e ID.curso
  dados=na.omit(x)#retira os NA
  ndados=length(dados)#contaa as observacoes
  med=mean(dados)#faz a media de dados
  id=var(dados)/med#divide a variancia de dados pela media
  simula.aleat=rpois(length(dados)*nsim, lambda=med) #cria uma simulacao aleatoria com o tamanho dos dados multiplicado por nsim e lambda = media
  sim.dados=matrix(simula.aleat,ncol= ndados) #cria uma matriz com os dados simulados acima e numero de colunas = n  observacoes de dados
  sim.ID=apply(sim.dados,1,ID.curso)#executa a funcao ID.curso em todas as linhas de sim.dados
  quant.ID=quantile(sim.ID, probs=c(0.025,0.975)) #calcula quantis de 2,25% e 97,5%
  if(id>=quant.ID[1] & id<=quant.ID[2])#Se o valor de id estiver entre os 2,25% e 97,5% 
  { 
    cat("\n\n\n\t distribuição aleatória para alfa=0.05 \n\t ID= ",id,"\n\n\n")#printa a frase entre aspas
  }
  if(id < quant.ID[1]) 
  { 
    cat("\n\n\n\t distribuição uniforme, p<0.025 \n\t ID= ",id,"\n\n\n")#Se o valor for menor q 2.5%, printa a msg entre aspas
  }
  if(id>quant.ID[2])
  { 
    cat("\n\n\n\t distribuição agregado, p>0.975 \n\t ID= ",id,"\n\n\n")#Se o valor for menor q 2.5%, printa a msg entre aspas
  }
  resulta=c(id,quant.ID)#junta o indice e os quantis num vetor resulta
  names(resulta)<-c("Indice de Dispersão", "critico 0.025", "critico 0.975") #renomeia os objetos dentro do vetor
  return(resulta)#retorna os resultados
}

# Testanto os dados simulados
#aplicando a funcao test.ID nas tres distribuicoes
test.ID(aleat)
test.ID(agreg)
test.ID(unif)

#outra funcao
eda.shape <- function(x)
{
  x11() #abre janela de plotagem para o grafico
  par(mfrow = c(2,2))	## muda o dispositivo gráfico para 2x2
  hist(x)                 # produz histograma de x
  boxplot(x)#cria um boxplot de x
  iqd <- summary(x)[5] -	summary(x)[2]     # faz a diferença entre o quinto elemento x e o segundo
  plot(density(x,width=2*iqd),xlab="x",ylab="",type="l")#plota a densidade probabilistica de uma distribuicao de dados, com base em x
  qqnorm(x)#plota os quantis da distribuicao de x e plota contra uma distribuicao normal de msm media e msm variancia
  qqline(x)#plota uma reta de ajuste 
  par(mfrow=c(1,1))#define que os graficos sejam plotados em uma linha e uma coluna
  
}

#Criando um vetor de dados com 20 valores simulando a densidade de árvores por parcelas 
set.seed(22) ## estabelece uma semente aleatória 
dados.pois20<-rpois(20,lambda=6) ## sorteia dados aleatórios de uma função poisson com média 6
sum(dados.pois20) ## a somatória aqui sempre dará 131, somente porque a semente é a mesma
set.seed(22)
dados.norm20<-rnorm(20,mean=6, sd=2) ## sorteia 20 dados de uma função normal com média 6 e dp = 2
sum (dados.norm20)               ### aqui o resultado dará sempre 130.48

###aplicar eda.shape para dados.dens

eda.shape(dados.pois20)

eda.shape(dados.norm20)

###aumentando a amostra

eda.shape(rpois(500,6))

eda.shape(rnorm(500,6))

#Modificando uma funcao
eda.shape1 <- function(x)
{
  x11()
  par(mfrow = c(2,2))#define plotagem dos graficos em duas colunas e duas linhas
  hist(x,main="Histograma de x")#plota um histograma de x
  boxplot(x, main="BoxPlot de x")#plota boxplot de x
  iqd <- summary(x)[5] -	summary(x)[2]# faz a diferença entre o quinto elemento x e o segundo
  plot(density(x,width=2*iqd),xlab="x",ylab="",type="l", main="Distribuição de densidade de x")#plota a densidade probabilistica de uma distribuicao de dados, com base em x 
  qqnorm(x,col="red",main="Gráfico Quantil x Quantil",xlab="Quantil Teórico",ylab="Quantil da Amostra")#plota os quantis da distribuicao de x e plota contra uma distribuicao normal de msm media e msm variancia
  qqline(x)##plota uma reta de ajuste 
  par(mfrow=c(1,1))#define plotagem dos graficos em 1,1
  
}
#executando a funcao modificada
eda.shape1(rnorm(500,6))

#Fazendo ciclos de operações
x1=rpois(20,1)#cria objeto c distribuicao aleatoria 
x2=rpois(20,2)#cria objeto c distribuicao aleatoria
x3=rpois(20,3)#cria objeto c distribuicao aleatoria
x4=rpois(20,1)#cria objeto c distribuicao aleatoria
sp.oc=matrix(c(x1,x2,x3,x4), ncol=4)#cria matriz de quatro colunas com os objetos acima
colnames(sp.oc)<-c("plot A", "plot B", "plot C", "plot D")#renomeia as colunas de sp.oc
rownames(sp.oc)<-paste("sp", c(1:20))#renomeia as linhas
str(sp.oc)#
dim(sp.oc)
head(sp.oc)

#Uma função para contar espécies por parcelas.
n.spp<-function(dados)
{
  nplot=dim(dados)[2]#cria objeto com a dimensao da posicao 2 de dados
  resultados=rep(0,nplot)#repete 0 nplot vezes
  names(resultados)<-paste("n.spp", c(1:nplot))#nomeia os resultados de n.spp 1 ate n.spp nplot
  dados[dados>0]=1#substitui os valores de dados maiores que 0 por 1
  for(i in 1:(dim(dados)[2]))
  {
    cont.sp=sum(dados[,i])
    resultados[i]=cont.sp
  }
  return(resultados)
}


##### Aplicando a função 

n.spp(sp.oc)

#similaridade
sim<-function(dados)
{
  nplot=dim(dados)[2]
  similar=matrix(1,ncol=nplot,nrow=nplot)
  rownames(similar)<-paste("plot", c(1:nplot))
  colnames(similar)<-paste("plot", c(1:nplot))
  dados[dados>0]=1
  for(i in 1:nplot-1)
  {
    m=i+1
    for(m in m:nplot)
    {
      co.oc=sum(dados[,i]>0 & dados[,m]>0)
      total.sp=sum(dados[,i])+sum(dados[,m])-co.oc
      similar[i,m]=co.oc/total.sp 
      similar[m,i]=co.oc/total.sp 
    }
    
  }
  return(similar)
}
