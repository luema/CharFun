% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cfN_Delaporte.R
\name{cfN_Delaporte}
\alias{cfN_Delaporte}
\title{Characteristic function of Delaporte distribution}
\usage{
cfN_Delaporte(t, a, b, c, cfX)
}
\arguments{
\item{t}{numerical values (number, vector...)}

\item{a}{variable mean, a > 0}

\item{b}{variable mean, b > 0}

\item{c}{fixed mean, c > 0}

\item{cfX}{function}
}
\value{
characteristic function cf(t) of the Delaporte distribution with a and b variable means and c fixed mean
}
\description{
cfN_Delaporte(t, a, b, c) evaluates the characteristic function cf(t) of the
Delaporte distribution with the parameters a (parameter of variable mean, a > 0)
b (parameter of variable mean, b > 0 ), and c (fixed mean, c > 0), i.e.
cfN_Delaporte(t, a, b, c) = (b/(1+b))^a * (1-e^(1i*t)/(b+1))^(-a) * exp(-c*(1-e^(1i*t)))

cfN_Delaporte(t, a, b, c, cfX) evaluates the compound characteristic function
cf(t) = cfN_Delaporte(-1i*log(cfX(t)), a, b, c), where cfX is function
handle of the characteristic function cfX(t) of a continuous distribution
and/or random variable X.

Note that such CF is characteristic function of the compound distribution,
i.e. distribution of the random variable Y = X_1 + ... + X_N, where X_i ~ F_X
are i.i.d. random variables with common CF cfX(t), and N ~ F_N is
independent RV with its CF given by cfN(t).
}
\examples{
## EXAMPLE1 (CF of the Delaporte distribution with a = 2.2, b = 3.3, c = 4)
a <- 2.2
b <- 3.3
c <- 4
t <- seq(-15, 15, length.out = 1001)
plotGraf(function(t)
  cfN_Delaporte(t, a, b, c), t, title = "CF of the Delaporte distribution with a=2.2, b=3.3, c=4")

## EXAMPLE2 (CF of the compound Delaport-Exponential distribution)
a <- 2.2
b <- 3.3
c <- 4
lambda <- 10
cfX <- function(t)
  cfX_Exponential(t, lambda)
t <- seq(-10, 10, length.out = 501)
plotGraf(function(t)
  cfN_Delaporte(t, a, b, c, cfX), t, title = "CF of the compound Delaport-Exponential distribution")

## EXAMPLE3 (PDF/CDF of the compound Delaport-Exponential distribution)
a <- 2.2
b <- 3.3
c <- 4
lambda <- 5
cfX <- function(t)
  cfX_Exponential(t, lambda)
cf <- function(t)
  cfN_Delaporte(t, a, b, c, cfX)
x <- seq(0, 4, length.out = 101)
prob <- c(0.9, 0.95, 0.99)
result <- cf2DistGP(cf, x, prob, isCompound = TRUE)
}
\seealso{
For more details see WIKIPEDIA:
\url{https://en.wikipedia.org/wiki/Delaporte_distribution}

Other Discrete Probability Distribution: \code{\link{cfN_Binomial}},
  \code{\link{cfN_GeneralizedPoisson}},
  \code{\link{cfN_Geometric}},
  \code{\link{cfN_Logarithmic}},
  \code{\link{cfN_NegativeBinomial}},
  \code{\link{cfN_Poisson}},
  \code{\link{cfN_PolyaEggenberger}}
}

