# 學員說明文件

歡迎！本課程將透過 `git-it` 帶領大家進入 `git` 的世界！

## 為什麼我們要學習 Git

* [寫程式？那些老師沒教的事（Git 部分節錄）](https://www.slideshare.net/taichunmin/git-58403171)

## 等候講師分配伺服器

請用瀏覽器開啟儀表板（向講師詢問網址），講師將會為每位學員準備一個尚未被認領的 Docker 容器（第一欄沒有人的圖案），以便練習 `git-it`。

![Imgur](https://i.imgur.com/nuSKEeG.jpg)

請查看儀表板，並且使用以下資訊登入。

* host: 跟儀表板相同
* port: 請看儀表板
* user: `root`
* pass: `git-it`

## 在 windows 使用 ssh 登入

### 下載 `putty.exe`

* 官方網站：<https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html>
* 直接下載：
  * [64 位元](https://the.earth.li/~sgtatham/putty/latest/w64/putty.exe)
  * [32 位元](https://the.earth.li/~sgtatham/putty/latest/w32/putty.exe)

### 輸入連線資訊

![](http://i.imgur.com/y0lFdnP.png)

於 `Host Name (or IP address)` 填寫講師所告知的 host，`Port` 填寫講師所告知的 port。

![Imgur](https://i.imgur.com/HSnox7W.jpg)

詢問是否要信任遠端主機，按下「是」

### 輸入帳號密碼

![Imgur](https://i.imgur.com/mxPZsz7.jpg)

* 請輸入預設使用者名稱 `root`
* 請輸入預設密碼 `git-it`
* 接下來會提示你改密碼，請輸入兩次一樣的密碼
* 改完密碼後會自動斷線

![Imgur](https://i.imgur.com/6n21uLW.jpg)

* 再重新連線至機器
* 輸入你剛剛設定的新密碼
* 如果忘記密碼請找講師

![Imgur](https://i.imgur.com/k9us6Fr.jpg)

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

## 新增/編輯檔案

```sh
# 推薦使用 nano
nano 檔名
# 如果要存檔，請按 Ctrl + X，然後按 Y，然後再按 Enter
```

## GitHub: Support for password authentication removed

![](https://i.imgur.com/sj111Aa.png)

如果你的遠端網址是 GitHub 的 HTTPS，在 2021/8/13 後你就沒辦法以使用者的帳號密碼登入，解決辦法是在改用 personal access token 當作密碼進行登入。

如何建立 personal access token 請看: https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token
