library(xlsx)
library(sqldf)
library(tidyr)
d <- read.xlsx('../data/Figure1H.xlsx',sheetIndex = 1)

d$activity.of.Xs[which(d$X_LW_exp  > d$X_SE_exp)] <- 4 - d$activity.of.Xs[which(d$X_LW_exp  > d$X_SE_exp)]

cols <- c("#1E90FF","#9370DB","#C66F62","#F08080","#990033",  
          "#667FC4","#9400D3","#800080","#5599AF","#87CEEB",
          "#335978","#FF6347","#4682B4")
plotB=ggplot(data=d,
             aes(y=activity.of.Xs,
                 x=factor(sample,levels = c('♀LS1','♀LS2','♀LS3','♀LS4','♀SL1','♀SL2','♀SL3','♂LS1','♂LS2','♂LS3','♂SL1','♂SL2','♂SL3')),
                 col=sample))+
  # geom_hline()
  geom_jitter(shape=16,position = position_jitter(0.48),size=0.6)+
  geom_hline(aes(yintercept=1.2), colour="blue", linetype="dashed",size=0.7)+
  geom_hline(aes(yintercept=2.2), colour="#990000", linetype="dashed",size=0.7)+
  geom_hline(aes(yintercept=1.8), colour="#990000", linetype="dashed",size=0.7)+
  geom_hline(aes(yintercept=2.8), colour="blue", linetype="dashed",size=0.7)+
  
  # stat_boxplot(geom = "errorbar", width=0.1,size=0.66)+
  # geom_boxplot(aes(fill=chr_type),alpha=0.26,size=0.66)+
  
  scale_color_manual(values =cols)+##FF755F
  # geom_line(aes(group=line), alpha=0.15,color='#04A472',position = position_jitter(0.3))+##109195" "#46B09B" "#7FCD9F" "#BBE7A5" "#F9FFAF"
  # scale_fill_manual(values = c('Autosomes'='#8175CB','chrX'='#FF755F'))+##FF755F
  # scale_color_gradient2(low='#8175CB',mid = , high = '#FF755F')+#"#0B773C" "#04A472" "#70C5AC" "#ADE0D6" "#DBF2F1" "#F2FBFC"
  # scale_color_gradient2(low='darkgreen',mid = '#023FA5', high = '#A93154',midpoint=0.5)+#'#8175CB','chrX'='#FF755F'
  # scale_x_continuous(breaks=c(1:6),labels = c('LWvsSE','LWvsSE','LWvsSE','LWvsSE','SEvsLW','SEvsLW'))+
  scale_y_continuous(breaks=c(1,1.2,1.8,2,2.2,2.8,3),labels = c('1','1.2','1.8','2','1.8','1.2','1'))+
  xlab("")+
  ylab('Inactivate LW chrX     Inactivate SE chrX')+
  theme_classic()+
  guides(scale="none")+
  theme(
    legend.position = 'none',
    panel.background = element_rect(fill = "transparent",colour = "NA"),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    plot.background = element_rect(fill = "transparent",colour = NA),
    axis.line.x = element_line(color="white"),
    axis.line.y = element_line(color="black"),
    axis.text.x = element_text(size = 12,colour = 'black'),
    axis.text.y = element_text(size = 11,colour = 'black'),
    axis.title.x = element_text(size =10.5),
    axis.title.y = element_text(size = 12.5),
    plot.title = element_text(size = 9,hjust = 0.5),
    strip.text = element_text(face = "bold",size = rel(0.405)),
    strip.background = element_rect(colour = "black",size = 1),
    # axis.title=element_text(size=28,hjust = 0.5),
    legend.text = element_text(size = 8, color = "black"),
    legend.title = element_text(size = 0, color = "black")
  )
pdf('Figure1H.pdf',width = 12.8,height = 3.8)
plotB
dev.off()


