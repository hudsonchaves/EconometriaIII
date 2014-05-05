
########
###  BASE DE DADOS 
########
data.8 = data.frame(UKDriverDeaths) # transformar em data frame o banco que quero
data.8 = log(base) # logaritmo da série
colnames(data.8) = "logKSI" # renomear a coluna
data.8 = ts(data.8, start= c(1969), frequency=12)
intervention = rep (1, dim(data.8)[1])
intervention[1:169] = 0
intervention = ts(intervention, start=c(1969), frequency=12)
dim(data.8)


data.1 <- ts(data.1, start = c(1969),frequency=12)
intervention <- rep(1,dim(data.1)[1])
intervention[1:169]<- 0
intervention <- ts(intervention, start = c(1969),frequency=12)
prices <- (read.table("data/C8/logUKpetrolprice.txt",skip=1))
prices <- ts(prices, start = c(1969),frequency=12)
data.2 <- log(read.table("data/C8/NorwayFinland.txt",skip=1))
data.2 <- data.2[,2,drop=F]
colnames(data.2) <- "logNorFatalities"
data.2 <- ts(data.2 , start = c(1970,1))
data.3 <- log(read.table("data/C8/NorwayFinland.txt",skip=1))
data.3 <- data.3[,3,drop=F]
colnames(data.3) <- "logFinFatalities"
data.3 <- ts(data.3 , start = c(1970,1))