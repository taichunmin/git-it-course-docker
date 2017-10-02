# git-it 課程 Docker

DEMO 影片 ↓↓↓

[![DEMO](http://i.imgur.com/nfHpH04.png)](https://youtu.be/NjcGE-mbIM8 "DEMO")

歡迎光臨！

這個專案是為了要在課堂上帶領學員透過使用 git-it 來練習 git。

本專案的使用情境是，講師預先找一台機器，或是直接在 DigitalOcean 開啟一個足夠效能的雲端伺服器，然後在伺服器上開啟一個儀錶板容器和無數個 git-it 的容器。

git-it 容器是給學員透過使用 git-it 來練習 git，在 client 的 Dockerfile 裡面已經預先安裝好了 git-it、git、nano、vim。學員可使用 ssh 來連線到 git-it 容器。在 windows 環境下，可以使用 `putty` 進行連線，在 Unix-like 環境下直接使用 ssh 進行連線即可。git-it 容器的預設帳號為 `root`，預設密碼為 `git-it`，在學員第一次登入時會強制更改密碼。

儀表板容器是用來追蹤每個學員 git-it 的闖關進度，以便學員互相幫助，以及方便講師掌控學員的進度使用。

最後，底下的幾個連結，有更詳盡的專案說明：

* [安裝說明](install.md)
* [學員說明文件](student.md)
* [講師說明文件](teacher.md)
* [變更記錄](changelog.md)

如有任何建議，請多指教。
