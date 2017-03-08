library(dplyr)
big_test <- rbind(dehyd.amphib.atrazine.atrazineD, dehyd.amphib.imid.imid, dehyd.amphib.metol.metolD, dehyd.amphib.tdn.tdnD, dehyd.amphib.chloro.chloromet)
time <- big_test$time
conc <- big_test$conc
species <- big_test$species
pesticides <- big_test$analyte
#need to calculate rehydration rates
weight <- big_test$weight

ggplot_data <- data.frame(cbind(time,species,pesticides))
ggplot_data <- cbind(ggplot_data,weight)
#View(ggplot_data)

ggplot_data$time <- factor(c(0,2,4,6,8,10))
grouped_data <- group_by(ggplot_data,pesticides,species,time)

ggplot_means <- summarise(grouped_data, mean=mean(weight))
ggplot_means

p <- ggplot(ggplot_data, aes(time,weight))
p <- p + geom_point(aes(colour = factor(pesticides), shape=factor(species)), size = 4) 
p


