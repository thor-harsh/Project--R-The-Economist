library(data.table)
df<-fread('Economist_Assignment_Data.csv',drop = 1)
head(df)
pl<-ggplot(df,aes(x=CPI,y=HDI,color=Region))
pl2<-pl+geom_point(shape=1,size=3) +
  geom_smooth(aes(group=1),method='lm',formula=y~log(x),se=F,color='red')
pl2+geom_text(aes(label=Country))

pointsToLabel <- c("Russia", "Venezuela", "Iraq", "Myanmar", "Sudan",
                   "Afghanistan", "Congo", "Greece", "Argentina", "Brazil",
                   "India", "Italy", "China", "South Africa", "Spane",
                   "Botswana", "Cape Verde", "Bhutan", "Rwanda", "France",
                   "United States", "Germany", "Britain", "Barbados", "Norway", "Japan",
                   "New Zealand", "Singapore")

pl3 <- pl2 + geom_text(aes(label = Country), color = "gray20", 
                       data = subset(df, Country %in% pointsToLabel),check_overlap = TRUE)

pl4<-pl3+theme_economist_white()
pl5<-pl4 +scale_x_continuous("Corruption Perceptions Index",limits=c(0.9,10.5),breaks=1:10)
pl6<-pl5+scale_y_continuous("Human Development Index",limits=c(0:1),breaks=0:1)
pl7<-pl6 +ggtitle("Corruption and Human Development")
pl7
