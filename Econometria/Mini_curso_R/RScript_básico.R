############################################################
# Introdução ao R para Econometria I
# Oficina de Extensão – UFCG
# Autor: Nathan Pereira Gomes de Sousa
############################################################

# Ver diretório atual
getwd()

# Definir diretório de trabalho
# setwd("C:/seu/caminho/aqui")

# Carregando pacotes
require(tidyverse)
require(ggplot2)


#Objetos

##Criando um objeto
objeto_x <- 1+1
objeto_x

# Carregadno uma base de dados em um objeto
pib <- read.csv(,
                  header = TRUE, sep = ",")

ipca <- read.xlsx()

dados <- read.xlsx

# Visualizar as primeiras linhas
head(dados)

# Estrutura da base - Verificar a estrutura nos ajuda a identificar se a problemas em como os dados foram lidos pelo R
str(dados)

# Estatísticas descritivas
summary(dados)

# Criando nova variável
dados$inflacao_alta <- dados$inflacao > mean(dados$inflacao)
dados$inflacao_meida <- mean(dados$inflacao)

# Gráfico de dispersão: inflação e desemprego
ggplot(dados, aes(x = desemprego, y = inflacao)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Inflação e Desemprego",
    x = "Desemprego (%)",
    y = "Inflação (%)"
  )


# Estimação do modelo de regressão linear
modelo <- lm(inflacao ~ desemprego + juros, data = dados)

# Resultados do modelo
summary(modelo)

# Resultados organizados
tidy(modelo)

# Valores ajustados
dados$fitted <- fitted(modelo)

# Resíduos
dados$residuos <- resid(modelo)

head(dados)