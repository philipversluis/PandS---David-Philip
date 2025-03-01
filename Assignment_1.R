# B
sim.coin <- function(n) {
  U <- runif(n)
  S <- ifelse(U < 0.5, -1, 1)
  return(S)
}

# C
tosses <- 3650
balance <- cumsum(sim.coin(tosses))

plot(1:tosses, balance, type = "l",
     main = "Development of Balance Over 3650 Coin Tosses",
     xlab = "Number of Tosses",
     ylab = "Balance (Euros)")