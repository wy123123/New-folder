data12=read.csv("C:/Users/Lovebonito/Downloads/201412/MF12.csv")
data11=read.csv("C:/Users/Lovebonito/Downloads/201411/MF11.csv")
data10=read.csv("C:/Users/Lovebonito/Downloads/201410/MF10.csv")
data09=read.csv("C:/Users/Lovebonito/Downloads/201409/MF09.csv")
data08=read.csv("C:/Users/Lovebonito/Downloads/201408/MF08.csv")
data07=read.csv("C:/Users/Lovebonito/Downloads/201407/MF07.csv")
data06=read.csv("C:/Users/Lovebonito/Downloads/201406/MF06.csv")
data05=read.csv("C:/Users/Lovebonito/Downloads/201405/MF05.csv")
data04=read.csv("C:/Users/Lovebonito/Downloads/201404/MF04.csv")
data03=read.csv("C:/Users/Lovebonito/Downloads/201403/MF03.csv")
data02=read.csv("C:/Users/Lovebonito/Downloads/201402/MF02.csv")
data01=read.csv("C:/Users/Lovebonito/Downloads/201401/MF01.csv")
library(data.table)
data_MF=data.table(rbind(data12,data11,data10,data09,data08,data07,data06,data05,data04,data03,data02,data01))
table(data_MF$Category)
size=data_MF[,sum(Quantity),by=c("temp3","colour","Size")]
write.csv(size,file="size.csv")
size_1=data_MF[,sum(Quantity),by=c("temp3","Size")]
write.csv(size_1,file="size_1.csv")
size_2=size[,sum(V1),by=c("temp3","colour")]
t=rep(NA,length(size$V1))
for(i in 1 : length(size$V1)){
  for(s in 1 : length(size_2$V1)){
  if(size$temp3[i]==size_2$temp3[s]&size$colour[i]==size_2$colour[s])
    t[i]=size_2$V1[s]
  }
}
size_3=cbind(size,unlist(t))
write.csv(size_3,file="size_3.csv")
