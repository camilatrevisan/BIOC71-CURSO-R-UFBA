#Aula 01 - Introduçao ao R
#Operaçoes matemáticas básicas utilizam os sinais comuns
1+2
5-1
2*2
4/2
2^2
#Funçao: operaçao que já vem pronta dentro do R. Nome seguido de ().
#dentro do parêntese vem o argumento da funçao.
#Argumentos devem ser sempre separados por vírgulas
#Busca de ajuda: ? busca pela pagina da ajuda da função citada
#?? busca por páginas de ajuda que tenham a palavra
#para definir um objeto, o nome tem q estar entre aspas. ex:
sorvete = "feijao"
#Se colocar sem as aspas dá ruim
#Listar itens dentro de um vetor:
equipe = c("snorlax", "tyranitar", "blissey")
equipe = c(equipe, "dragonite")
#Criando sequencias de numeros
1:10 #basicão nao precisa nem da funçao
#todo parâmetro (from, to, by) tem q  ser seguido por =
seq(from = 1, to = 100, by =20)
seq(from = 1, to = 50, by =2.3)
#Criando repetições
rep("neno", 4)
#Operaçoes com vetores; segue a ordem listada no vetor. 
peso.real = c(100, 45, 77, 60)
peso.perfil = c(70, 50, 60, 55)
quilos.omitidos = peso.real - peso.perfil
#se os vetores tiverem tamanhos diferentes, irá repetir o menor até o fim do maior
peso.real = c(100, 45, 77, 60)
peso.perfil = c(70, 50)
quilos.omitidos = peso.real - peso.perfil
quilos.omitidos
#Identificar numero de itens no vetor
length(peso.real)
length(equipe)
#Cada item do vetor tem uma posiçao exata. Voce pode acessar qual elemento ocupa cada posiçao assim:
equipe[2]
#Para saber qual a posiçao do valor especifico dentro do vetor ---outra aula
#Dataframe: tabela que une vetores
vetor1=LETTERS
vetor2=1:26
dados=data.frame(x=vetor1, y=vetor2)
#Os dois vetores tem que ter a mesma quantidade de dados, a tabela tem que ter o msm numero de linhas nas duas colunas
vector3=letters
vector4=26:1
nomesColunas = c("Letras","Numeros")
dadosNomeados=data.frame(vector3, y=vector4)
colnames(dadosNomeados) = nomesColunas
head(dadosNomeados)
dadosNomeados[1,2]
#$ acessa o que tem nas colunas das tabela
dadosNomeados$Numeros
#Indexaçao usando colchetes
#Dentro de um universo de valores....
Idade = c(3.0, 4.0, 5.0, 6.0, 8.0, 9.0, 10.0, 11.0, 12.0, 14.0, 15.0, 15.0, 16.0)
#Podemos acessar os objetos de cada posiçao adicionando colchete fora dos parentese
Idade[c(5, 4, 1, 10, 12)]
#Podemos selecionar que indique quais valores são maiores, menores, iguais a um valor
#Mas mostra so o que tiver dentro do que vc pediu (TRUE); e (FALSE).
Idade > 6
#E pedir que mostre os valores que correspondem
Idade[ Idade>6]
