dS3_lin2 <- function(theta, res, y, model = c("linAR1", "linAR1woI", "nlinAR1", "linAR2", "linARc"), cpow = 1) {
  model <- match.arg(model)
  
  if (model == "linAR1woI") {
    if (missing(res)) {
      res <- resARMod_lin2(c(0, theta), y)
    }
    r1 <- res[seq(1, (length(res) - 1), 1)]
    r2 <- res[seq(2, length(res), 1)]
    m <- min(c(length(r1), length(r2)))
    r1 <- r1[1:m]
    r2 <- r2[1:m]
    InD <- (r1 > 0) * (r2 < 0) + (r1 < 0) * (r2 > 0) #(r1==0)*(r2==0)
    depth <- 1/(m) * sum(InD)
  } else {
    if (missing(res)) {
      if (model == "linAR1") {  
      res <- resARMod_lin2(c(theta[1], theta[2]), y)
      }
      if(model == "nlinAR1") {
        res <- resARMod_nlin1(c(theta[1], theta[2]), y)
      }
      if (model == "linAR2") {
        res <- resARMod_linar2(c(theta[1], theta[2]), y)
      }
      if (model =="linARc") {
        y1 <- y[-length(y)]
        y2 <- y[-1]
        res <- y2 - theta[1] - theta[2] * y1^cpow
      }
    }
    r1 <- res[seq(1, length(res) - 2, 1)]
    r2 <- res[seq(2, length(res) - 1, 1)]
    r3 <- res[seq(3, length(res), 1)]
    m <- min(c(length(r1), length(r2), length(r3)))
    r1 <- r1[1:m]
    r2 <- r2[1:m]
    r3 <- r3[1:m]
    InD <- (r1 > 0) * (r2 < 0) * (r3 > 0) + (r1 < 0) * (r2 > 0) * (r3 < 0) +
      (1 - (r1 != 0) * (r2 != 0) * (r3 != 0))
    depth <- 1/(m) * sum(InD)
    }
  return(depth)
}