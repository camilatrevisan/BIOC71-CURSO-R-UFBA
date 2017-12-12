##############################
##### Anotacoes aula 6   #####
#####  Camila Trevisan   #####
##############################
#####      Funcoes       #####
##############################

#Funcoes sao ferramentas utilizadas para realizar uma tarefa
#ou uma serie de comandos que fazem uma analise/operacao. vem seguidas de () no codigo
##pq usar funcao?
#regras dos tres: algo que vc faz 3 ou mais vezes em um script pode ser transformado em uma funcao - evita erros de ctrl+c ctrl+v, erros de digitacao
#particionamento do codigo: mais facil de identificar onde ocorrem os erros
#portabilidade: mais facil de compartilhar codigo corretamente

#Estrutura de uma funcao
erro.padrao.media =#nome pra chamar a funcao
  function(x) {# = diz que tudo depois de function vai pra dentro do objeto criado; (x) nome do objeto dentro da funcao. argumento da funcao
    sd(x)/sqrt(length(x)) #tudo entre {} é o codigo; 
  }
#toda a informacao que a funcao precisa pra operar tem que vir nos argumentos da funcao
#todos argumentos devem ter um valor padrao definido antes, que serao usados caso vc nao informe
#nome.da.funcao = function(argumento1, argumento2 = valor.padrao) Argumento1 nao tem valor padrao, o 2 sim
#por padrao, o R retorna o resultado da ultima operacao realizada pela funcao. se vc quer q retorne outra coisa, use return()
#####Retornar mais de um resultado####
erro.padrao.media.inutil = function(x) {
  sd(x)/sqrt(length(x))
  return(print("erro padrão calculado. Tenha um bom dia"))
}
exemplo = rnorm(n=100, mean = 50, sd = 15)
erro.padrao.media.inutil( x = exemplo)

#Ex2
erro.padrao.media.educado = function(x) {
  err=sd(x)/sqrt(length(x))
  return(print(paste("erro padrão igual a:",err," Tenha um bom dia")))
}
erro.padrao.media.educado( x = exemplo)

#####Mais de um resultado####
summary.de.pobre= function(x) {
  minimo=min(x)
  primeiroquartil=quantile(x,.25)
  mediana = median(x)
  media = mean(x)
  terceiroquartil= quantile(x,.75)
  maximo=max(x)
  erro.padrao=sd(x)/sqrt(length(x))
  
  tudoJunto =list(#juntando tudo em uma lista
    "Min."     = minimo, 
    "1st Qu"   = primeiroquartil, 
    "Median"   = mediana,
    "Mean"     = media, 
    "3rd Qu."  = terceiroquartil,
    "Max."     = maximo,
    "Std Err." = erro.padrao
  )
  return(tudoJunto)#indicando o que e pra retornar
}
exemplo = rnorm(n=100, mean = 50, sd = 15)
summary.de.pobre( x = exemplo)
#A funcao tem que ser feita para o tipo de dado de entrada (vetor, dataframe, lista...).
