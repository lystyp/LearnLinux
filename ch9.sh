關於vim
http://linux.vbird.org/linux_basic/0310vi.php

基本的就不寫啦，寫一些之前不知道的東西就好了

------驚嘆號------------
如果你的檔案權限不對，例如為 -r--r--r-- 時，那麼可能會無法寫入，此時可以使用『強制寫入』的方式嗎？
可以！使用『 :wq! 』 多加一個驚嘆號即可！不過，需要特別注意呦！那個是在『你的權限可以改變』的情況下才能成立的！

-------------搜尋--------------
要在檔案內搜尋 vbird 這個字串，就輸入 
/vbird     // 這是向下搜尋 
或
?vbird     // 這是向上搜尋
即可！

---------- "n", "N" 重複上一動-------------
這個 n 是英文按鍵。代表『重複前一個搜尋的動作』。舉例來說， 如果剛剛我們執行 /vbird 去向下搜尋 vbird 這個字串，
則按下 n 後，會向下繼續搜尋下一個名稱為 vbird 的字串。如果是執行 ?vbird 的話，那麼按下 n 則會向上繼續搜尋名稱為 vbird 的字串！

這個 N 是英文按鍵。與 n 剛好相反，為『反向』進行前一個搜尋動作。 例如 /vbird 後，按下 N 則表示『向上』搜尋 vbird 。

-------------取代--------------------
n1 與 n2 為數字。在第 n1 與 n2 列之間尋找 word1 這個字串，並將該字串取代為 word2 ！舉例來說，在 100 到 200 列之間搜尋 vbird 並取代為 VBIRD 則：
:100,200s/vbird/VBIRD/g

:1,$s/word1/word2/gc
從第一列到最後一列尋找 word1 字串，並將該字串取代為 word2 ！且在取代前顯示提示字元給使用者確認 (confirm) 是否需要取代！

------------複製, 刪除------------------
在一列字當中，x 為向後刪除一個字元 (相當於 [del] 按鍵)， X 為向前刪除一個字元(相當於 [backspace] 亦即是倒退鍵) (常用)
dd  刪除游標所在的那一整列(常用)
ndd n為數字。刪除游標所在的向下 n 列，例如 20dd 則是刪除 20 列 

yy	複製游標所在的那一列(常用)
nyy	n為數字。複製游標所在的向下 n 列，例如 20yy 則是複製 20 列(常用)

p, P	p 為將已複製的資料在游標下一列貼上，P 則為貼在游標上一列！ 
        舉例來說，我目前游標在第 20 列，且已經複製了 10 列資料。
        則按下 p 後， 那 10 列資料會貼在原本的 20 列之後，亦即由 21 列開始貼。但如果是按下 P 呢？ 那麼原本的第 20 列會被推到變成 30 列。

:w [filename]	將編輯的資料儲存成另一個檔案（類似另存新檔）

:r [filename]	在編輯的資料中，讀入另一個檔案的資料。亦即將 『filename』 這個檔案內容加到游標所在列後面

:n1,n2 w [filename]	將 n1 到 n2 的內容儲存成 filename 這個檔案。

-----------行號-------------
:set nu	顯示行號，設定之後，會在每一列的字首顯示該列的行號
:set nonu	與 set nu 相反，為取消行號！

-----------------關於意外中斷------------------
如果vim沒有照正常程序退出，意外中斷的話，會自動產生一個.swp檔來保存中斷時的資訊，
讓使用者能恢復之前的內容，如果不需要恢復的話，需要手動刪掉這個swp檔，
不然每次用vim開文件系統都會因為判斷swp檔存在，而問你要怎麼處理上次中斷
有以下處理方法
[O]pen Read-Only：打開此檔案成為唯讀檔， 可以用在你只是想要查閱該檔案內容並不想要進行編輯行為時。一般來說，在上課時，
    如果你是登入到同學的電腦去看他的設定檔， 結果發現其實同學他自己也在編輯時，可以使用這個模式；

(E)dit anyway：還是用正常的方式打開你要編輯的那個檔案， 並不會載入暫存檔的內容。不過很容易出現兩個使用者互相改變對方的檔案等問題！不好不好！

(R)ecover：就是載入暫存檔的內容，用在你要救回之前未儲存的工作。 不過當你救回來並且儲存離開 vim 後，還是要手動自行刪除那個暫存檔喔！

(D)elete it：你確定那個暫存檔是無用的！那麼開啟檔案前會先將這個暫存檔刪除！ 這個動作其實是比較常做的！因為你可能不確定這個暫存檔是怎麼來的，所以就刪除掉他吧！哈哈！

(Q)uit：按下 q 就離開 vim ，不會進行任何動作回到命令提示字元。

(A)bort：忽略這個編輯行為，感覺上與 quit 非常類似！ 也會送你回到命令提示字元就是囉！



http://linux.vbird.org/linux_basic/0310vi.php#vim
----------vim可以當作編譯器-------------
可以做語法錯誤提示，挑字補全

---------------vim可以打開多個檔案編輯---------
這樣複製借可以直接貼在另一個檔案上，不用開兩個視窗

-------------vim可以多視窗編輯-----------
通常用在比對之類的

---------------編碼問題------------------
big5 utf8