### INTRODUÇÃO

No método clássico de regressão uma relação linear é assumida entre uma variável dependente *y*, e variáveis independentes ou exógenas *x*. Desvios desta relação são assumidos seguirem um processo aleatório em torno de zero. O tradicional modelo de regressão para *n* observações de *y* (denotado por ![equation](http://www.sciweavers.org/tex2img.php?eq=y_%7Bi%7D%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0) para *i=1,...,n* e x (denotado por ![equation](http://www.sciweavers.org/tex2img.php?eq=x_%7Bi%7D&bc=White&fc=Black&im=jpg&fs=12&ff=txfonts&edit=0) para *i=1,...n*) é formalmente escrito como:

![equation](http://www.sciweavers.org/tex2img.php?eq=%20y_%7Bi%7D%20%20%3D%20a%20%2Bbx_%7Bi%7D%2B%20%5Cvarepsilon_%7Bi%7D&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0)

assumindo que os erros ou resíduos são normalmente e independentemente distribuídos com média zero e variância igual a. O modelo de regressão tem três coeficientes desconhecidos que podem ser estimados pelo método de mínimos quadrados. 

Suponha que a variável dependente representa o log do número mensal de condutores mortos ou gravemente feridos (KSI) no Reino Unido (UK) no período de Janeiro de 1969 a Dezembro de 1984 (192 observações). Além disso, suponha que a variável independente seja uma sequencia que representa o índice temporal da série (1 a 192). 

```s
library(knitr)
?knit
knit(input)
```
