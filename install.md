# 安裝

用來建立 git-it 課程所需的 Docker，以及儀表板。

## 環境

使用 `DigitalOcean` 的 `Ubuntu 20.04`

* 透過[這個連結](https://m.do.co/c/81327b020798)註冊 DigitalOcean 來給我一點小費。

## 取得本專案並安裝

**注意:** 本 `install.sh` 僅適用於 `Ubuntu 20.04`

```shell
git clone https://github.com/taichunmin/git-it-course-docker.git
cd git-it-course-docker
sudo bash ./install.sh
```

## 使用 `docker-compose` 開啟機器

```shell
# 預設只會開啟 1 台 client
docker-compose up -d
# 可以下這個指令增加或減少 client 到指定數量
yarn scale 3
# 若要全部關掉，請使用以下指令
docker-compose down
```
