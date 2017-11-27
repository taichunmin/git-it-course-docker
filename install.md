# 安裝

用來建立 git-it 課程所需的 Docker，以及儀表板。

## 環境

使用 `DigitalOcean` 的 `Ubuntu 16.04`

* 透過[這個連結](https://m.do.co/c/81327b020798)註冊 DigitalOcean 來給我一點小費。

## 取得本專案並安裝

**注意:** 本 `install.sh` 僅適用於 `Ubuntu 16.04`

```shell
git clone https://github.com/taichunmin/git-it-course-docker.git
cd git-it-course-docker
bash ./install.sh
```

## 設定 swap (建議)

如果開的機器 RAM 較小，則建議手動新增 swap 以供 Docker 使用 (但是不建議使用在 SSD 硬碟上，會增加硬碟的損耗)。

> 參考網址
>
> 1. <https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04>

```shell
sudo swapon -s
free -m
df -h
sudo fallocate -l 4G /swapfile
ls -lh /swapfile
sudo chmod 600 /swapfile
ls -lh /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
sudo swapon -s
free -m
sudo echo '/swapfile none swap sw 0 0' >> /etc/fstab
sudo sysctl vm.swappiness=10
sudo echo 'vm.swappiness = 1' >> /etc/sysctl.conf
sudo sysctl vm.vfs_cache_pressure=50
sudo echo 'vm.vfs_cache_pressure = 50' >> /etc/sysctl.conf
```

## 使用 `docker-compose` 開啟機器

```shell
# 預設只會開啟 1 台 client
docker-compose up -d
# 可以下這個指令增加或減少 client 到指定數量 (已經執行過 docker-compose up -d 也可重複下)
docker-compose up -d --scale client=3
# 若要全部關掉，請使用以下指令
docker-compose down
```

> `-d` 是代表以 daemon 模式執行。  
> `--scale client=3` 是指定 client 需開 3 台  
> `client` 的數量自由增減  
