# arquivo fonte: An Introduction to State Space Time Series Analysis - Summary with r code
# http://www.ssfpack.com/CKbook.html (link do site do livro com código Ox)

########
###  BASE DE DADOS E PRIMEIROS GRÁFICOS DA SÉRIE
########

# data(package =.packages(all.available = TRUE)) # descobrir os bancos de dados do R
base = data.frame(UKDriverDeaths) # transformar em data frame o banco que quero
base = log(base) # logaritmo da série
colnames(base) = "logKSI" # renomear a coluna
head(base) # ver as primeiras observações da série
t = 1:dim(base)[1] 
fit = lm(base$logKSI~t) # ajuste da série em função do vetor de tendência
error.var = round(summary(fit)$sigma^2,8) # variância do erro
f.stat = round(summary(fit)$fstatistic[1],8) # estatística F


plot(ts(base$logKSI), type="p", col="darkgrey", xlab="", ylab="log KSI", pch=3, 
     cex=0.5,cex.lab=0.8,cex.axis=0.7, xlim=c(0,200))
abline(coef = coef(lm(base$logKSI~t)), col="blue",lwd=2, lty=2)
legend("topright", leg=c("log UK drivers KSI against time(in months)"
                         ,"regression line"),cex=0.6, lty=c(0,2),
       col=c("darkgrey","blue"),pch=c(3,NA),bty="y",horiz=T)

plot(ts(base$logKSI),ylab="",xlab="",xlim=c(0,200),col="darkgrey")

plot(ts(residuals(fit)),ylab="",xlab="",xlim=c(0,200),col="darkgrey",lty=2)
abline(h=0)


#########
###  DIAGNÓSTICO
#########

random.series = rnorm(dim(base)[1])
acf(c(random.series),15,main="")

residuals=residuals(fit)
acf(c(residuals),15,main="")

# O ponto de ilustrar todos esses gráficos são: Inferência baseada sobre Mínimos Quadrados
# Ordinários gera problemas quando os resíduos são autocorrelacionados. Em um processo de 
# autocorrelação, a variância do modelo de MQO são subestimadas ou sobreestimadas em relação
# à verdadeira variância. Em alguns casos, as estatísticas t e F são grandes e assim, você
# tende a ser mais otimista sobre o modelo. Em outros casos, as estatísticas t e F são menores
# do que seus verdadeiros valores e assim você tende a ser mais pessimista sobre o modelo.


########
###  THE LOCAL LEVEL MODEL
########

data.1 = log(read.table("C:/Users/Hudson/SkyDrive/Documentos/Hudson/Doutorado - UFRGS/Econometria III/OxCodeIntroStateSpaceBook/Chapter_1/UKdriversKSI.txt",skip=1))
colnames(data.1) = "logKSI"
data.1 = ts(data.1, start=c(1969), frequency=12)
data.2 = log (read.table("C:/Users/Hudson/SkyDrive/Documentos/Hudson/Doutorado - UFRGS/Econometria III/OxCodeIntroStateSpaceBook/Chapter_1/NorwayFinland.txt",skip=1))
data.2 = data.2[,2,drop=F]
colnames(data.2) = "logNorFatalities"
data.2 = ts(data.2, start=c(1970,1))

### DETERMINISTIC LEVEL

fit = lm(data.1[,1]~1)
res = residuals(fit)
coefs = round(as.numeric(coef(fit)),8)
error.var = round(summary(fit)$sigma^2,8)

plot.ts(c(data.1), col = "darkgrey", xlab="",ylab = "log KSI",pch=3,cex=0.5,
        cex.lab=0.8,cex.axis=0.7,xlim=c(0,200))
abline(h=coefs[1] , col = "blue", lwd = 2, lty=2)
legend("topright",leg = c("log UK drivers KSI",
                            " deterministic level"),cex = 0.6,
         lty = c(1, 2),col = c("darkgrey","blue"),
         pch=c(3,NA), bty = "y", horiz = T)

# componente irregular 
plot(ts(residuals(fit)),ylab="",xlab="",xlim = c(0,200), col = "darkgrey",lty=2)
abline(h=0)


#### diagnóstico

# teste de normalidade  

shapiro.test(res) # passou

# independência

Box.test(res, lag=15, type="Ljung") # falhou (resíduos são autocorrelacionados)
sapply(1:20,function(1){Box.test(res,lag=l, type="Ljung-Box")$p.value})



# 



