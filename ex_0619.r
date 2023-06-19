# ex_19

data = read.csv("caschool.csv")

# ダミー変数を作成
#  貧困家庭に対する補助が10%以上なら1，それ以外は0のダミー変数
data$hipct = ifelse(data$calw_pct >= 10, 1, 0)
# histrがうまく作れているのかの確認
# 確認方法(リスト)
dummy_list3 = cbind(data$calw_pct, data$hipct)
View(dummy_list3)

# 教員一人当たり生徒数が20人以上ダミー
data$histr = ifelse(data$str >= 20, 1, 0)
# histrがうまく作れているのかの確認
# 確認方法(リスト)
dummy_list1 = cbind(data$str, data$histr)
View(dummy_list1)

# testscore = intercept + histr + hipct + histr:hipct + e

result = lm(testscr~histr+hipct+histr:hipct, data = data)
summary(result)
-23.372 + 1.409
# 貧困家庭に対する扶助制度の適用割合が10％未満のエリアから10％以上のエリアに移った場合
# 21.963点下がる