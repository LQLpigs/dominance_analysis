
result <- read.csv('../data/Figure1J.csv')
intra <- result[which(result$genea_chr ==result$geneb_chr),]
p1 <- rbind(data.frame(cross=intra$cross,chr=intra$genea_chr,value=intra$SE_SE_obser - intra$SE_SE_exp,PPIs='SE-SE'),
            data.frame(cross=intra$cross,chr=intra$genea_chr,value=intra$LW_SE_obser - intra$LW_SE_exp,PPIs='LW-SE'),
            data.frame(cross=intra$cross,chr=intra$genea_chr,value=intra$SE_LW_obser - intra$SE_LW_exp,PPIs='SE-LW'),
            data.frame(cross=intra$cross,chr=intra$genea_chr,value=intra$LW_LW_obser - intra$LW_LW_exp,PPIs='LW-LW'))
p1$g <- paste(p1$PPIs,p1$chr,sep = '-')
cols=c('#1E90FF','#92CCEA','#7E007F','#0C6504')#1E90FF','SEXCI'='#800080','MLSC'='#DC143C','MSLC'='#9370DB'
plotB=ggplot(data=p1[which(p1$cross=='SLC'),],
             aes(x=factor(chr,levels = c(1:18),labels = paste('chr',c(1:18),sep = '')),y=value,
                 col=PPIs,group=g))+
  geom_boxplot(aes(fill=PPIs),alpha=0.26,size=0.66)+
  scale_color_manual(values =cols)+
  scale_fill_manual(values =cols)+
  # ylim(0.55,0.75)+
  xlab("")+
  ylab("observation-expectation")+
  theme_classic()+
  # guides(color="none")+
  theme(
    # legend.position = 'none',
    panel.background = element_rect(fill = "transparent",colour = "NA"),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    plot.background = element_rect(fill = "transparent",colour = NA),
    axis.line.x = element_line(color="black"),
    axis.line.y = element_line(color="black"),
    axis.text.x = element_text(size = 12,colour = 'black',angle = 45,hjust = 1,vjust = 1),
    axis.text.y = element_text(size = 11,colour = 'black'),
    axis.title.x = element_text(size =11.5,angle = 45,hjust = 1,vjust = 1),
    axis.title.y = element_text(size = 13),
    plot.title = element_text(size = 9,hjust = 0.5),
    strip.text = element_text(face = "bold",size = rel(0.8)),
    strip.background = element_rect(colour = "black",size = 1),
    legend.key.height = unit(.12, "inches"),
    legend.key.width = unit(.12, "inches"),
    # axis.title=element_text(size=28,hjust = 0.5),
    legend.text = element_text(size = 10, color = "black"),
    legend.title = element_text(size = 11, color = "black")
  )
pdf('Figure1J.pdf',width = 10,height = 3)
plotB
dev.off()
