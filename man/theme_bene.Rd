% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/theme_bene.R
\name{theme_bene}
\alias{theme_bene}
\title{Custom Theme for ggplot2}
\usage{
theme_bene(base_size = 11)
}
\arguments{
\item{base_size}{Integer, the text base size}
}
\value{
Theme for ggplot2.
}
\description{
Custom \code{ggplot2} theme based on \code{theme_light()}.
}
\examples{
library(ggplot2)

\dontrun{
palmer_penguins \%>\%
ggplot(aes(bill_length_mm, bill_depth_mm, color = species)) +
  geom_point() +
  theme_bene()
}
}
