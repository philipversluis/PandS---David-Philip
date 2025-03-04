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

---
title: "Assignment1"
author: "DavidMenkreo"
date: "2025-03-02"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## Exercise A

```{r, fig.width=9, fig.height=4, dpi=100}
# Set up plotting layout for 3 histograms in one row
par(mfrow = c(1,3)) 

# 50 random draws
x1 <- runif(50)
hist(x1, main = "Histogram of 50 draws", col = "lightblue", border = "black", xlab = "Values", ylab = "Frequency")

# 500 random draws
x2 <- runif(500)
hist(x2, main = "Histogram of 500 draws", col = "lightgreen", border = "black", xlab = "Values", ylab = "Frequency")

# 5000 random draws
x3 <- runif(5000)
hist(x3, main = "Histogram of 5000 draws", col = "lightcoral", border = "black", xlab = "Values", ylab = "Frequency")
```

## Exercise B
```{r}

sim.coin <- function(n) {
  U <- runif(n)
  S <- ifelse(U < 0.5, -1, 1)
  return(S)
}

# C
tosses <- 3650
balance <- cumsum(sim.coin(tosses))

plot(
  1:tosses, balance, 
  type = "l",
  main = "Development of Balance Over 3650 Coin Tosses",
  xlab = "Number of Tosses",
  ylab = "Balance (Euros)"
)
```

## Exercise C

```{r fig.width=9, fig.height=4, dpi=100}
# We have 3650 coin tosses over the year
tosses <- 3650

# Our balance at each toss is the sum
balance <- cumsum(sim.coin(tosses))

# development of balance
plot(
  1:tosses, balance,
  type = "l",
  main = "Development of Balance Over 3650 Coin Tosses",
  xlab = "Number of Tosses",
  ylab = "Balance (Euros)"
)
```
## Exercise D
```
# Fraction of time that the balance is above 0
fraction_positive <- mean(balance > 0)
fraction_positive
```
## Exercise E

```{r}
# Simulation for four separate year-long runs 
balance1 <- cumsum(sim.coin(3650))
balance2 <- cumsum(sim.coin(3650))
balance3 <- cumsum(sim.coin(3650))
balance4 <- cumsum(sim.coin(3650))

# min/max to keep all lines visible on the same y-scale
y_min <- min(balance1, balance2, balance3, balance4)
y_max <- max(balance1, balance2, balance3, balance4)

plot(
  1:3650, balance1,
  type = "l",
  ylim = c(y_min, y_max),
  main = "Four Simulations of Balance Over 3650 Coin Tosses",
  xlab = "Number of Tosses",
  ylab = "Balance (Euros)"
)
lines(balance2)
lines(balance3)
lines(balance4)

## Exercise F

```{r}
# Simulation for four separate year-long runs 
balance1 <- cumsum(sim.coin(3650))
balance2 <- cumsum(sim.coin(3650))
balance3 <- cumsum(sim.coin(3650))
balance4 <- cumsum(sim.coin(3650))

# min/max to keep all lines visible on the same y-scale
y_min <- min(balance1, balance2, balance3, balance4)
y_max <- max(balance1, balance2, balance3, balance4)

plot(
  1:3650, balance1,
  type = "l",
  ylim = c(y_min, y_max),
  main = "Four Simulations of Balance Over 3650 Coin Tosses",
  xlab = "Number of Tosses",
  ylab = "Balance (Euros)"
)
lines(balance2)
lines(balance3)
lines(balance4)

##Exercise G 

# repetition of 1000 times.
# For each run, record fraction of time balance is above 0.
num_sims <- 1000
pos.vec <- numeric(num_sims)

for(i in 1:num_sims){
  bal_temp <- cumsum(sim.coin(3650))
  pos.vec[i] <- mean(bal_temp > 0)
}

# histogram with probability=TRUE so total area = 1
hist(
  pos.vec,
  probability = TRUE,
  col = "lightblue",
  border = "black",
  main = "Histogram of Fractions of Positive Balance (1000 Simulations)",
  xlab = "Fraction of Time Balance > 0"
)
