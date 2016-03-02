# git-it 課程 Docker

![排行榜圖片](http://i.imgur.com/CO2v5fm.png)

歡迎光臨！

這個專案是為了要在課堂上帶領學員透過使用 git-it 來練習 git。

本專案的使用情境是，講師預先找一台機器，或是直接在 DigitalOcean 開啟一個足夠效能的雲端伺服器，然後在伺服器上開啟一個計分板容器和無數個 git-it 的容器。

git-it 容器是給學員透過使用 git-it 來練習 git，在 client 的 Dockerfile 裡面已經預先安裝好了 git-it、git、nano、vim。學員可使用 ssh 來連線到 git-it 容器。在 windows 環境下，可以使用 `putty` 進行連線，在 Unix-like 環境下直接使用 ssh 進行連線即可。git-it 容器的預設帳號為 `root`，預設密碼為 `git-it`，在學員第一次登入時會強制更改密碼。

記分板容器是用來追蹤每個學員 git-it 的闖關進度，以便學員互相幫助，以及方便講師掌控學員的進度使用。git-it 容器的預設帳號為 `root`，預設密碼為 `scoreboard`，在第一次登入時會強制更改密碼。**「講師請務必先連至記分板容器修改 root 密碼」**

最後，底下的幾個連結，有更詳盡的專案說明：

* [學員說明文件](student.md)
* [講師說明文件](teacher.md)
* [安裝說明](install.md)
* [使用 DockerCloud](dockercloud.md)

如有任何建議，請多指教。
