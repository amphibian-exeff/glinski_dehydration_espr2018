jpeg(paste(dehyd.graphics,"glinski_fig1.jpg", sep=""),width = 5, height = 8, units = "in",res=300)
  par(mfrow=c(5,1), 
      oma = c(5,3,0,0) + 0.1, #outer margins
      mar = c(0,0,1,1) + 0.1)
    #atrazine
    time <- dehyd.amphib.atrazine.atrazineD$time
    conc <- dehyd.amphib.atrazine.atrazineD$conc
    species <- dehyd.amphib.atrazine.atrazineD$species
    boxplot(conc ~ species + time, main = "Atrazine+D", xaxt='n', 
                    ylab="ug/g", col=c("lightblue", "red"))
  
  #imidacloprid
  time <- dehyd.amphib.imid.imid$time
  conc <- dehyd.amphib.imid.imid$conc
  species <- dehyd.amphib.imid.imid$species
  boxplot(conc ~ species + time, main = "Imidacloprid", xaxt='n', 
                  ylab="ug/g", col=c("lightblue", "red"))
  
  
  #chlorothalonil
  time <- dehyd.amphib.chloro.chloromet$time
  conc <- dehyd.amphib.chloro.chloromet$conc
  species <- dehyd.amphib.chloro.chloromet$species
  boxplot(conc ~ species + time, main = "Chlorothalonil Metabolite", xaxt='n', 
          ylab="ug/g", col=c("lightblue", "red"))
  
  
  
  #metolachlor
  time <- dehyd.amphib.metol.metolD$time
  conc <- dehyd.amphib.metol.metolD$conc
  species <- dehyd.amphib.metol.metolD$species
  boxplot(conc ~ species + time, main = "Metolachlor+D", xaxt='n', 
                   ylab="ug/g", col=c("lightblue", "red"))
  
  #triadimefon
  time <- dehyd.amphib.tdn.tdnD$time
  conc <- dehyd.amphib.tdn.tdnD$conc
  species <- dehyd.amphib.tdn.tdnD$species
  boxplot(conc ~ species + time, main = "Triadimefon+D", xlab = "Dehydration Time (hrs)", 
          ylab="ug/g", col=c("lightblue", "red"))
  legend("topright", inset=.05, title="Species",
         c("B. fowleri","L. pipiens"),fill=c("lightblue", "red"), horiz=FALSE)
  #outer y axis
  mtext(text="ug/g",side=2,line=2,outer=TRUE,cex=1.05)

  #outer x axis
  mtext(text="Dehydration Hours",side=1,line=3,outer=TRUE,cex=1.05)
dev.off()
