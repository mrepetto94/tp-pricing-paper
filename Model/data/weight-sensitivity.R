setwd("~/Dropbox/2.Projects/Conf Bahrein/archive/tp-pricing-paper")
library("ggtern")

central <- seq(0, 1, length.out=7)
sides <- (1 - central)/2

w1 <- c(central,sides,sides)
w2 <- c(sides,central,sides)
w3 <- c(sides,sides,central)

write.csv(data.frame(w1,w2,w3), "weight-sense.csv")

obj <-apply(read.csv("data/result-weight-sense.csv"), 1, sum)

df  <- data.frame(w1,w2,w3, obj)

ggtern( data = df, aes(x=w1,y=w2,z=w3, size=obj)) + 
  geom_point() +
  scale_size_continuous(name="Objective") +
  theme_showarrows() +
  theme(text= element_text(size=15, family="LM Roman 10")) 

ggsave(filename = "ternary.png")

