# 學員說明文件

歡迎！本課程將透過 `git-it` 帶領大家進入 `git` 的世界，

## 等候講師分配伺服器

請用瀏覽器開啟儀表板（向講師詢問網址），講師將會為每位學員準備一個尚未被認領的 Docker 容器（第一欄沒有人的圖案），以便練習 `git-it`。

請查看儀表板，並且使用以下資訊登入。

* host: 跟儀表板相同
* port: 請看儀表板
* user: `root`
* pass: `git-it`

## 在 windows 使用 ssh

Secure Shell（縮寫為SSH），由IETF的網路工作小組（Network Working Group）所制定；SSH為一項建立在應用層和傳輸層基礎上的安全協定，為電腦上的Shell（殼層）提供安全的傳輸和使用環境。

### 下載 `putty.exe`

* 官方網站：<http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html>
* 直接下載：<http://the.earth.li/~sgtatham/putty/latest/x86/putty.exe>

### 輸入連線資訊

![](http://i.imgur.com/y0lFdnP.png)

於 `Host Name (or IP address)` 填寫講師所告知的 host，`Port` 填寫講師所告知的 port。

### 輸入帳號密碼

* 請輸入預設使用者名稱 `root`
* 請輸入預設密碼 `git-it`
* 接下來會提示你改密碼，請輸入兩次一樣的密碼
* 改完密碼後會自動斷線
* 再重新連線至機器
* 輸入你剛剛設定的新密碼
* 如果忘記密碼請找講師

## 在 Linux 或 Mac 使用 ssh

```shell
# 請自行替換 [host] 和 [port]
ssh root@[host] -p [port]
```

* 請輸入預設密碼 `git-it`
* 接下來會提示你改密碼，請輸入兩次一樣的密碼
* 改完密碼後會自動斷線
* 再重新連線至機器
* 輸入你剛剛設定的新密碼
* 如果忘記密碼請找講師

## git-it 使用教學

* 關卡說明 <http://jlord.us/git-it/index-zhtw.html>

```sh
# 選擇題目
git-it
# 驗證是否完成
git-it verify
```

## nano 使用教學

```sh
nano readme.txt
```

## vim 使用教學

```sh
vim readme.txt
```
