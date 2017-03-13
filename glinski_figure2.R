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
#p <- p + scale_x_continuous(breaks=c(0,2,4,6,8,10))
p <- p + geom_point(aes(color = factor(pesticides), shape=factor(species)))
p <- p + theme_bw()
p <- p + xlab("Dehydration Time (h)")
p <- p + ylab("Rehydration Rate (g/h)")
#http://docs.ggplot2.org/current/guides.html
p <- p + guides(colour = guide_legend("Pesticide"), shape = guide_legend("Species"))
#expression(italic('A. fowleri'))
#expression(italic('L. sphenocephala'))
p

jpeg(paste(dehyd.graphics,"glinski_fig2.jpg", sep=""),width = 6, height = 4, units = "in",res=300)
  p
dev.off()
#p <- p + geom_line(aes(color = factor(pesticides), size = 1))



