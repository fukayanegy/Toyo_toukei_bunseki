#第3回課題
#1
univdata <- read.csv("univdata.csv")
univdata
#2
hist(univdata$weight,
     main = "体重のヒストグラム",
     col = "white", border = "black")

#3
x <- table(univdata$male)
barplot(x,
        main= "性別の棒グラフ",
        names=c("男性", "女性"),
        col = "white", border = "black")

#4
pie(x,
    main = "性別の円グラフ",
    labels = c("男性", "女性"),
    col = c("red", "blue"))
