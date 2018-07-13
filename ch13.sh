# ---------------------------關於linux使用者的基本概念--------------------------------------

/etc/passwd 是用來存使用者資訊的檔案，
cat /etc/passwd
Result is :
root:x:0:0:root:/root:/bin/bash  
bin:x:1:1:bin:/bin:/sbin/nologin
daemon:x:2:2:daemon:/sbin:/sbin/nologin
adm:x:3:4:adm:/var/adm:/sbin/nologin
...
...
...
直接看網站比較快
http://linux.vbird.org/linux_basic/0410accountmanager.php#passwd_file

/etc/shadow 是用來存密碼相關資訊的
一樣看網站吧! 
http://linux.vbird.org/linux_basic/0410accountmanager.php#shadow_file

/etc/group 描述群組相關資訊
看網站看網站~
http://linux.vbird.org/linux_basic/0410accountmanager.php#group_file

使用者基本分三種類型
1. 系統管理員，UID = 0 就是root啦
2. 系統使用者，UID = 1~999，系統可能會需要跑一些其他程序，或是外部連進系統要執行某些東西也會需要一個使用者的身分，
3. 一般的使用者，UID = other


Mac的使用者管理似乎和一般的linux 不太一樣，也沒有user可以用，所以就先跳過吧！
https://superuser.com/questions/191330/users-dont-appear-in-etc-passwd-on-mac-os-x
管理使用者群組跟使用者等有linux系統再來玩玩看