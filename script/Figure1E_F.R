setwd('E:\\XCI_sc_seq\\paper_and_figures')
p1 <- read.xlsx('../data/Figure1E.xlsx')
atac <- read.xlsx('../data/Figure1F.xlsx')
p1 <- p1[which(p1$genes %in% atac$genes),]
atac <- atac[which(atac$genes %in% p1$genes),]
p1$rnaplw <- p1$LW_expression/(p1$LW_expression + p1$SE_expression)
p1$Plw_DAS <- p1$LW_substitution/(p1$LW_substitution + p1$SE_substitution)
p2 <- sqldf('select genes,chr,start,end,SE_substitution,LW_substitution,cross,sum(LW_expression) as LW_expression,sum(SE_expression) as SE_expression 
            from p1 group by genes,chr,start,end,SE_substitution,LW_substitution,cross',drv = 'SQLite')
p2$rnaplw <- p2$LW_expression/(p2$LW_expression + p2$SE_expression)
p2$Plw_DAS <- p2$LW_substitution/(p2$LW_substitution + p2$SE_substitution)
Q <- sqldf("select ceil(Plw_DAS*10) as window,cross,count(distinct genes) as genes,avg(rnaPlw) as LWratio from p2
           where end-start<1000000 and chr<>'X' group by window,cross",drv = 'SQLite')
plotG=ggplot(data=Q,aes(x=factor(window,levels = c(1:10),labels = paste(seq(0,0.9,0.1),seq(0.1,1,0.1),sep = '~')),
                        y=LWratio,color=as.numeric(genes),shape=cross)) +
  # geom_boxplot(aes(fill=type.x),alpha=0,size=0.25)+
  geom_point(size=2.3)+
  # scale_color_gradient(low='blue',high = 'red')+
  geom_smooth(method = "lm", se=FALSE,
              formula = y ~ x,size=0.7,color='#98FB98') +
  # xlim(1,1000)+
  scale_color_gradient(low = "#91C7F2", high = "#0A2540",name='N_genes')+
  # geom_hline(aes(yintercept=0.5), colour="#1E90FF", linetype="dashed",size=0.7)+
  # scale_color_continuous(low='#800080', high= 'red',name='N_genes')+
  # scale_shape_manual(values = c('SLC'=16, 'LSC' = 17),name="")+
  # scale_x_continuous(breaks=c(1:14),labels = paste(seq(0,13000,1000),c(seq(1000,13000,1000),15700),sep = '~'))+
  ylab("Plw in RNA expression")+
  xlab('Fraction of LW genomic substitutions')+
  theme_classic()+
  # guides(scale="none")+
  theme(
    legend.position = 'none',
    panel.background = element_rect(fill = "transparent",colour = "NA"),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    plot.background = element_rect(fill = "transparent",colour = NA),
    axis.line.x = element_line(color="black"),
    axis.line.y = element_line(color="black"),
    axis.text.x = element_text(size = 9.3,colour = 'black',angle = 45,hjust = 1,vjust = 1),#
    axis.text.y = element_text(size = 10,colour = 'black'),
    axis.title.x = element_text(size =12),
    axis.title.y = element_text(size = 12),
    # plot.title = element_text(size = 9,hjust = 0.5)
    strip.text = element_text(face = "bold",size = rel(1)),
    # strip.background = element_rect(colour = "black",size = 0.6),
    # axis.title=element_text(size=28,hjust = 0.5),
    legend.key.height = unit(.1, "inches"),
    legend.key.width = unit(.12, "inches"),
    legend.text = element_text(size = 10, color = "black"),
    legend.title = element_text(size = 10, color = "black")
  )
pdf('Figure1E.pdf',width = 3.4,height = 3.2)
plotG
dev.off()

atac$rnaplw <- atac$LW_atac/(atac$LW_atac + atac$SE_atac)
atac$Plw_DAS <- atac$LW_substitution/(atac$LW_substitution + atac$SE_substitution)
Q <- sqldf("select ceil(Plw_DAS*10) as window,cross,count(distinct genes) as genes,avg(rnaPlw) as LWratio from atac
           where end-start<1000000 and chr<>'X' group by window,cross",drv = 'SQLite')

plotG=ggplot(data=Q,aes(x=factor(window,levels = c(1:10),labels = paste(seq(0,0.9,0.1),seq(0.1,1,0.1),sep = '~')),
                        y=LWratio,color=as.numeric(genes),shape=cross)) +
  # geom_boxplot(aes(fill=type.x),alpha=0,size=0.25)+
  geom_point(size=2.3)+
  # scale_color_gradient(low='blue',high = 'red')+
  geom_smooth(method = "lm", se=FALSE,
              formula = y ~ x,size=0.7,color='#98FB98') +
  # xlim(1,1000)+
  # geom_hline(aes(yintercept=0.5), colour="#1E90FF", linetype="dashed",size=0.7)+
  scale_color_gradient(low = "#91C7F2", high = "#0A2540",name='N_genes')+
  # scale_color_continuous(low='#800080', high= 'red',name='N_genes')+
  # scale_shape_manual(values = c('SLC'=16, 'LSC' = 17),name="")+
  # scale_x_continuous(breaks=c(1:14),labels = paste(seq(0,13000,1000),c(seq(1000,13000,1000),15700),sep = '~'))+
  ylab("Plw in chromatin accessibility")+
  xlab('Fraction of LW genomic substitutions')+
  theme_classic()+
  # guides(scale="none")+
  theme(
    legend.position = c(0.12,0.68),
    panel.background = element_rect(fill = "transparent",colour = "NA"),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    plot.background = element_rect(fill = "transparent",colour = NA),
    axis.line.x = element_line(color="black"),
    axis.line.y = element_line(color="black"),
    axis.text.x = element_text(size = 9.3,colour = 'black',angle = 45,hjust = 1,vjust = 1),#
    axis.text.y = element_text(size = 10,colour = 'black'),
    axis.title.x = element_text(size =12),
    axis.title.y = element_text(size = 12),
    # plot.title = element_text(size = 9,hjust = 0.5)
    strip.text = element_text(face = "bold",size = rel(1)),
    # strip.background = element_rect(colour = "black",size = 0.6),
    # axis.title=element_text(size=28,hjust = 0.5),
    legend.key.height = unit(.1, "inches"),
    legend.key.width = unit(.12, "inches"),
    legend.text = element_text(size = 10, color = "black"),
    legend.title = element_text(size = 10, color = "black")
  )
pdf('Figure1F.pdf',width = 3.4,height = 3.2)
plotG
dev.off()