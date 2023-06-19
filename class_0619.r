# class_19
# interaction turm
# 交差校の概念　例えば、性別と学歴で4通りのカテゴリーができる
# 結果が頑健かどうか(ロバート)かどうかを示すために、いくつもの回帰分析を入れる
# *Significant at 10%: ** 5%: *** 1% という書き方を経済学では行う
# 係数の下にある()はrobust standard errors (頑健標準誤差)である

data = read.csv("caschool.csv")
# testscore = inter + histr + hiel + histr * hiel + e
# summary
summary(data)
sd(data$el_pct)# 英語学習者割合
sd(data$str)# 教員一人当たり生徒数

# ダミー変数を作成
# 教員一人当たり生徒数が20人以上ダミー
data$histr = ifelse(data$str >= 20, 1, 0)
# histrがうまく作れているのかの確認
# 確認方法(リスト)
dummy_list1 = cbind(data$str, data$histr)
View(dummy_list1)

# 英語学習者の割合が10%以上
data$hiel = ifelse(data$el_pct >= 10, 1, 0)
# hielがうまく作れているのかの確認
# 確認方法(リスト)
dummy_list2 = cbind(data$el_pct, data$hiel)
View(dummy_list2)

# 回帰分析
# 交差校を作成する場合は:を使用する
res = lm(testscr~histr+hiel+histr:hiel, data = data)
summary(res)

# 統計的優位性は考慮せずに考える
# 教員一人当たりの生徒数が20未満の場所から20以上の場所に引っ越した場合
# 成績に与える影響
# histr と histr:hiel について考える
-1.908 + -3.494
