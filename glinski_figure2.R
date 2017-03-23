library(dplyr)
library(ggplot2)

rehydrate
summary(rehydrate)

time <- rehydrate$time
rates <- as.numeric(as.character(rehydrate$rate))
species <- rehydrate$spp
pesticides <- rehydrate$pesticide
levels(pesticides)
levels(species)

ggplot_data <- data.frame(time,species,pesticides)
ggplot_data <- cbind(ggplot_data,rates)
summary(ggplot_data)
#View(ggplot_data)

ggplot_data$time <- factor(c(0,2,4,6,8,10))


p <- ggplot(ggplot_data, aes(time,rates))
p <- p + geom_point(aes(color = pesticides, shape=species))
p <- p + scale_color_manual('Pesticide',
                            labels= c('Atrazine','Chlorothalonil','Imidacloprid','Metolachlor','Triadimefon'), 
                            values = c("red2", "blue4", "forestgreen", "orange1", "magenta2"), 
                            breaks= c('Atrazine','Chlorothalonil','Imidacloprid','Metolachlor','Triadimefon'))
p <- p + scale_shape_manual('Species',
                            labels= c(expression(italic('A. fowleri                ')),
                                      expression(italic('L. sphenocephala'))),
                            values= c(16,17),
                            breaks= c('Fowlers toad','Leopard frog'))
p <- p + theme_bw()
p <- p + xlab("Dehydration Time (h)")
p <- p + ylab("Rehydration Rate (g/h)")
p <- p + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank())
p

jpeg(paste(dehyd.graphics,"glinski_fig2.jpg", sep=""),width = 6, height = 4, units = "in",res=300)
  p
dev.off()




