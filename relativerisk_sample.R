# relative risk ####

library(epitools)

tab <- matrix(c(1,4,9,6),byrow = TRUE, ncol = 2)
epitab(tab, method= "riskratio")


## small sample ####

tab <- matrix(c(6,4,9,1),byrow = TRUE, ncol = 2)
rr_small <- epitab(tab, method= "riskratio")

## medium sample ####

tab <- matrix(c(60,40,90,10),byrow = TRUE, ncol = 2)
rr_medium <- epitab(tab, method= "riskratio")

## large sample ####

tab <- matrix(c(600,400,900,100),byrow = TRUE, ncol = 2)
rr_large <- epitab(tab, method= "riskratio")


# visualization ####

rr <- data.frame(
  a = c("small","medium","large"),
  b = c(rr_small$tab[2,5],rr_medium$tab[2,5],rr_large$tab[2,5])
)

rr_conf <- data.frame(
  a = c("small","medium","large","small","medium","large"),
  b = c(rr_small$tab[2,6],rr_medium$tab[2,6],rr_large$tab[2,6],
        rr_small$tab[2,7],rr_medium$tab[2,7],rr_large$tab[2,7])
)

ggplot(rr, aes(y = a, x = b, color = a)) +
  geom_point(size = 5) +
  geom_line(data = rr_conf, mapping = aes(y = a, x = b, color = a), size = 1.3) +
  labs(x = "Sample size", y = "Relative risk",
       title = "Relative Risk and 95% confidence intervall for different sample sizes")
