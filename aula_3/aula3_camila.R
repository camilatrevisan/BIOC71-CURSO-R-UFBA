######################################################
# Introdução Linguagem R                          ####
# Vitor Passos Rios                               ####
# Universidade Federal da Bahia                   ####
# https://github.com/vrios/Intro-Linguagem-R/wiki#####
######################################################

#diferencie a função source da função load()
source() #executa os comandos do script caminho/endereço indicado
load() #Carrega o arquivo para um objeto

#baixe para seu diretório de trabalho o arquivo toroidal.distance.R, disponível
#em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/toroidal.distance.R, e o arquivo distancias.csv, disponivel em https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/distancias.csv

#Abra toroidal.distances.R no R

# O que você precisa fazer para que as funções contidas nesse arquivo estejam disponíveis para uso no R?
#Buscar o arquivo em seu endereço e executar
# Faça o procedimento que você descreveu acima
source("toroidal.distance.R")

# Dentro do script toroidal.distance.R, altere o nome da função toroidal.distances para distance.matrix (substitua o nome dentro do arquivo) e salve o arquivo

# Carregue o arquivo distancias.csv para dentro do objeto distancias
distancias = read.csv("distancias.csv")

#chame a função distance.matrix() com o objeto distancias, e o argumento tam = 100
distance.matrix(distancias, tam = 100)

# O que aconteceu?
#nada, nao achou a  funçao
# O que você precisa fazer para que você possa usar a função distance.matrix?
source("toroidal.distance2.R")
# Salve o resultado do comando acima com o nome de matriz.distancias.csv
matriz.distancias.csv = distance.matrix(distancias, tam = 100) #isso so cria um objeto 
write.csv(x= distance.matrix(distancias, tam = 100), #objeto a ser gravado
          file = "matriz.distancias.csv") #nome do arquivo que vai ser gerado
          #sep = ",", # define o caractere que deve ser o separador de colunas
          #dec = ".", #define o caractere que deve ser o spearador de decimal
          #row.names = F #ignora nomes/numeros das linhas
)
# Usando a linha de comando, importe o arquivo dragoes.xsls para o objeto DnD
#https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/dragoes.xlsx (não abra o excel nem salve em .csv)
library(readxl)
download.file("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/dragoes.xlsx", destfile = "dragoes.xlsx") #Essa desgraça nao funciona! 
DnD = read_xlsx("dragoes1.xlsx")

# Confira a estrutura do arquivo
DnD
# Há algum NA? houve algum problema com o cabeçalho?
#palavras com acentos, parênteses, aí bugou tudos
# Refaça o script da aula 2, salvando o objeto caixeta, adicionando a coluna coletor e desvio, em um arquivo chamado caixeta_com_desvio.csv
caixeta = read.table("caixeta.csv", header=T, sep=",", as.is=T)
caixeta$coletor= "Darwin" 
caixeta$desvio= caixeta$h - mean(caixeta$h)
write.csv(x= caixeta, #objeto a ser gravado
          file = "caixeta_com_desvio.csv")
