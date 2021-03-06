\name{predict_lin1}
\alias{predict_lin1}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Bootstrap prediction for linear AR(1) model without intercept
}
\description{
The function allows a prediction of a linear AR(1) model without intercepth based
on simplicial depth and residual bootstrapping. 
}
\usage{
predict_lin1(y, CritLen, CritTime, NSim, alpha, restrict = F)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{y}{
Observed series, on which the parameter estimates are calculated. A prediction for future values of this series are produced. 
}
  \item{CritLen}{
A value for a critical lenght for which the time of arrival then can be predicted by the function
}
  \item{CritTime}{
  A value for a critivcal time (as index of the process), larger than the size of y, for which the process value is predicted
}
  \item{NSim}{
  Number of simulations used for the bootstrap simulations of the continued process
}
  \item{alpha}{
A level for the prediction intervals
}
  \item{restrict}{
A switch, which allow to activate a restriction for parameter simulations used in the bootstrap procedure. If restrict is activatet (TRUE) 1-alpha confidence intervals are used to generate simulated paremeters based on the empirical simplicial depth. If restrict is off (FALSE) the complete candidate set is used for simulations. Thereby the probabilities of the candidates rely on the empirical simplicial depth. 
}
}

\value{
\item{estimation_time }{The value for CritTime }
\item{estimation_lenght}{The value of CritLen}
\item{mean_CT}{Mean estimate of the critical lenght of arrival at CritTime}
\item{med_CT}{Median estimate of the critical lenght of arrival at CritTime}
\item{mean_CL}{Mean estimate of the critival time length at CritLen}
\item{med_CL}{Median estimate of the critical time at CritLen}
\item{confintCT}{1-alpha prediction interval for the estimate of the critical time}
\item{confintCL}{1-alpha prediction interval for the estimate of the citical length}
\item{alpha}{1-Level of the confidence intervals}
\item{simulations}{A matrix including all simulated continuations of the process}


}
\references{
Diss
}
\author{
Kustosz, Christoph
}


\seealso{
 \code{\link{draw_from_depth}}}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
