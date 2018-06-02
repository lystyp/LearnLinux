http://linux.vbird.org/linux_basic/0110whatislinux.php
作業系統演進的歷史

---------Ｕnix前身-------
為了更加強化大型主機的功能，以讓主機的資源可以提供更多使用者來利用，所以在1965年前後， 
由貝爾實驗室(Bell)、麻省理工學院(MIT)及奇異公司(GE, 或稱為通用電器)共同發起了Multics的計畫，
但後來覺得做不出來，所以貝爾實驗室退出，
但實驗室裡的 Ken Thompson參考之前的計畫用組與寫了一個土炮的作業系統Unics(Unix的前身)

-----------Ｕnix出現------------
後來Thompson與Ritchie合作想將Unics改以高階程式語言來撰寫。當時現成的高階程式語言有B語言。
 但是由B語言所編譯出來的核心效能不是很好。後來Dennis Ritchie (註3) 將B語言重新改寫成C語言，再以C語言重新改寫與編譯Unics的核心， 最後正名與發行出Unix的正式版本！

-------出現分支ＢＳＤ-----------
柏克萊大學的Bill Joy 參考Ｕnix著手修改成適合自己機器的版本， 並且同時增加了很多工具軟體與編譯程式，最終將它命名為Berkeley Software Distribution (BSD)。
這個BSD是Unix很重要的一個分支，Bill Joy也是Unix業者『Sun(昇陽)』這家公司的創辦者！ Sun公司即是以BSD發展的核心進行自己的商業Unix版本的發展的。 
(後來可以安裝在x86硬體架構上面FreeBSD即是BSD改版而來！)

這個時期都還有一大堆不同的cpu，所以大家要用作業系統都要自己寫一套來配合自己的硬體，現在就已經有一個公定的規格了 
就是POSIX，可攜式作業系統介面(Portable Operating System Interface)的縮寫

----------Unix版權被收回－－－－－－－－－－
貝爾實驗室是隸屬於美國電信大廠AT&T公司，
AT&T由於商業的考量，以及在當時現實環境下的思考，於是想Unix的版權收回去。

--------------Minix-----------
 Andrew Tanenbaum 教授自己動手寫了Minix這個Unix Like的核心程式用來教學生，而且還不用付錢買Ｕnix，
 Ｍinix也很佛心賣很便宜還附source code，主要就是教學用的作業系統

-------------GNU計畫－－－－－－－－－－－－
http://linux.vbird.org/linux_basic/0110whatislinux.php#whatislinux_gnu

--------------Linux--------------

Linus Torvalds買了intel的x86的下一版的cpu 386裝起來的電腦，用Ｍinix來跑，但發現Ｍinix根本沒在更新，
所以自己參考Ｍinix寫了Linux初版，為了相容Unix，還照POSIX做了很多修改，然後丟到網路上讓大家繼續更新

--------------Linux不同版本－－－－－－－－－－

為了讓使用者能夠接觸到Linux，於是很多的商業公司或非營利團體， 就將Linux Kernel(含tools)與可運行的軟體整合起來，加上自己具有創意的工具程式，
 這個工具程式可以讓使用者以光碟/DVD或者透過網路直接安裝/管理Linux系統。 這個『Kernel + Softwares + Tools + 可完整安裝程序』的咚咚，我們稱之為Linux distribution

 就是把之前的Linux(只有基礎跟cpu溝通)，就是shell層的下一層，
 又加上一堆有的沒的軟體跟驅動，包成一包Linux base的作業系統，例如在台灣有名的Red Hat, SuSE, Ubuntu, Fedora, Debian等等
 為了讓所有的Linux distributions開發不致於差異太大，且讓這些開發商在開發的時候有所依據，還有Linux Standard Base (LSB)等標準來規範開發者，
 以及目錄架構的File system Hierarchy Standard (FHS)標準規範！ 唯一差別的，可能就是該開發者自家所開發出來的管理工具，以及套件管理的模式

 －－－－－－－－－－－－－－－－－mac 與 linux
 https://www.ptt.cc/bbs/Linux/M.1411503340.A.6A8.html
mac base on ＢＳＤ，從這裡就開始與Ｌinux分支了