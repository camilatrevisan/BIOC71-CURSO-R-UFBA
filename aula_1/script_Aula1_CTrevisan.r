######################################################
# Introdução Linguagem R
# Vitor Passos Rios
# Universidade Federal da Bahia
# https://github.com/vrios/Intro-Linguagem-R/wiki
#####################################################


#####Usando o R como calculadora#####


#Digite no R os códigos abaixo.
#Dica: escreva neste arquivo, ao lado do comando, o que ele faz,
#como no exemplo abaixo


1 + 1 #soma os valores


# O símbolo # representa um comentário, isto é, tudo que vier à direita
# dele será ignorado quando o R ler o arquivo


34 - 72.3


# use pontos como separador de decimal. O que acontece se você usar virgula?
78 / 3
2 ^ 3
3 * 2
sqrt(2)
pi
log(x = 3,base = 10)#calcula log de 3 na base 10
exp(x = 1)#calcula função exponencial
#o que querem dizer estes valores dentro do parêntese? porque usamos o = aqui?


#####Atribuição de valores e criação de objetos#####
#O que os comandos abaixo fazem?
objeto1=3 #cria objeto com valor 3
objeto1 #mostra o que tem no objeto "objeto1" 
objeto = 42 #cria objeto com valor 42
objeto #mostra o que tem no objeto "objeto"
objeto.2 <- 42 #cria objeto com valor 42
objeto.2 #mostra o que tem no objeto "objeto.2"
# Os símbolos = e <- fazem basicamente a mesma coisa. Que coisa?
# atribuem um valor a um objeto
objeto.cubico <- objeto^3 #Eleva "objeto" ao cubo
resultado.1 <- (objeto.cubico / 3) + 7 #divide "objeto.cubico" por três e soma sete ao resultado
objeto.texto <- "texto sempre vem entre aspas" #cria um objeto com o texto: "texto sempre vem entre aspas"
objeto.texto #mostra o que tem dentro de "objeto.texto"
objeto.texto.2 <- "42" #cria objeto com o texto "42"


objeto.vetor.1 = 1:34 #cria um vetor com a sequência de números d e1 a 34
objeto.vetor.1 #mostra o que tem dentro de objeto.vetor.1
objeto.vetor2 = c(1, 74.5, 48) #cria um vetor com os elementos entre parênteses
objeto.vetor2 #mostra o que tem dentro de objeto.vetor2


?seq #abre a página de ajuda da função seq
objeto.vetor3 = seq(from = 20, to = 32, by = 0.5) #cria um objeto com sequencia iniciando em 20, de 0.5 em 0.5 até 32


#podemos calcular estatísticas com o r
mean(objeto.vetor3) #media
var(objeto.vetor3) #variancia
median(objeto.vetor3) #mediana
min(objeto.vetor3) #valor máximo encontrado no vetor objeto.vetor.3
max(objeto.vetor3) #valor mínimo encontrado no vetor objeto.vetor.3
diff(objeto.vetor3) #calcula a diferença entre os elementos sucessivos do vetor


# R também faz comparações entre objetos
42 > 7 #verifica se 42 é maior que 7
objeto == objeto.2 #verifica se "objeto" é igual a "objeto.2"
objeto == objeto.texto.2 #verifica se "objeto" é igual a "objeto.texto.2"
# o que aconteceu acima?
#tanto "objeto.2" quanto "objeto.texto.2" sao iguais a "objeto"
7.1 <= 7.001 #verifica se 7.1 é menor ou igual a 7.001
?"<" #abre a página de ajuda sobre símbolos que permitem comparar objetos


#pedindo ajuda
?pi #abre a página de ajuda sobre constantes disponíveis no R
?log #abre a página de ajuda sobre logarítmos
??lm #abre a página de ajuda sobre modelos lineares
help(log) #abre a página de ajuda sobre logarítmos
help.search("anova") #abre a página de ajuda sobre anova


#####Arquivos e diretórios#####
# Como você descobre o diretório de trabalho?
getwd()

# Como você lista o conteúdo do diretório de trabalho?
list.files()

# Como você define o diretório de trabalho?
setwd()

# Como você carrega um arquivo de script?
source("NomeDoArquivo.R")

# Como você salva os objetos que criou?
save(objeto, file = "NomeDoArquivo.r")

# Como você carrega os objetos que criou?
load(file = "NomeDoArquivo.r")

# Como ver quis objetos estão na sua área de trabalho?
ls()

# Como remover objetos da área de trabalho?
rm(list = ls())

##### Lidando com erros#####
# O que acontece quando você digita os comandos abaixo?(Erros!) Como consertar cada erro?
objetol # Trocar o "l" por "1", nome correto do objeto é "objeto1" 
objeto .texto #retirar o espaco antes do ponto
Objeto #trocar "O" maiusculo por minusculo
source("chuchu.R") #não existe arquivo com esse nome na pasta de trabalho, só carrega se tiver lá
source(chuchu.R) #nome do arquivo a ser carregado deve vir entre aspas
setwd("C:/CavernaDoDragão") #Antes tem que criar a pasta com esse nome nesse local
getwd # Tem que colocar"()" depois de getwd
Getwd() #é tudo com letra minúscula
#dica: quando o R der erro, copie e cole a mensagem de erro no google