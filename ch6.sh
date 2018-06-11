--------關於路徑----------
.         代表此層目錄
..        代表上一層目錄
-         代表前一個工作目錄
~         代表『目前使用者身份』所在的家目錄
~account  代表 account 這個使用者的家目錄(account是個帳號名稱)

關於cd pwd mkdir的操作及相關參數代表的意思，還是去網站看一下比較清楚
http://linux.vbird.org/linux_basic/0220filemanager.php#

----------關於環境變數---------------------------------

---------關於複製，移動以及複製來的檔案的權限問題(rm, mv, cp)---------------------------------
有關於連結檔(捷徑)的操作
看完i-node再回來看這裡

-------------show檔案內容的指令---------------------------------
cat  由第一行開始顯示檔案內容
tac  從最後一行開始顯示，可以看出 tac 是 cat 的倒著寫！
nl   顯示的時候，順道輸出行號！
more 一頁一頁的顯示檔案內容
less 與 more 類似，但是比 more 更好的是，他可以往前翻頁！
head 只看頭幾行
tail 只看尾巴幾行
od   以二進位的方式讀取檔案內容！

cat -n /etc/man_db.conf | head -n 20 | tail -n 10
這行是精髓，搞懂這行就差不多了

-----------------------------檔案修改的時間-------------------------------------
modification time (mtime)：
當該檔案的『內容資料』變更時，就會更新這個時間！內容資料指的是檔案的內容，而不是檔案的屬性或權限喔！

status time (ctime)：
當該檔案的『狀態 (status)』改變時，就會更新這個時間，舉例來說，像是權限與屬性被更改了，都會更新這個時間啊。 

access time (atime)：
當『該檔案的內容被取用』時，就會更新這個讀取時間 (access)。舉例來說，我們使用 cat 去讀取 /etc/man_db.conf ， 就會更新該檔案的 atime 了。

!!!
注意，網站上關於show time的指令在mac上跑不動，
應該要用
ls -l   這是mtime
ls -lc  這是ctime
ls -lu  這是atime
https://www.unixtutorial.org/2008/04/atime-ctime-mtime-in-unix-filesystems/

!!!
注意2
當我把檔案打開來編輯完再存檔後，
mtime跟ctime會一起更新，
但如果是用 chmod 來更改權限，則只有ctime會更改

用 “touch” 來修改檔案的相關時間或是建立一個新的檔案

--------利用umask修改檔案預設權限------------
http://linux.vbird.org/linux_basic/0220filemanager.php#umask

--------檔案的隱藏屬性---------------------
http://linux.vbird.org/linux_basic/0220filemanager.php#attr

-------------使用file查詢檔案類型---------------


-------------尋找檔案的指令-------
find, whereis, locate
find額外可進行的動作：
   -exec command ：command 為其他指令，-exec 後面可再接額外的指令來處理搜尋到的結果。