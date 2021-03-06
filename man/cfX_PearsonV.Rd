% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cfX_PearsonV.R
\name{cfX_PearsonV}
\alias{cfX_PearsonV}
\title{Characteristic function of Pearson type V distribution}
\usage{
cfX_PearsonV(t, alpha = 1, beta = 1)
}
\arguments{
\item{t}{numerical real values (number, vector...)}

\item{alpha}{shape, alpha > 0, default value alpha = 1}

\item{beta}{scale > 0, default value beta = 1}
}
\value{
characteristic function cf(t) of the Gamma distribution
}
\description{
cfX_PearsonV(t, alpha, beta) evaluates the characteristic function cf(t) of
the Pearson type V distribution with the parameters alpha (shape, alpha > 0) and
beta (scale, beta > 0), computed for real vector argument t, i.e.

cfX_PearsonV(t, alpha, beta) = (2/gamma(alpha)) * (-1i*t/beta)^(alpha/2) * besselk(alpha,2*sqrt(-1i*t/beta)),
where besselk(a,z) denotes the modified Bessel function of the second.
}
\examples{
## EXAMPLE1 ((CF of the PearsonV distribution)
alpha <- 3 / 2
beta <- 2 / 3
t <- seq(-10, 10, length.out = 1001)
plotGraf(function(t)
  cfX_PearsonV(t, alpha, beta), t,
  title = "CF of the PearsonV distribution with alpha = 3/2, beta = 2/3")

## EXAMPLE2 (PDF/CDF of the Beta distribution with alpha = 3/2, beta = 2/3)
alpha <- 3 / 2
beta <- 2 / 3
prob <- c(0.9, 0.95, 0.99)
x <- seq(0, 40, length.out = 101)
cf <- function(t)
  cfX_PearsonV(t, alpha, beta)
result <-
  cf2DistGP(cf,
            x,
            prob,
            xMin = 0,
            N = 2 ^ 10,
            SixSigmaRule = 10)

## EXAMPLE3 (PDF/CDF of the compound Binomial-PearsonV distribution)
n <- 25
p <- 0.3
alpha <- 3 / 2
beta <- 2 / 3
prob <- c(0.9, 0.95, 0.99)
x <- seq(0, 200, length.out = 101)
cfX <- function(t)
  cfX_PearsonV(t, alpha, beta)
cf <- function(t)
  cfN_Binomial(t, n, p, cfX)

result <- cf2DistGP(cf, x, prob, isCompound = TRUE, N = 2 ^ 10)
}
\seealso{
For more details see WIKIPEDIA:
\url{https://en.wikipedia.org/wiki/Pearson_distribution}

Other Continuous Probability distribution: \code{\link{cfS_Arcsine}},
  \code{\link{cfS_Beta}}, \code{\link{cfS_Gaussian}},
  \code{\link{cfS_Rectangular}},
  \code{\link{cfS_StudentT}},
  \code{\link{cfS_Trapezoidal}},
  \code{\link{cfS_Triangular}}, \code{\link{cfX_Beta}},
  \code{\link{cfX_ChiSquared}},
  \code{\link{cfX_Exponential}}, \code{\link{cfX_Gamma}},
  \code{\link{cfX_InverseGamma}},
  \code{\link{cfX_LogNormal}}, \code{\link{cfX_Normal}},
  \code{\link{cfX_Rectangular}},
  \code{\link{cfX_Triangular}}
}

