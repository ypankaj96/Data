
library("remotes")
remotes::install_github("GuangchuangYu/nCov2019")

library(nCov2019)

x <- get_nCov2019(lang='en')
x
x['global', ]
x[]
x['Hubei', ]
library(forcats)
library(ggplot2)
d = x['Anhui',] # replace Anhui with any province
d$confirm=as.numeric(d$confirm)
d$name = fct_reorder(d$name, d$confirm)
ggplot(d, aes(name, confirm)) + 
  geom_col(fill='steelblue') + coord_flip() +
  geom_text(aes(y = confirm+2, label=confirm), hjust=0) +
  theme_minimal(base_size=14) + 
  scale_y_continuous(expand=c(0,10)) +
  xlab(NULL) + ylab(NULL)
head(x[by='today'], 10)
x['Hubei', by='today']
summary(x)
summary(x, by="today")
library(ggplot2)
ggplot(summary(x), aes(as.Date(date, "%m.%d"), as.numeric(confirm))) +
  geom_col(fill='firebrick') + theme_minimal(base_size = 14) +
  xlab(NULL) + ylab(NULL) + 
  labs(caption = paste("accessed date:", time(x)))
load_nCov2019()
x <- load_nCov2019(lang='en')
x
head(x[,c(1:6, 9:11)])
head(x['Hubei', c(1:6, 9:11)])
head(subset(x['Hubei',], city == "Wuhan"))[c(1:6, 9:11)]
library(ggplot2)
install.packages("ggrepel")
require(ggrepel)
d <- x['Anhui',] # replace Anhui with any province
ggplot(d, aes(time, as.numeric(cum_confirm), group=city, color=city)) +
  geom_point() + geom_line() +
  geom_text_repel(aes(label=city), data=d[d$time == time(x), ], hjust=1) +
  theme_minimal(base_size = 14) + theme(legend.position='none') +
  xlab(NULL) + ylab(NULL)
head(summary(x)[,1:5])
summary(x, 'Hubei')[,1:5]
ggplot(summary(x, 'Hubei'), aes(time, as.numeric(cum_confirm))) +
  geom_col()
# or city-specific
ggplot(subset(x['Hubei',], city == "Huanggang"), aes(time, as.numeric(cum_confirm))) + geom_col()
require(nCov2019)
x = get_nCov2019(lang='en')
plot(x)
