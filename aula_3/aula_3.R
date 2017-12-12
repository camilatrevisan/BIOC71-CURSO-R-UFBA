getwd() # descobre seu diretório
setwd() #muda seu diretório. O endereço deve vim entre aspas. Use SEMPRE \ e NÂO / 
source("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/scriptOnline.R")
#NÃO execute scripts que baixam na internet
caixeta = read.csv("https://raw.githubusercontent.com/vrios/Intro-Linguagem-R/master/arquivos/caixeta.csv")
library() #carrega os pacotes que o script precisará pra rodar
##dica: coloque isso no inicio do script. Se quiser, use comentários para explicar porque o pacote
##é necessário
##require: se não tiver o pacote, ele avisa
#isso não funciona nas funções do seu script. Os pacotes das funções devem ser carregados dentro da
#função. Se vc baixar antes, ela não reconhece
if(!require("chuchu")) {#substitua chuchu pelo pacote desejado
  stop("pacote chuchu não encontrado, instale para proseguir")
}
#colocar 4# no final da frase, cria capítulos no seu script. Isso é bom para scripts grandes!

save.image(file="tudoJunto.RData") #Salvar tudo que está no R, inclusive objetos, use a função 
#save.image() com a extensão .RData -> se vc fechar, irá abrir o RStudio do jeito que vc fechou
##Vitor não recomenda usar isso, o ideal é salvar script. Essa função de salvar o RData é ideal
#para análises mosntruosas que leva dias pra ler o script

save(file="resultadosSalvos.RData",list = list(resultado1, resultado2, resultado3)) #salvar 
#objetos específicos em um .RData com a função save().

list.files() #lista os arquivos dentro do diretório
load(),read.table(),read.csv() #cerrega os arquivos para dentro de um objeto
aulas = list.files (pattern = "aula") #criar um objeto que possui todos os meus arquivos que
#contenha aula no nome
aulas

scripts = list.files(pattern = "\\.R$") # "\\.R$" significa arquivos terminados em .R
scripts # objeto contendo os nomes dos arquivos, não os conteúdos

source("..//..//arquivos/toroidal.distance.R") #vai buscar o nome do arquivo, os .. faz ele 
#voltar uma pasta anterior para procurar. Ele busca arquivos em subpastas no diretório ou buscar
#arquivos que não estão no diretório

read.csv() #lê arquivos usando como padrão o ponto (.) como sepador de decimais e a vírgula (,)
#como separador de colunas.
read.csv2() #usa a vírgula como separador de decimais e o ponto-e-vírgula (;) como separador de 
#colunas

#argumentos são sempre separados por vírgulas na chamada da função
#no começo, é bom colocar cada argumento em uma linha para facilitar o entendimento
#TRUE habilita a opção, FALSE desabilita
arquivoLido =read.csv(file = "/arquivos/caixeta.csv", 
                      header = TRUE, #interpreta a primeira linha como sendo o nome das colunas
                      as.is = TRUE , # não altera interpreta o tipo de dado em cada coluna, não altera seus dados. Se for FALSE, texto é interpretado como factor
                      sep = ",", # define o caractere que deve ser o separador de colunas
                      dec = "." #define o caractere que deve ser o spearador de decimal, se tivesse vírgula ele iria entender as vírgulas como separador decimal
)
file.choose() #abre uma janela para eu escolher o arquivo que eu quero
arquivo_escolhido = read.csv (file.choose(),as.is = T, dec = ".") #aqui faz você escolher manualmente
#qual o arquivo que vc quer e joga ele dentro de um vetor, com as configurações que você quer

write.csv(x= arquivoLido, #objeto a ser gravado
          file = "arquivoNovo.csv", #nome do arquivo que vai ser gerado
          sep = ",", # define o caractere que deve ser o separador de colunas
          dec = ".", #define o caractere que deve ser o spearador de decimal
          row.names = F #ignora nomes/numeros das linhas
) #salvar suas alterações ou o seus resultados em um arquivo de texto
#write.table(), write.csv() ou write.csv2()

##Para escrever e salvar em tabelas do Excel, use os pacotes writexl e readxl####

library(writexl)
library(readxl)
write_xlsx(mtcars , "mtcars.xlsx")
out <- read_xlsx("mtcars.xlsx")
