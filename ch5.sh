-------------關於使用者權限------
關於每個檔案的可使用權限
用
ls -al
來show
http://linux.vbird.org/linux_basic/0210filepermission.php#filepermission_perm

mac的root使用者預設是關閉的，所以su - 會跑不過，要怎麼打開？
https://support.apple.com/zh-tw/ht204012

mac如果是.開頭的檔案就是隱藏檔，不要懷疑，要不要隱藏就是用這樣設定

注意，目錄得可讀權限和其他非目錄的檔案的可讀權限是不一樣的

------------------------
還有提到各種特別的檔案類型
http://linux.vbird.org/linux_basic/0210filepermission.php#filepermission_typed

－
一般執行檔

d
目錄

l
連結檔

b, c
(block, character)
裝置與設備

s
(socket)
資料接口

p
資料輸送檔

----------
接著講到linux的目錄基本配置
是follow FHS規範(Filesystem Hierarchy Standard )
http://linux.vbird.org/linux_basic/0210filepermission.php#dir_fhs_root
