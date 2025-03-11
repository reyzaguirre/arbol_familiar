############################################################################### 
# Arbol familiar
# Visualización
############################################################################### 

library(kinship2)
library(igraph)
library(openxlsx)

d <- read.xlsx('entradas.xlsx')

d$padre <- gsub('Eyzaguirre', 'E', d$padre)
d$madre <- gsub('Eyzaguirre', 'E', d$madre)
d$hijo <- gsub('Eyzaguirre', 'E', d$hijo)

# subgrupo

tmp <- d[d$familia %in% c(0, 3), ]

ped <- pedigree(
  id = tmp$hijo, 
  dadid = tmp$padre, 
  momid = tmp$madre,
  sex = tmp$sex)

png('arboles/butron_liendo.png', 9200, 2000, res = 150)
plot(ped)
dev.off()
