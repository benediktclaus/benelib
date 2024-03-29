% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/report_save.R
\name{report_save}
\alias{report_save}
\title{Save plots for LaTeX reports in correct dimensions}
\usage{
report_save(
  filename,
  plot,
  path = "04 Figures",
  width = 11.75,
  height = 9,
  units = "cm"
)
}
\arguments{
\item{filename}{Desired filename}

\item{plot}{Plot}

\item{path}{Desired path for saving}

\item{width}{Plot width, defaults to 11.75 cm}

\item{height}{Plot height, defaults to 9 cm}

\item{units}{Unit, defaults to \code{"cm"}}
}
\value{
Nothing, used for side-effects only
}
\description{
This function saves a ggplot2 plot in the desired location with the correct
dimensions for a LaTeX report. If a custom thematic theme is used, this only
works for vector graphics (e.g., PDF).
}
