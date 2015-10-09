numsim <- 5000
n <- 25
runsim <- function(rate=1) {
  x <- rexp(n, rate=rate)
  realmean <- 1/rate
  endpoints <- t.test(x)$conf.int
  lower <- ifelse(endpoints[2] < realmean, "missed", "covered")
  upper <- ifelse(endpoints[1] > realmean, "missed", "covered")
  return(data.frame(lower, upper))
}

res <- do(2000)*runsim()
tally(~ lower, format="proportion", data=res)
tally(~ upper, format="proportion", data=res)
