require(ggplot2)
library(sqldf)
p <- read.csv('../data/Figure2E_G.csv')
#Figure2E
plot2E=ggplot(data=p,
              aes(y=(X_LWexp+X_SEexp),x=(A_LWexp+A_SEexp),
                  col=co))+
  geom_point(size=0.6)+
  xlim(0,10000)+
  ylim(0,500)+
  # stat_boxplot(geom = "errorbar", width=0.1,size=0.66)+
  # geom_boxplot(aes(fill=XCI),alpha=0.26,size=0.2)+
  # geom_jitter(shape=16,position = position_jitter(0.08),size=3)+
  scale_color_manual(values = c('other'='#C7C7C7',"♀SL1"='#4EA3E3'))+#
  geom_smooth(method = "lm",se=F)+
  # scale_fill_manual(values = c('LL'='#800080','SL'='#8175CB','LS'='#FF755F','SS'='#1E90FF'))+##FF755F
  # scale_color_manual(values = c('LL'='#800080','SL'='#8175CB','LS'='#FF755F','SS'='#1E90FF'))+
  # scale_color_gradient(low='#434343', high = '#009B95')+
  # scale_x_continuous(breaks=c(1:19),labels = c(1:18,expression(X)))+
  # ylim(0.5,0.7)+
  xlab("Autosomal RNA in SEXCI cells")+
  ylab('chrX RNA in SEXCI cells')+
  theme_classic()+
  guides(scale="none")+
  theme(
    legend.position = 'none',
    panel.background = element_rect(fill = "transparent",colour = "NA"),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    plot.background = element_rect(fill = "transparent",colour = NA),
    axis.line.x = element_line(color="black"),
    axis.line.y = element_line(color="black"),
    axis.text.x = element_text(size = 10,colour = 'black'),
    axis.text.y = element_text(size = 10,colour = 'black'),
    axis.title.x = element_text(size =10.5),
    axis.title.y = element_text(size = 13),
    plot.title = element_text(size = 9,hjust = 0.5),
    strip.text = element_text(face = "bold",size = rel(0.8)),
    strip.background = element_rect(colour = "black",size = 1),
    # axis.title=element_text(size=28,hjust = 0.5),
    legend.text = element_text(size = 8, color = "black"),
    legend.title = element_text(size = 0, color = "black")
  )

#Figure2F
plot2F=ggplot(data=p,
              aes(y=(X_LWexp),x=(A_LWexp),
                  col=co))+
  geom_point(size=0.6)+
  xlim(0,10000)+
  ylim(0,500)+
  # stat_boxplot(geom = "errorbar", width=0.1,size=0.66)+
  # geom_boxplot(aes(fill=XCI),alpha=0.26,size=0.2)+
  # geom_jitter(shape=16,position = position_jitter(0.08),size=3)+
  # scale_color_manual(values = col)+#
  scale_color_manual(values = c('other'='#C7C7C7',"♀SL1"='#4EA3E3'))+
  geom_smooth(method = "lm",se=F)+
  # scale_fill_manual(values = c('LL'='#800080','SL'='#8175CB','LS'='#FF755F','SS'='#1E90FF'))+##FF755F
  # scale_color_manual(values = c('LL'='#800080','SL'='#8175CB','LS'='#FF755F','SS'='#1E90FF'))+
  # scale_color_gradient(low='#434343', high = '#009B95')+
  # scale_x_continuous(breaks=c(1:19),labels = c(1:18,expression(X)))+
  # ylim(0.5,0.7)+
  xlab("LW autosomal RNA in SEXCI cells")+
  ylab('LW chrX RNA in SEXCI cells')+
  theme_classic()+
  guides(scale="none")+
  theme(
    legend.position = 'none',
    panel.background = element_rect(fill = "transparent",colour = "NA"),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    plot.background = element_rect(fill = "transparent",colour = NA),
    axis.line.x = element_line(color="black"),
    axis.line.y = element_line(color="black"),
    axis.text.x = element_text(size = 10,colour = 'black'),
    axis.text.y = element_text(size = 10,colour = 'black'),
    axis.title.x = element_text(size =10.5),
    axis.title.y = element_text(size = 13),
    plot.title = element_text(size = 9,hjust = 0.5),
    strip.text = element_text(face = "bold",size = rel(0.8)),
    strip.background = element_rect(colour = "black",size = 1),
    # axis.title=element_text(size=28,hjust = 0.5),
    legend.text = element_text(size = 8, color = "black"),
    legend.title = element_text(size = 0, color = "black")
  )

#Figure2G
plot2G=ggplot(data=p,
              aes(y=(X_LWexp),x=(A_SEexp),
                  col=co))+
  geom_point(size=0.6)+
  xlim(0,10000)+
  ylim(0,500)+
  # stat_boxplot(geom = "errorbar", width=0.1,size=0.66)+
  # geom_boxplot(aes(fill=XCI),alpha=0.26,size=0.2)+
  # geom_jitter(shape=16,position = position_jitter(0.08),size=3)+
  scale_color_manual(values = c('other'='#C7C7C7',"♀SL1"='#4EA3E3'))+
  # scale_color_manual(values = col)+#
  geom_smooth(method = "lm",se=F)+
  
  # scale_fill_manual(values = c('LL'='#800080','SL'='#8175CB','LS'='#FF755F','SS'='#1E90FF'))+##FF755F
  # scale_color_manual(values = c('LL'='#800080','SL'='#8175CB','LS'='#FF755F','SS'='#1E90FF'))+
  # scale_color_gradient(low='#434343', high = '#009B95')+
  # scale_x_continuous(breaks=c(1:19),labels = c(1:18,expression(X)))+
  # ylim(0.5,0.7)+
  xlab("SE autosomal RNA in SEXCI cells")+
  ylab('LW chrX RNA in SEXCI cells')+
  theme_classic()+
  guides(scale="none")+
  theme(
    legend.position = c(0.8,0.26),
    panel.background = element_rect(fill = "transparent",colour = "NA"),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    plot.background = element_rect(fill = "transparent",colour = NA),
    axis.line.x = element_line(color="black"),
    axis.line.y = element_line(color="black"),
    axis.text.x = element_text(size = 10,colour = 'black'),
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


p <- read.csv('../data/Figure2I.csv')
p$color <- paste(p$source,p$type,sep = '-')
cols=c('#1E90FF','#DC143C','#800080','darkgreen')
#Figure2I
Figure2I=ggplot(data=p,
                aes(x=window,y=scexp,
                    col=color))+
  # geom_hline()
  # geom_point(size=0.8)+
  geom_line(size=0.5)+
  # geom_hline(aes(yintercept=1.2), colour="blue", linetype="dashed",size=0.7)+
  # geom_hline(aes(yintercept=2.2), colour="#990000", linetype="dashed",size=0.7)+
  # geom_smooth(method='loess', alpha=0.1, size=1) +
  # geom_hline(aes(yintercept=2.8), colour="blue", linetype="dashed",size=0.7)+
  
  # stat_boxplot(geom = "errorbar", width=0.1,size=0.66)+
  # geom_boxplot(aes(fill=factor(type,levels = c('LWXCIgoing112','uninitialized112','SEXCIgoing112','SEXCI'))),alpha=0.26,size=0.66)+
  # geom_jitter(shape=16,position = position_jitter(0.45),size=0.6)+
  # geom_hline(aes(yintercept=1.2), colour="blue", linetype="dashed",size=0.7)+
  # geom_hline(aes(yintercept=2.2), colour="#990000", linetype="dashed",size=0.7)+
  # geom_hline(aes(yintercept=1.8), colour="#990000", linetype="dashed",size=0.7)+
# geom_hline(aes(yintercept=2.8), colour="blue", linetype="dashed",size=0.7)+
scale_color_manual(values = cols)+##FF755F
  # geom_line(aes(group=line), alpha=0.15,color='#04A472',position = position_jitter(0.3))+##109195" "#46B09B" "#7FCD9F" "#BBE7A5" "#F9FFAF"
  # scale_fill_manual(values = c('Autosomes'='#8175CB','chrX'='#FF755F'))+##FF755F
  # scale_color_gradient(low='red', high = '#009B95',name = 'SDAF')+#"#0B773C" "#04A472" "#70C5AC" "#ADE0D6" "#DBF2F1" "#F2FBFC"
  # scale_x_continuous(breaks=c(1:6),labels = c('LWvsSE','LWvsSE','LWvsSE','LWvsSE','SEvsLW','SEvsLW'))+
  # scale_y_continuous(limits = c(1,3),breaks=c(1,1.2,1.8,2,2.2,2.8,3),labels = c('1','1.2','1.8','2','1.8','1.2','1'))+
  # scale_y_continuous(breaks=c(1,1.2,1.8,2,2.2,2.8,3),labels = c('1','1.2','1.8','2','1.8','1.2','1'))+
  xlab("ChrX (Mb)")+
  ylab('Mean of Single-cell RNA')+
  theme_classic()+
  guides(fill="none")+
  theme(
    legend.position = c(0.8,0.8),
    panel.background = element_rect(fill = "transparent",colour = "NA"),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    plot.background = element_rect(fill = "transparent",colour = NA),
    axis.line.x = element_line(color="black"),
    axis.line.y = element_line(color="black"),
    axis.text.x = element_text(size = 9,colour = 'black'),
    axis.text.y = element_text(size = 8.5,colour = 'black'),
    axis.title.x = element_text(size =10.5),
    axis.title.y = element_text(size = 10.5),
    plot.title = element_text(size = 9,hjust = 0.5),
    strip.text = element_text(face = "bold",size = rel(1)),
    strip.background = element_rect(colour = "black",size = 1),
    # axis.title=element_text(size=28,hjust = 0.5),
    legend.key.height = unit(.12, "inches"),
    legend.key.width = unit(.15, "inches"),
    legend.text = element_text(size = 8, color = "black"),
    legend.title = element_text(size = 0, color = "black")
  )

p <- read.csv('../data/Figure2H.csv')
cols <-c('#1E90FF','#800080')
#Figure2H
plot2H=ggplot(data=p[which(p$window!='LWXCI'),],
              aes(x=factor(window,c(paste(seq(1.2,1.8,0.2),seq(1.4,2,0.2),sep = '~'),
                                    paste(seq(2,1.4,-0.2),seq(1.8,1.2,-0.2),sep = '~'),'SEXCI')),y=Aexp,
                  col=type,fill=type))+
  # geom_point(size=0.6)+
  # stat_boxplot(geom = "errorbar", width=0.1,size=0.66)+
  geom_boxplot(aes(fill=type,col=type),alpha=0.5,size=0.2)+
  scale_color_manual(values =cols)+
  scale_fill_manual(values =cols)+
  # geom_jitter(shape=16,position = position_jitter(0.08),size=3)+
  # scale_color_manual(values = c('LW_X/A'='#1E90FF','LW_X/LW_A'='#800080','LW_X/SE_A'='#DC143C'))+##FF755F
  # scale_fill_manual(values = c('LW_X/A'='#1E90FF','LW_X/LW_A'='#800080','LW_X/SE_A'='#DC143C'))+##FF755F
  
  # scale_fill_manual(values = c('LL'='#800080','SL'='#8175CB','LS'='#FF755F','SS'='#1E90FF'))+##FF755F
  # scale_color_manual(values = c('LL'='#800080','SL'='#8175CB','LS'='#FF755F','SS'='#1E90FF'))+
  # scale_color_gradient(low='#434343', high = '#009B95')+
  # scale_x_continuous(breaks=c(1:19),labels = c(1:18,expression(X)))+
  # ylim(0,0.2)+
  xlab("")+
  ylab('Autosomal RNA expression')+
  theme_classic()+
  guides(scale="none")+
  theme(
    legend.position = c(0.8,0.86),
    panel.background = element_rect(fill = "transparent",colour = "NA"),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    plot.background = element_rect(fill = "transparent",colour = NA),
    axis.line.x = element_line(color="black"),
    axis.line.y = element_line(color="black"),
    axis.text.x = element_text(size = 12,colour = 'black',angle = 45,hjust = 1,vjust = 1),
    axis.text.y = element_text(size = 11,colour = 'black'),
    axis.title.x = element_text(size =10.5),
    axis.title.y = element_text(size = 13),
    plot.title = element_text(size = 9,hjust = 0.5),
    strip.text = element_text(face = "bold",size = rel(0.8)),
    strip.background = element_rect(colour = "black",size = 1),
    # axis.title=element_text(size=28,hjust = 0.5),
    legend.key.height = unit(.12, "inches"),
    legend.key.width = unit(.15, "inches"),
    legend.text = element_text(size = 8, color = "black"),
    legend.title = element_text(size = 0, color = "black")
  )

p <- read.csv('../data/Figure2J.csv')
p$g <- paste(p$window,p$type,sep = '-')
#Figure2J
Figure2J=ggplot(data=p[which(p$window!='LWXCI'),],
             aes(x=factor(window,c(paste(seq(1.2,1.8,0.2),seq(1.4,2,0.2),sep = '~'),
                                   paste(seq(2,1.4,-0.2),seq(1.8,1.2,-0.2),sep = '~'),'SEXCI')),y=value,
                 col=type))+
  # geom_point(size=0.6)+
  # stat_boxplot(geom = "errorbar", width=0.1,size=0.66)+
  geom_boxplot(aes(fill=type),alpha=0.5,size=0.2)+
  # geom_jitter(shape=16,position = position_jitter(0.08),size=3)+
  scale_color_manual(values = c('LW_X/A'='#1E90FF','LW_X/LW_A'='#800080','LW_X/SE_A'='#DC143C'))+##FF755F
  scale_fill_manual(values = c('LW_X/A'='#1E90FF','LW_X/LW_A'='#800080','LW_X/SE_A'='#DC143C'))+##FF755F
  
  # scale_fill_manual(values = c('LL'='#800080','SL'='#8175CB','LS'='#FF755F','SS'='#1E90FF'))+##FF755F
  # scale_color_manual(values = c('LL'='#800080','SL'='#8175CB','LS'='#FF755F','SS'='#1E90FF'))+
  # scale_color_gradient(low='#434343', high = '#009B95')+
  # scale_x_continuous(breaks=c(1:19),labels = c(1:18,expression(X)))+
  ylim(0,0.2)+
  xlab("")+
  ylab('X-to-autosome ratio in RNA')+
  theme_classic()+
  guides(scale="none")+
  theme(
    legend.position = c(0.2,0.8),
    panel.background = element_rect(fill = "transparent",colour = "NA"),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    plot.background = element_rect(fill = "transparent",colour = NA),
    axis.line.x = element_line(color="black"),
    axis.line.y = element_line(color="black"),
    axis.text.x = element_text(size = 12,colour = 'black',angle = 45,hjust = 1,vjust = 1),
    axis.text.y = element_text(size = 11,colour = 'black'),
    axis.title.x = element_text(size =10.5),
    axis.title.y = element_text(size = 13),
    plot.title = element_text(size = 9,hjust = 0.5),
    strip.text = element_text(face = "bold",size = rel(0.8)),
    strip.background = element_rect(colour = "black",size = 1),
    # axis.title=element_text(size=28,hjust = 0.5),
    legend.text = element_text(size = 8, color = "black"),
    legend.title = element_text(size = 0, color = "black")
  )

p <- read.csv('../data/Figure2K.csv')
p1$g <- paste(p1$window,p1$type,sep = '-')
#Figure2K
Figure2K=ggplot(data=p1[which(p1$window!='LWXCI'),],
             aes(x=factor(window,c(paste(seq(1.2,1.8,0.2),seq(1.4,2,0.2),sep = '~'),
                                   paste(seq(2,1.4,-0.2),seq(1.8,1.2,-0.2),sep = '~'),'SEXCI')),y=value,
                 col=type))+
  # geom_point(size=0.6)+
  # stat_boxplot(geom = "errorbar", width=0.1,size=0.66)+
  geom_boxplot(aes(fill=type),alpha=0.5,size=0.2)+
  # geom_jitter(shape=16,position = position_jitter(0.08),size=3)+
  scale_color_manual(values = c('SE_X/A'='#1E90FF','SE_X/LW_A'='#800080','SE_X/SE_A'='#DC143C'))+##FF755F
  scale_fill_manual(values = c('SE_X/A'='#1E90FF','SE_X/LW_A'='#800080','SE_X/SE_A'='#DC143C'))+##FF755F
  
  # scale_fill_manual(values = c('LL'='#800080','SL'='#8175CB','LS'='#FF755F','SS'='#1E90FF'))+##FF755F
  # scale_color_manual(values = c('LL'='#800080','SL'='#8175CB','LS'='#FF755F','SS'='#1E90FF'))+
  # scale_color_gradient(low='#434343', high = '#009B95')+
  # scale_x_continuous(breaks=c(1:19),labels = c(1:18,expression(X)))+
  # ylim(0,0.2)+
  xlab("")+
  ylab('X-to-autosome ratio in RNA')+
  theme_classic()+
  guides(scale="none")+
  theme(
    legend.position = c(0.84,0.88),
    panel.background = element_rect(fill = "transparent",colour = "NA"),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    plot.background = element_rect(fill = "transparent",colour = NA),
    axis.line.x = element_line(color="black"),
    axis.line.y = element_line(color="black"),
    axis.text.x = element_text(size = 12,colour = 'black',angle = 45,hjust = 1,vjust = 1),
    axis.text.y = element_text(size = 11,colour = 'black'),
    axis.title.x = element_text(size =10.5),
    axis.title.y = element_text(size = 13),
    plot.title = element_text(size = 9,hjust = 0.5),
    strip.text = element_text(face = "bold",size = rel(0.8)),
    strip.background = element_rect(colour = "black",size = 1),
    # axis.title=element_text(size=28,hjust = 0.5),
    legend.text = element_text(size = 8, color = "black"),
    legend.title = element_text(size = 0, color = "black")
  )


