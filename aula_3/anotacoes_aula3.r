###Anotações aula 3###


#argumentos são sempre separados por vírgulas na chamada da função
#no começo, é bom colocar cada argumento em uma linha para facilitar o entendimento
#TRUE habilita a opção, FALSE desabilita
arquivoLido =read.csv(file = "/arquivos/caixeta.csv", 
                      header = TRUE, #interpreta a primeira linha como sendo o nome das colunas
                      as.is = TRUE , # não altera interpreta o tipo de dado em cada coluna, não altera seus dados. Se for FALSE, texto é interpretado como factor
                      sep = ",", # define o caractere que deve ser o separador de colunas
                      dec = "." #define o caractere que deve ser o spearador de decimal
)


write.csv(x= arquivoLido, #objeto a ser gravado
          file = "arquivoNovo.csv", #nome do arquivo que vai ser gerado
          sep = ",", # define o caractere que deve ser o separador de colunas
          dec = ".", #define o caractere que deve ser o spearador de decimal
          row.names = F #ignora nomes/numeros das linhas
)
library(writexl)
library(readxl)
write_xlsx(mtcars , "mtcars.xlsx")
out <- read_xlsx("mtcars.xlsx")

