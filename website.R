install.packages("rpart")
library(rpart)
install.packages("rpart.plot")
library(rpart.plot)
View(phishing1_csv)
summary(phishing1_csv)
ind <- sample(2, nrow(phishing1_csv), replace = TRUE, prob = c(0.7, 0.3))
train.data <- phishing1_csv[ind == 1, ]
test.data <- phishing1_csv[ind == 2, ]
dt = sort(sample(nrow(phishing1_csv), nrow(phishing1_csv)*.7))
train<-phishing1_csv[dt,]
test<-phishing1_csv[-dt,]
tree <- rpart( Result ~ SFH + popUpWindow + SSLfinal_state + Request_URL + UseOfAnchor + 
                 WebTraffic + URL_Length + age_of_domain + having_IP_Address, train, method = "class")

pred <- predict(tree, test, type = "class")
print(pred)
confusion <- table(test$Result, pred)
print(confusion)