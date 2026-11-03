library(ggplot2)
p <- read.csv('../data/Figure2C.csv')
cols=c("#DC143C","#9370DB","darkgreen","#F08080","#1E90FF",  
       "#A0522D",
       "purple")
plotB=ggplot(data=p[-which(p$cell_type %in% c('B cells','Podocytes','Plasma cells','Ureteric epithelial cells','Microglia',
                                              'Cardiomyocytes')),],
             aes(x=factor(cell_type,levels = c('Endothelial cells','neurons','Erythroid cells','Oligodendrocytes','Hepatocytes',
                                               'Hepatic stellate cells','Proximal tubule cells','Retinal ganglion cells','T cells',"Loop of Henle's cells",'Microglia')),y=cell_entropy,
                 col=sample))+
  # geom_point(size=0.6)+
  # stat_boxplot(geom = "errorbar", width=0.1,size=0.66)+
  # geom_violin(aes(fill=sample),alpha=0.26,size=0.2)+
  geom_boxplot(aes(fill=sample),
               alpha=0.5,size=0.2)+
  # geom_jitter(shape=16,position = position_jitter(0.08),size=3)+
  # scale_color_manual(values = c('LWXCI'='#1E90FF','SEXCI'='#800080','MLSC'='#DC143C','MSLC'='#9370DB','uninitiated-XCI'='#87CEEB'))+##FF755F
  scale_color_manual(values =cols)+
  scale_fill_manual(values =cols)+
  # scale_fill_manual(values = c('LL'='#800080','SL'='#8175CB','LS'='#FF755F','SS'='#1E90FF'))+##FF755F
  # scale_color_manual(values = c('LL'='#800080','SL'='#8175CB','LS'='#FF755F','SS'='#1E90FF'))+
  # scale_color_gradient(low='#434343', high = '#009B95')+
  # scale_x_continuous(breaks=c(1:19),labels = c(1:18,expression(X)))+
  # ylim(0.55,0.75)+
  xlab("")+
  ylab('Entropy')+
  theme_classic()+
  # guides(fill="none")+
  theme(
    # legend.position = 'none',
    panel.background = element_rect(fill = "transparent",colour = "NA"),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    plot.background = element_rect(fill = "transparent",colour = NA),
    axis.line.x = element_line(color="black"),
    axis.line.y = element_line(color="black"),
    axis.text.x = element_text(size = 10,colour = 'black',angle = 45,hjust = 1,vjust = 1),
    axis.text.y = element_text(size = 10,colour = 'black'),
    axis.title.x = element_text(size =10.5),
    axis.title.y = element_text(size = 13),
    plot.title = element_text(size = 9,hjust = 0.5),
    strip.text = element_text(face = "bold",size = rel(0.8)),
    strip.background = element_rect(colour = "black",size = 1),
    legend.key.height = unit(.12, "inches"),
    legend.key.width = unit(.12, "inches"),
    # axis.title=element_text(size=28,hjust = 0.5),
    legend.text = element_text(size = 8, color = "black"),
    legend.title = element_text(size = 0, color = "black")
  )
pdf('Figure2C.pdf',width = 8,height = 3)
plotB
dev.off()