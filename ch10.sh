Shell
用來操作底層的指令，
有一大堆應用程式都可以用來操作底層，像是chmod, rm, cd等等
shell就像是用來讓你可以call這些指令的context
當有使用者登入時，就會根據 etc/passwd裡面的資訊來判斷這個使用者要在哪一個shell底下執行

沒錯！shell有不同版本，不同linux版本或核心都會配有不同版本的shell，但都大同小異啦！！
http://linux.vbird.org/linux_basic/0320bash.php#bash_shells
但這個不是重點，
要根據使用者給不同shell的原因是，
說不定我不想要讓某些使用者有rm之類的指令，就會有變異版的shell給那些使用者用

通常/bin/bash 是 Linux 預設的 shell 
Bourne Again SHell (簡稱 bash) 

----------------------------------------------------------------------------------------------------------------------------------------
cmd除了shell的指令可以執行以外，還有環境變數底下或是目前工作路徑底下的檔案也都可以執行，
可以用type來看是哪裡的指令或是是shell預設的指令
type ls
type cd
這兩個秀的結果就不一樣，cd是shell內建的
http://linux.vbird.org/linux_basic/0320bash.php#bash_type

------------------------------------------------------------------------------------------------------------------------------------------------------
如果指令太長要換行繼續輸入
http://linux.vbird.org/linux_basic/0320bash.php#bash_command

快速移動指標到最前或最後
http://linux.vbird.org/linux_basic/0320bash.php#bash_command


-----------------------------------------------關於變數----------------------------------------------------------------------
 可以在shell那邊輸入
 name = Daniel
 echo $name
 他會show Daniel
 就是可以在cmd直接存變數，用echo取某個變數show出來，
 echo抓變數要在變數前面加一個 $


 PATH也是一個變數，用來存環境變數，這個不要亂改！！！
 像是我隨便測個
 PATH=asd
 之後，ls指令就不能用了......

生命週期好像shell關掉變數也就跟著沒了，也就是說，
我可以理解成一些系統指定的變數，像是PATH之類的，應該是早就寫在某個文件檔裡了，
每次開shell都會去把那些資訊讀出來存在變數裡，所以每次重進shell都會重讀

 bash 在你沒有設定的變數中強迫去 echo 時，它會顯示出空的值。 在其他某些 shell 中，隨便去 echo 一個不存在的變數，它是會出現錯誤訊息的

 變數設定的規則：
 http://linux.vbird.org/linux_basic/0320bash.php#variable_rule
 其中比較會用到的有
 變數內容若有空白字元可使用雙引號『"XXX"』或單引號『'XXX'』將變數內容結合起來，但
 雙引號內的特殊字元如 $ 等，可以保有原本的特性，如下所示：
『var="lang is $LANG"』則『echo $var』可得『lang is zh_TW.UTF-8』
 單引號內的特殊字元則僅為一般字元 (純文字)，如下所示：
『var='lang is $LANG'』則『echo $var』可得『lang is $LANG』

 若該變數為擴增變數內容時，則可用 "$變數名稱" 或 ${變數} 累加內容，如下所示：
『PATH="$PATH":/home/bin』或『PATH=${PATH}:/home/bin』

 可以用env或set來看目前系統的一大堆變數和設定等等
 http://linux.vbird.org/linux_basic/0320bash.php#env

 http://linux.vbird.org/linux_basic/0320bash.php#set  
 可以看到ㄧ些有趣的變數是在幹嘛用的 
 像是
 PS1
 ?
 $ 
 等等

 自訂變數轉成環境變數
 export 變數名稱
 這東西用在『分享自己的變數設定給後來呼叫的檔案或其他程序』

 --------------------------shell的語系設定-----------------------
 http://linux.vbird.org/linux_basic/0320bash.php#variable_locale

 ----------------------------read 指令--------------------------
 範例一：讓使用者由鍵盤輸入一內容，將該內容變成名為 atest 的變數
[dmtsai@study ~]$ read atest
This is a test        <==此時游標會等待你輸入！請輸入左側文字看看
[dmtsai@study ~]$ echo ${atest}
This is a test          <==你剛剛輸入的資料已經變成一個變數內容！

範例二：提示使用者 30 秒內輸入自己的大名，將該輸入字串作為名為 named 的變數內容
[dmtsai@study ~]$ read -p "Please keyin your name: " -t 30 named
Please keyin your name: VBird Tsai   <==注意看，會有提示字元喔！
[dmtsai@study ~]$ echo ${named}
VBird Tsai        <==輸入的資料又變成一個變數的內容了！

--------------------關於ulimit---------------------------
[dmtsai@study ~]$ ulimit [-SHacdfltu] [配額]
選項與參數：
-H  ：hard limit ，嚴格的設定，必定不能超過這個設定的數值；
-S  ：soft limit ，警告的設定，可以超過這個設定值，但是若超過則有警告訊息。
      在設定上，通常 soft 會比 hard 小，舉例來說，soft 可設定為 80 而 hard 
      設定為 100，那麼你可以使用到 90 (因為沒有超過 100)，但介於 80~100 之間時，
      系統會有警告訊息通知你！
-a  ：後面不接任何選項與參數，可列出所有的限制額度；
-c  ：當某些程式發生錯誤時，系統可能會將該程式在記憶體中的資訊寫成檔案(除錯用)，
      這種檔案就被稱為核心檔案(core file)。此為限制每個核心檔案的最大容量。
-f  ：此 shell 可以建立的最大檔案容量(一般可能設定為 2GB)單位為 Kbytes
-d  ：程序可使用的最大斷裂記憶體(segment)容量；
-l  ：可用於鎖定 (lock) 的記憶體量
-t  ：可使用的最大 CPU 時間 (單位為秒)
-u  ：單一使用者可以使用的最大程序(process)數量。

------------------- 判斷變數是否存在--------------
http://linux.vbird.org/linux_basic/0320bash.php#variable_other_re

--------------------- 查詢指令歷史紀錄 -----------------------
http://linux.vbird.org/linux_basic/0320bash.php#history

-------------------Bash Shell 的操作環境--------------------
在當下的環境，可能會不只有一個一樣的指令，
像是cd可能shell內建有一個，環境變數的bin裡面又有一個
系統怎麼知道要執行哪一個cd指令呢？

執行順序：
1.以相對/絕對路徑執行指令，例如『 /bin/ls 』或『 ./ls 』；
2.由 alias 找到該指令來執行；
3.由 bash 內建的 (builtin) 指令來執行；
4.透過 $PATH 這個變數的順序搜尋到的第一個指令來執行。

用
type -a cd
可以看到所有cd指令的來源

------------------極重要！！！！！！關於開啟shell的初始化流程------------------

包括讀取使用者設定，環境變數等等的東西
甚至可以自己客製化
http://linux.vbird.org/linux_basic/0320bash.php#settings_bashrc_shell

更改設定檔不一定要重開shell才能生效，可以用sourcce指令或 ”.“

範例：將家目錄的 ~/.bashrc 的設定讀入目前的 bash 環境中
[dmtsai@study ~]$ source ~/.bashrc  
[dmtsai@study ~]$  .  ~/.bashrc

------------關於資料流導向----------------
http://linux.vbird.org/linux_basic/0320bash.php#redirect_redirect

關於 "1>>", "1>", "2>>", "2>"
把指令的標準輸出或標準錯誤輸出都給輸出到螢幕以外的地方，還蠻好玩的

還有輸入也可以用從鍵盤留變成從其他地方流
關於 "<<", "<"

--------------------利用&&, ||判斷式來執行連續的指令------------------
這個也蠻好玩的
http://linux.vbird.org/linux_basic/0320bash.php#redirect_com

--------------------管線命令 (pipe)--------------------
管線指令是指某些能接受標準輸入的指令，
可以用 "|" 來把前一個指令的標準輸出當作下一個指令的輸入，只有標準輸出喔，如果錯誤的話不會流進去，要先把錯誤輸出轉成標準輸出才可以流
http://linux.vbird.org/linux_basic/0320bash.php#pipe

ex: 
cmd1 | cmd2

像是cut, grep等等有一大堆管線命令，都是拿來做資料處理分析擷取的吧？
cut > 把資料依照特定字元切成一段一段並抓出某段用的
grep > 分析資料·如果包含某些字元或字串用就抓出來用的

sort, wc, uniq
sort > 排序
uniq > 重複的只出現一次
wc > 計算出現次數


----------------------- tee --------------------------------
tee可以讓資料留有分之
像下面那個範例
cat test.txt|tee test2.txt|grep 'test5'
可以把txt讀出來的內容流向test2之外，資料流不會斷掉·仍然可以繼續往下個指令流

---------------tr, col, join, paste, expand--------------
tr > 替換或刪除字元

col > 
範例一：利用 cat -A 顯示出所有特殊按鍵，最後以 col 將 [tab] 轉成空白
cat -A /etc/man_db.conf  <==此時會看到很多 ^I 的符號，那就是 tab
cat /etc/man_db.conf | col -x | cat -A | more
雖然 col 有他特殊的用途，不過，很多時候，他可以用來簡單的處理將 [tab] 按鍵取代成為空白鍵！ 
例如上面的例子當中，如果使用 cat -A 則 [tab] 會以 ^I 來表示。 但經過 col -x 的處理，則會將 [tab] 取代成為對等的空白鍵！

join > 
根據某些條件把兩筆資料連在一起

paste > 
簡單版的join，就單純貼在一起而已

expand > 
這玩意兒就是在將 [tab] 按鍵轉成空白鍵啦～

---------------------------------------
 split > 分割，也可以根據容量來分割

xargs > 可以接收管線命令的輸入(stdin)，並轉換成一般的輸入參數，

