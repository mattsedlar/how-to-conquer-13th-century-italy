deck <- c(rep(1,10),
          rep(2,8),
          rep(3,8),
          rep(4,8),
          rep(5,8),
          rep(6,8),
          rep(10,8), 
          rep(0,52)) # effects are represented by zero

player1 <- sample(deck, 10, replace = F)

simulations <- data.frame(sums=replicate(1000, sum(sample(deck,10,replace=F))))

require(ggplot2)
ggplot(simulations, aes(sums, fill=..count..)) + 
  geom_histogram(binwidth = 2) +
  scale_fill_gradient("Count", low="pink", high="red") +
  xlab("Total Mercenaries Dealt") +
  ylab("Count") +
  ggtitle("Distribution of Mercenaries Dealt During Simulations") +
  theme(panel.background=element_blank(),
        panel.grid.major=element_blank(),
        panel.grid.minor=element_blank(),
        panel.border=element_rect(color="grey",fill=NA),
        axis.title.x=element_text(vjust=1),
        axis.text=element_text(color="black"),
        plot.title=element_text(face="bold", size=15, vjust=2))

mean.simulations <- mean(simulations$sums)
