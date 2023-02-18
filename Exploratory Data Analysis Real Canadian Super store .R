#View data
View(Coursework)

#To get structure of dat
str(Coursework)
#check for missing variables
is.na.data.frame(Coursework)
is.na(Coursework)
sum(is.na.data.frame(Coursework))
Superstore<-na.omit(Coursework)
sum(is.na.data.frame(Superstore))
 
#To remove some variables from console
rm(mydata)
rm(mydata.cor)
rm(countsR)

#summary statistics
summary(Superstore)
#Summarizing numeric variables
summary(Superstore$Sales)
summary(Superstore$Quantity)
summary(Superstore$Profit)
#Variance and Standard Deviation 
var(Superstore$Sales)
var(Superstore$Quantity)
var(Superstore$Profit)
sd(Superstore$Sales)
sd(Superstore$Quantity)
sd(Superstore$Profit)

#Calculate sum of some key variables
sum(Superstore$Sales)
sum(Superstore$Quantity)
sum(Superstore$Profit)

#Plots
plot(Superstore$Sales)
plot(Superstor$Profit)

#Studying Ship mode Bar chart
library(ggplot2)
table(Superstore$Ship.Mode)
ggplot(data=Superstore,aes(x=Ship.Mode,fill=Ship.Mode))+geom_bar(width=0.5)

#Frequecy distribution of qty orderes
#Studying Segment
table(Superstore$Segment)
ggplot(data=Superstore,aes(x=Segment,fill=Segment))+geom_bar(width=0.5)

#Studying Region 

ggplot(data=Superstore,aes(x=Region,fill=Region))+geom_bar(width=0.5)

#Profit across different region
ggplot() + geom_bar(data = Superstore, aes(x = Region, y = Profit, fill=Region), stat = "identity") + theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))

#Sales and region
ggplot(data=Superstore,aes(x=Region,y=Sales,fill=Region))+geom_bar(stat="identity",width=0.5)
#Studying profitability and sales acroos different categories using tree maps
install.packages("treemap")
library(treemap)
treemap(Superstore,index = c("Category","Sub.Category"),vSize = "Sales",vColor = "Profit",type="value",palette="RdYlGn",range=c(-40000,300000),mapping=c(-20000,100000,300000),title="Profit | Sales Treemap For Product Categories",fontsize.labels=c(15,10),align.labels = list(c("centre","centre"),c("left","top")))
#To check for relationship between variables 
install.packages("corrplot")
library(corrplot)
mydata<-Superstore[, c(18,19,21,22)]
mydata.cor=cor(mydata)
mydata.cor
corrplot(mydata.cor)

#Regression Model
Profit_model <-lm(Profit ~ Sales + Quantity+ Discount, dat=Superstore )
summary(Profit_model)

install.packages("olsrr")
library(olsrr)

#Check for Homoskedasticity
ols_plot_resid_fit(Profit_model)

# For residual histogram
ols_plot_resid_hist(Profit_model)

# Statistics for shapiro wilsk test
ols_test_normality(Profit_model)





