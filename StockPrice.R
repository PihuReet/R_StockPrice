library(forecast)
setwd("<YOUR_PATH>/R/SampleProject")
inf_data <- read.csv("infosys.csv")

inf_data$Close <- ts(inf_data$Close, start = c(2000,1), end = c(2018,11), frequency = 12) 

summary(inf_data$Close)

dinfyclose <- diff(inf_data$Close,12)

mf = naive(inf_data$Close, h = 24, level = c(80,95), fan = FALSE, lambda = NULL)

plot(dinfyclose)

fit_diff_ar <- arima(dinfyclose, order = c(12,0,0))
summary(fit_diff_ar)

fit_diff_arf <- forecast(fit_diff_ar, h=36)
print(fit_diff_arf)

plot(mf, include = 108)

plot(fit_diff_arf, include = 108)
