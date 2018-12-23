第16章主要在講關於系統process的控制

1.一個cmd為一個父process, 可以在父process底下開很多的子process, 並且這些porccess可以用指令 fg, bg 來決定要在前景執行（會佔著cmd不給輸入新指令）或是背景。

2.用 ps (ps -l, ps aux, zombie), top, pstree來觀看個個process的PID和記憶體使用量, 執行時間等等，或用kill關閉之類的行為

3.講述記憶體控管和實體記憶體, 虛擬記憶體（ＳＷＡＰ）的概念，實體記憶體就算閒置的時候被用超多也沒關係，linux本來就會盡可能善用暫存，
    但如果用到swap，表示是ram真的不夠用了，這時候才是真的需要考慮記憶體用太多的問題

4.系統資源的觀察： free, uname, uptime, netstat, dmesg, vmstat
free > 記憶體相關
uname > 硬體資訊根ＯＳ版本之類的
update > 開機時間
nettime > 網路資源相關監控
dmesg > 系統核心相關log(與硬體底層較相關)
vmstat >  CPU / 記憶體 / 磁碟輸入輸出狀態

5.講解SELinux, 全都看不懂，是在寫三小ＱＱ