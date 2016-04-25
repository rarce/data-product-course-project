train <- read.csv("data/train.csv")

# processing data
train$Survived <- factor(train$Survived, levels=c(1,0))
levels(train$Survived) <- c("Survived", "Died")
train$Pclass <- as.factor(train$Pclass)
levels(train$Pclass) <- c("1st Class", "2nd Class", "3rd Class")
train$Gender <- factor(train$Sex, levels=c("female", "male"))
levels(train$Gender) <- c("Female", "Male")

write.csv(train, file = "shiny-app/titanic.csv")
