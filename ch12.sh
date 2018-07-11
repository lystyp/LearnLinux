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
echo $name
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


# -----------------用中括號[]包判斷式---------------------------
# 基本上就是跟test指令沒什麼兩樣，就是test改成用 [] 而已
# 使用中括號必須要特別注意，因為中括號用在很多地方，包括萬用字元與正規表示法等等，所以如果要在 bash 的語法當中使用中括號作為 shell 的判斷式時，必須要注意中括號的兩端需要有空白字元來分隔喔！ 假設我空白鍵使用『□』符號來表示，那麼，在這些地方你都需要有空白鍵：

# [  "$HOME"  ==  "$MAIL"  ]
# [□"$HOME"□==□"$MAIL"□]
#  ↑       ↑  ↑       ↑


# ----------------- Shell script 的預設變數($0, $1...)---------------------------
# 可以透過$1、$2...在script中取得丟進來的參數
/path/to/scriptname  opt1  opt2  opt3  opt4 
       $0             $1    $2    $3    $4
# 另外在script還有一些特別的預設變數可以取
$# ：代表後接的參數『個數』，以上表為例這裡顯示為『 4 』；
"$@" ：代表『 "$1" "$2" "$3" "$4" 』之意，每個變數是獨立的(用雙引號括起來)；
"$*" ：代表『 "$1c$2c$3c$4" 』，其中 c 為分隔字元，預設為空白鍵， 所以本例中代表『 "$1 $2 $3 $4" 』之意。
# 那個 "$@" 與 "$*" 基本上還是有所不同啦 > 不同在哪?不知道，好像都用$@就好了
 
# 看範例最快
# Ex:
# In test.sh
echo $#
echo $@
# Than run 
test.sh 123 asd "Daniel Shi"
# Output is 
3
123 asd Daniel Shi

# 注意!
# 當你輸入的參數內帶有雙引號 (") 時，建議還是得要使用 "$@" 來帶入腳本中， 
# 否則雙引號會被取消，這樣執行結果的差異會相當大喔！
# 尤其是像『 ./script one "a   to   b" 』這種僅有兩個參數，但是參數內還有空白字元的， 最容易出現莫名的問題喔！
# 就是明明要用的是"a to b"的字串，他卻變成 a, to, b 三個東西來輸入

# 可以用shift來偏移
# Example
# In test.sh
echo "Total parameter number is ==> $#"
echo "Your whole parameter is   ==> '$@'"
shift   # 進行第一次『一個變數的 shift 』
echo "Total parameter number is ==> $#"
echo "Your whole parameter is   ==> '$@'"
shift 3 # 進行第二次『三個變數的 shift 』
echo "Total parameter number is ==> $#"
echo "Your whole parameter is   ==> '$@'"
# Than run
sh shift_paras.sh one two three four five six
# The result is
Total parameter number is ==> 6   # <==最原始的參數變數情況
Your whole parameter is   ==> 'one two three four five six'
Total parameter number is ==> 5   # <==第一次偏移，看底下發現第一個 one 不見了
Your whole parameter is   ==> 'two three four five six'
Total parameter number is ==> 2   # <==第二次偏移掉三個，two three four 不見了
Your whole parameter is   ==> 'five six'



# ------------------------------條件判斷式!---------------------
# 終於進入這裡了QQ
# 基本格式
if [ 條件判斷式 ]; then
	當條件判斷式成立時，可以進行的指令工作內容；
fi
# 這裡的條件判斷式就是上面提到過的跟test同功能的中括號
# 如果有多個判斷式，一個中括號裡面的很多判斷式可以用 -o(就是or的意思)來連接(and 不知道是啥，要用再去google)
# 或是用很多個中括號來包很多個判斷式，然後用&& 和 || 來連接
[ "${yn}" == "Y" -o "${yn}" == "y" ]
# 上式可替換為
[ "${yn}" == "Y" ] || [ "${yn}" == "y" ]
# &&用在一般指令是如果true就執行&&後面的東西，||則是如果false就執行後面的東西(在管線那邊用到的)
# 但用在判斷式就有不一樣的意思了

# 目前看到多重、複雜條件判斷式
# http://linux.vbird.org/linux_basic/0340bashshell-scripts.php#ifthen_multi