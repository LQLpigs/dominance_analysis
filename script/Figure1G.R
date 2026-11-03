library(tidyr)
library(openxlsx)
library(dplyr)
library(ggplot2)
t <- read.xlsx('Figure1G.xlsx')
t$LSCmeanPlw <- (t$`♀LS1_PLW`+t$`♀LS2_PLW`+t$`♀LS3_PLW`+t$`♀LS4_PLW`+t$`♂LS1_PLW`+t$`♂LS2_PLW`+t$`♂LS3_PLW`)/7
t$SLCmeanPlw <- (t$`♂SL1_PLW` + t$`♀SL2_PLW` + t$`♂SL2_PLW`+t$`♀SL3_PLW`+t$`♂SL3_PLW`)/5
d1 <- t[which(t$direction == 'Higher in LSC'),]
d1 <- d1[order(d1$SLCmeanPlw,decreasing = F),]
d2 <- t[which(t$direction == 'Higher in SLC'),]
d2 <- d2[order(d2$SLCmeanPlw,decreasing = F),]
d <- rbind(d1,d2)
t <- t[, !names(t) %in% c(
  "P", "FDR", "direction", "LSCmeanPlw", "SLCmeanPlw"
), drop = FALSE]
p <- t %>%
  pivot_longer(
    cols = -genes,       # 除了 genes 列之外的所有列都进行转换
    names_to = "Condition", # 第二列的新列名（原来的列名）
    values_to = "Value"     # 第三列的新列名（对应的数值）
  )
anno <- c('SGCE','KCNQ1','IGF2','COL24A1','FOLH1B','WIF1','IGF2R','KLHDC10','ENSSSCG00000062252')
or <- data.frame(gene=d$genes,start_pos=c(1:nrow(d)))
anno <- or[which(or$gene %in% anno),]
anno$end_pos <- anno$start_pos+1
anno$label <- anno$gene
p$Condition <- gsub('_PLW','',p$Condition)
p <- as.data.frame(p)
pl<- ggplot(p, aes(x = factor(genes,levels = d$genes), 
                                          y = factor(Condition,
              levels = c("♂SL3","♂SL2","♂SL1","♀SL3", "♀SL2","♂LS3","♂LS2","♂LS1","♀LS4","♀LS3","♀LS2","♀LS1")), 
                                          fill = Value)) +
  geom_tile(color = NA) +  # border_color = NA
  scale_fill_gradientn(colours = c('#DC143C','#9400D3','#98FB98','#1E90FF'),name='Plw')+
  xlab("")+
  ylab('')+
  theme_classic()+
  geom_segment(data = anno,aes(x = start_pos, xend = end_pos, y = -0.3, yend = -0.7),  # y位置调整到热图下方
               inherit.aes = FALSE,
               size = 0.3,
               color = "black") +
  # geom_segment(data = anno,aes(x = start_pos, xend = end_pos, y = -0.7, yend = -0.7),  # y位置调整到热图下方
  #              inherit.aes = FALSE,
  #              size = 1,
  #              color = "black") +
  
  geom_text(data = anno,
            aes(x = (start_pos + end_pos)/2, 
                y = -1,  # 文字在线段下方
                label = label),
            inherit.aes = FALSE,
            size = 2,
            color = "black",
            angle = 90) +
  # guides(scale="none")+
  theme(
    # legend.position = c(0.88,0.32),
    panel.background = element_rect(fill = "transparent",colour = "NA"),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_blank(),
    plot.background = element_rect(fill = "transparent",colour = NA),
    axis.line.x = element_blank(),
    axis.line.y = element_blank(),
    axis.text.x = element_text(size = 0,colour = 'white'),
    axis.text.y = element_text(size = 13,colour = 'black'),
    axis.title.x = element_text(size =0),
    axis.title.y = element_text(size = 12),
    legend.key.height = unit(.12, "inches"),
    legend.key.width = unit(.12, "inches"),
    axis.ticks.x = element_blank(),
    # legend.position = "top",
    # plot.title = element_text(size = 9,hjust = 0.5)
    # strip.text = element_text(face = "bold",size = rel(0.6)),
    # strip.background = element_rect(colour = "black",size = 0.5)
    # axis.title=element_text(size=28,hjust = 0.5),
    legend.text = element_text(size = 9, color = "black"),
    legend.title = element_text(size = 11, color = "black")
  )
pdf('Figure1G.pdf',width = 7.6,height = 3.16)
pl   
dev.off()