### INTRODUÇÃO

No método clássico de regressão uma relação linear é assumida entre uma variável dependente *y* e variáveis independentes ou exógenas *x*. Além disso, pressupõe-se que desvios desta relação (termo de erro) seguem um processo aleatório em torno de zero. Para *n* observações de *y* (denotado por ![equation](http://www.sciweavers.org/tex2img.php?eq=y_%7Bi%7D%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0) para *i=1,...,n* e x (denotado por ![equation](http://www.sciweavers.org/tex2img.php?eq=x_%7Bi%7D&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0) para *i=1,...n*) pode-se escrever formalmente como:

![equation](http://www.sciweavers.org/tex2img.php?eq=%20y_%7Bi%7D%20%20%3D%20a%20%2Bbx_%7Bi%7D%2B%20%5Cvarepsilon_%7Bi%7D&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0)

O modelo de regressão pode estimar os parâmetros desconhecidos pelo método de mínimos quadrados. 

Suponha que a variável dependente representa o log do número mensal de condutores mortos ou gravemente feridos (KSI) no Reino Unido (UK) no período de Janeiro de 1969 a Dezembro de 1984 (192 observações). Além disso, suponha que a variável independente seja uma sequencia de 1 a 192 (índice temporal da série). [R Code](https://github.com/hudsonchaves/EconometriaIII/blob/master/rcode.R) permite gerar o gráfico da série temporal, estimar os parâmetros da equação, avaliar os resíduos ao longo do tempo e diagnósticos do ajuste. Abaixo, o código que permite obter a base de dados:

```s
# data(package =.packages(all.available = TRUE)) # descobrir os bancos de dados do R
base = data.frame(UKDriverDeaths) # transformar em data frame o banco que quero
base = log(base) # logaritmo da série
colnames(base) = "logKSI" # renomear a coluna
head(base) # ver as primeiras observações da série
t = 1:dim(base)[1] # índice temporal da série
```

Por meio do gráfico do log de KSI contra o tempo juntamente com a linha de regressão estimada, é possível observar uma tendência negativa e significante.
Contudo, uma hipótese importante do modelo clássico de regressão linear não é considerado, pois as observações *y* depois de corrigidas pelo intercepto e a variável exógena *x* são assumidas serem independentes uma das outras. No presente exemplo essas observações não são independentes, pois estão relacionadas ao longo do tempo dado o padrão sistemático na série. Os resíduos deveriam ser aleatoriamente distribuídos.

Uma ferramenta útil para investigar a aleatoriedade de um conjunto de observações é o correlograma que é um gráfico contendo correlações entre uma série observada e a mesma série defasada *k* pontos. Dado que as correlações são computadas entre uma variável e ela mesma, chamamos de autocorrelação.

O correlograma dos resíduos de uma série independentemente distribuída é formado de zeros. A independência entre os resíduos normalmente distribuídos é refletida do fato de que todas as autocorrelações são próximas a zero e não excedem o intervalo de confiança. 

Em contraste, o correlograma dos resíduos do ajuste do log de KSI contra a variável temporal mostra uma grande quantidade de autocorrelações significativamente diferentes de zero. 

Em princípio não há nada de errado em ajustar um modelo clássico de regressão aos dados para obter uma ideia aproximada da tendência linear na série. Os testes F e t são baseados sobre a hipótese de que os erros são aleatoriamente distribuídos, uma hipótese que é claramente violada neste caso.

Quando a autocorrelação de lag 1 dos resíduos é positiva e significativamente diferente de zero, um resíduo positivo tende a ser seguido por um ou mais outros resíduos positivos e um resíduo negativo tende a ser seguido por um ou mais outros resíduos negativos. Assim, a variância do erro usada por testes estatísticos é seriamente subestimada neste caso. Isso por sua vez conduz a uma superestimação de F ou t e portanto, conclusões excessivamente otimistas sobre a relação linear entre a variável dependente e o tempo. 

Por outro lado, quando a autocorrelação de lag 1 dos resíduos é negativa e significativamente diferente de zero, então um resíduo positivo tende a ser seguido por um resíduo negativo e virse-versa. Neste caso a variância do erro para os testes estatísticos padrões é seriamente superestimada, conduzindo a subestimação de F e t. Portanto, conclusões excessivamente pessimistas sobre a relação linear entre a variável dependente e o tempo são feitas. 

Supõe-se que propriedades dinâmicas não podem ser observadas diretamente dos dados. O processo dinâmico não observado no tempo *t* é conhecido como *estado* da série temporal. O estado de uma série temporal pode consistir de vários componentes, que são introduzidos um a um nos capítulos seguintes do livro. 

Nos capítulos 2, 3 e 4 os componentes apresentados são adequados para obter uma adequada descrição de uma série temporal. Esses componentes são: nível, inclinção e sazonalidade.

Nos capítulos 5 e 6 os componentes discutidos são úteis para encontrar explicações para o desenvolvimento subjacente da série. Esses componentes são variáveis explicativas e de intervenção. 

O capítulo 7 apresenta análises onde componentes descritivos e explicativos são combinados em um único modelo. 

Uma terceira e importante aplicação da análise de séries temporais é a habilidade para fazer previsões. Este aspecto é discutido no capítulo 8 que também apresenta uma notação geral para modelos de estado espaço univariados e maneiras alternativas de lidar com variáveis explicativas e de intervenção. Além disso, intervalos de confiança, estados ajustados, erros de previsão um passo à frente e suas variâncias, testes de diagnóstico e o tratamento de *missing observations* em métodos de estado espaço são discutidos neste capítulo. 

O capítulo 9 introduz a análise multivariada de dados de séries temporais. No capítulo 10 uma básica introdução dos modelos ARIMA (Box-Jenkins) é apresentada, permitindo assim, uma avaliação do merito dos modelos ARIMA e Estado Espaço para a análise de séries temporais.

