# 第一個shell

# 這兩行是用來設定PATH, 然後用export把自訂的PATH變成環境變數取代原本的環境變數，確保自己要用到的指令都可以執行
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

# 這行就是主程式了
echo -e "Hello World! \a \n"

# 最後這個是return 的值，跑完.sh檔後可以用 echo $? 來秀出?變數，？變數存的就是上一個指令的輸出
exit 0

# -----------------------------------------------------------------
# 關於shell的數值運算
# http://linux.vbird.org/linux_basic/0340bashshell-scripts.php#ex_cal

# --------------------------- 用“source", "sh" 或 "." 來開啟.sh檔的差別--------------------------------------
# 用"source"跟用"."來開啟.sh檔是一樣意思，都會直接在跟shell同一個process執行指令
# 而用"sh"來開.sh則會在shell中再開一條子process來執行指令，所以不會污染原本的process環境
# 例如有一個test.sh檔只有一行
# name=Daniel

# 然後執行
sh test.sh
echo $name
# 會發現echo秀出的東西是空的，因為name在子process建立，跑完指令process砍掉變數也不見了
# 如果執行
. test.sh
echo $name
# 會發現name有東西了，因為他跟當下shell是在同一個process
# 也可以直接跑看看echo $$ 秀一下PID就知道了

# --------------------------------------------------------------------------------------------

# -----------------善用test指令---------------------------
# 我要檢查 /dmtsai 是否存在時，使用
test -e /dmtsai
# 執行結果並不會顯示任何訊息，但最後我們可以透過 $? 或 && 及 || 來展現整個結果呢！ 例如我們在將上面的例子改寫成這樣：
test -e /dmtsai && echo "exist" || echo "Not exist"
# Not exist  <==結果顯示不存在啊！

# test還有哪些參數可以用？
# http://linux.vbird.org/linux_basic/0340bashshell-scripts.php#test
# 可以拿來
# 看檔案是否存在
# 看檔案是否是file or directory or ....就看檔案類型啦
# 看檔案是否有各種權限
# 比較檔案哪個新哪個舊或是否是同一個檔案
# 判斷兩數值大小
# 比對字串
# 還可以同時比對多條件