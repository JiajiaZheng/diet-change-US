# Calculate the ajusted emissions factors using Leontief Inverse
# L_inverse is from Exiobase 2007 database: L = (I - A)^-1
# A is the input coefficient matrix of IO table in Exiobase

library(readr)
library(magrittr)
library(dplyr)
library(readxl)

#Import 2007 direct emission factor matrix
#Import 2007 Leontief Inverse matrix

direct_ef_2007 <- read_excel("~/Documents/GitHub/diet-change-US/Databases/mrEmissions_version2.2.2.xlsx", col_names = FALSE)[-1:-2,][,-1:-3]

L_inverse_2007 <- read_excel("~/Documents/GitHub/diet-change-US/Databases/L_inverse_2007.xlsx", col_names = FALSE)

direct_ef_2007 <- sapply(direct_ef_2007, as.numeric)
L_inverse_2007 <- sapply(L_inverse_2007, as.numeric)

#Multiply these two matrices

Ajusted_ef_2007 <- direct_ef_2007 %*% L_inverse_2007


