############################################################################### 
# Arbol familiar
# Visualización
############################################################################### 

library(kinship2)
library(igraph)
library(openxlsx)

d <- read.xlsx('entradas.xlsx')

d$n <- nchar(d$hijo)
d[d$n > 35, ]

for (i in 1:3) {
  d[, i] <- gsub('José de la Resurrección Eyzaguirre Butrón', 'José Eyzaguirre Butrón', d[, i])
  d[, i] <- gsub('Eleodoro Eulogio Guillermo Eyzaguirre Liendo', 'Eleodoro Eyzaguirre Liendo', d[, i])
  d[, i] <- gsub('Alondra Noelia Eyzaguirre De La Cruz', 'Alondra Eyzaguirre De La Cruz', d[, i])
}

# Reducir Eyzaguirre

for (i in 1:3)
  d[, i] <- gsub('Eyzaguirre', 'E', d[, i])

# subgrupo

tmp <- d[d$familia %in% c(0, 3), ]

ped <- pedigree(
  id = tmp$hijo, 
  dadid = tmp$padre, 
  momid = tmp$madre,
  sex = tmp$sex)

png('arboles/butron_liendo.png', 9400, 2000, res = 150)
plot(ped, mar = c(2, 5, 2, 5))
dev.off()

# full

ped <- pedigree(
  id = d$hijo, 
  dadid = d$padre, 
  momid = d$madre,
  sex = d$sex)

png('arboles/eyzaguirre.png', 10000, 2000, res = 150)
plot(ped, mar = c(2, 5, 2, 5))
dev.off()
