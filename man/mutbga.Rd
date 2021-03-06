% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mutbga.R
\name{mutbga}
\alias{mutbga}
\title{Mutation of real-valued population}
\usage{
mutbga(OldChrom, FieldDR, MutOpt)
}
\arguments{
\item{OldChrom}{a matrix containing the chromosomes of the old
population. Each line corresponds to one individual.}

\item{FieldDR}{a matrix of 2 rows by number of variables describing the
boundaries of each variable.}

\item{MutOpt}{an optional vector containing mutation rate and shrink value:
\enumerate{
  \item MutOpt[1] a number containing the mutation rate in the range \eqn{[0, 1]}.
By default this value is assumed to \eqn{1/Nvar}, where \eqn{Nvar} is the number 
of variables per individual defined by \code{NCOL(FieldDR)}.
  \item MutOpt[2] a number for shrinking the
mutation range in the range \eqn{[0, 1]}. 
By default this vaule is assumed to 1 (no shrinking).
}}
}
\value{
a matrix containing the chromosomes of the population
after mutation in the same format as OldChrom.
}
\description{
This function implements the mutation operator of the Breeder Genetic
Algorithm.
}
\details{
\code{mutbga} takes a matrix \code{OldChrom} containing the real
representation of the individuals in the current population,
mutates the individuals with given probability and returns
the resulting population.
\cr\cr
The mutataion of a variable is computed as follows:\cr
mutated variable = variable + \eqn{MutMx * range * MutOpt[2] * delta}, 
where \eqn{MutMx} = 1 or -1 with probability \eqn{MutOpt[1]}, (+ or - with equal
probability) else 0. \eqn{range = 0.5 *} domain of variable (search interval defined
by \code{FieldDR}). \eqn{delta = sum(0 to m-1)pi*2^-i, pi = 1} wiht probability 
\eqn{1/m}, else 0, m = 20.\cr
\cr
With \eqn{m = 20}, the mutation operator is able to locate the optimum up to a 
precision of \eqn{range * MutOpt[2] * 2^-19}
\cr\cr
\code{mutbga} is able to generate most points in the hypercube defined by the 
variable of the individual and the range of the mutation. However, it test more
often near the variable, that is, the probability of small step size is greater
than that of larger step sizes.
}
\examples{
## Initial a real-valued population
FieldDR = matrix(c(-100,-50,-30,-20,100,50,30,20),2,4,byrow=TRUE) 
Chrom = crtrp(6,FieldDR)

## Perform mutation
NewChrom = mutbga(Chrom,FieldDR)
}
\author{
The original matlab implementation of crtrp was written by Hartmut Pohlheim. 
The R implementation was written by David Zhao.
}
\references{
Muhlenbein, H., Schlierkamp-Voosen, D. (1993) \emph{Predictive Models for the Breeder 
Genetic Algorithm: I. Continuous Parameter Optimization}. Evolutionary Computation.
}
\seealso{
\code{\link{mutate}}, \code{\link{recdis}}, \code{\link{recint}}, \code{\link{recmut}}, 
\code{\link{reclin}}
}

