#!/usr/bin/Rscript

code <- colorRampPalette(c("blue", "orange", "red"),space = "rgb")(100)

write.table(code, file="color.txt", quote=FALSE, col.names=FALSE, row.names=FALSE)

library("RColorBrewer")
#brewer.pal.info
display.brewer.pal(11,"PiYG")
data<-brewer.pal(11,"PiYG")
write.table(rev(data), file="color2.txt", quote=FALSE, col.names=FALSE, row.names=FALSE)
