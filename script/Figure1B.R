library(ggrepel)
require(ggplot2)
library(dplyr)

plot <- read.csv('../data/Figure1B.csv')
centers <- plot %>%
  group_by(cell_type) %>%
  summarize(tSNE_1 = median(tSNE_1), 
            tSNE_2 = median(tSNE_2))

colour=c("#1E90FF","#9370DB","#98FB98","#F08080","#4D8AFE",  
         "#7B68EE","#9400D3","#800080","#A0522D","#87CEEB",
         "#D64E87","#FF6347","#4682B4","#F0E68C","#DEB887",
         "#9932CC")

plot1 <- ggplot(plot,aes(x=tSNE_1,y=tSNE_2,fill==factor(cell_type,levels = unique(plot$cell_type),labels = c(1:16)),
                         color=factor(cell_type,levels = unique(plot$cell_type),labels = c(1:16))))+
  geom_point(size=0.6)+
  geom_text(data = centers, 
            aes(label = factor(cell_type,levels = unique(plot$cell_type),labels = c(1:16))), 
            color = "black", size = 4) +
  scale_fill_manual(values=colour) +
  scale_color_manual(values=colour) +
  theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        # legend.position = c(0.8,0.29),
        panel.background = element_rect(fill = "transparent",colour = "NA"),
        plot.background = element_rect(fill = "transparent",colour = NA),
        axis.line.x = element_line(color="black"),
        axis.line.y = element_line(color="black"),
        axis.text.x = element_text(size = 10,colour = 'black'),
        axis.text.y = element_text(size = 10,colour = 'black'),
        axis.title.x = element_text(size =12),
        axis.title.y = element_text(size = 12),
        plot.title = element_text(size = 9,hjust = 0.5),
        strip.text = element_text(face = "bold",size = rel(1)),
        strip.background = element_rect(colour = "black",size = 1),
        # axis.title=element_text(size=28,hjust = 0.5),
        legend.key.height = unit(.12, "inches"),
        legend.key.width = unit(.15, "inches"),
        legend.text = element_text(size = 10, color = "black"),
        legend.title = element_text(size = 0, color = "black"))
pdf('Figure1B.pdf',height = 5,width = 6.2)
plot1
dev.off() 