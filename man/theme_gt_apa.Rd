% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_gt_apa.R
\name{theme_gt_apa}
\alias{theme_gt_apa}
\title{APA-Like Table Style}
\usage{
theme_gt_apa(table)
}
\arguments{
\item{table}{A \code{gt} table}
}
\value{
A formatted \code{gt} table
}
\description{
Style a \code{gt} table minimally with an APA-like style.
}
\examples{
library(gt)

mtcars \%>\%
gt() \%>\%
theme_gt_apa()
}
