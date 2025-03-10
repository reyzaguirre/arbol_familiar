############################################################################### 
# Pedigree
# Visualización
############################################################################### 

library(AGHmatrix)
library(kinship2)
library(igraph)
library(openxlsx)

d <- read.xlsx('eyzaguirre.xlsx')

d$padre <- gsub('Eyzaguirre', 'E', d$padre)
d$madre <- gsub('Eyzaguirre', 'E', d$madre)
d$hijo <- gsub('Eyzaguirre', 'E', d$hijo)

pedAll <- pedigree(
  id = d$hijo, 
  dadid = d$padre, 
  momid = d$madre,
  sex = d$sex)

png('eyza_ped.png', 10000, 2000, res = 150)
plot(pedAll, angle = 4)
dev.off()
