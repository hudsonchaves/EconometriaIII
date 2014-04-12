<head>
...
    <script type="text/javascript"
            src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
    </script>
...
</head>

# INTRODUÇÃO

No método clássico de regressão uma relação linear é assumida entre uma variável dependente *y*, e variáveis independentes ou exógenas *x*. Desvios desta relação são assumidos seguirem um processo aleatório em torno de zero. O tradicional modelo de regressão para *n* observações de *y* (denotado por *y_i* para *i=1,...,n* e x (denotado por *x_i* para *i=1,...n*) é formalmente escrito como:

$
\begin{aligned}
\dot{x} & = \sigma(y-x)\\
\dot{y} & = \rho x - y - xz \\
\dot{z} & = -\beta z + xy
\end{aligned}
$
