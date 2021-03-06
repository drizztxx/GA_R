% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/recombin.R
\name{recombin}
\alias{recombin}
\title{RECOMBINation high-level function}
\usage{
recombin(REC_F, Chrom, RecOpt = 0.7, SUBPOP = 1, ...)
}
\arguments{
\item{REC_F}{character string containing the name of the recombination or
crossover function.}

\item{Chrom}{a matrix containing the chromosomes of the old
population. Each line corresponds to one individual}

\item{RecOpt}{an optional value containing the probability of 
recombination/crossover occurring between pairs of individuals.
Default is set to 0.7.}

\item{SUBPOP}{an optional number indicating subpopulations.
Default is set to 1.}

\item{...}{ohter aurguments passed on to crossover function.}
}
\value{
a matrix containing the chromosomes of the population
after recombination in the same format as OldChrom.
}
\description{
This function performs recombination between pairs of individuals
and returns the new individuals after mating. The function handles
multiple populations and calls the low-level recombination function
for the actual recombination process.
}
\note{
This function doesn't work with low level recombination function \code{\link{recmut}}
}
\examples{

Selch = crtbp(40,10)$Chrom

NewChrom = recombin(REC_F="xovsp",Chrom=Selch)
}
\author{
The original matlab implementation of recombin was written by Hartmut Pohlheim.
The R implementation was written by David Zhao.
}

