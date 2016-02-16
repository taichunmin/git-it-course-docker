# 安裝

用來建立 git-it 課程所需的 Docker，以及排行榜。

## 環境

使用 `DigitalOcean` 的 `Ubuntu Docker 1.10.1 on 14.04`

> 如何在 Ubuntu 上安裝 Docker 可參考：<https://docs.docker.com/engine/installation/>

## 安裝 tmux (建議)

```bash
sudo apt-get install tmux
```

## 設定 swap (建議)

如果開的機器 RAM 較小，則建議手動新增 swap 以供 Docker 使用 (但是不建議使用在 SSD 硬碟上，會增加硬碟的損耗)。

> 參考網址
>
> 1. <https://www.digitalocean.com/community/tutorials/how-to-add-swap-on-ubuntu-14-04>

```bash
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

## 安裝 docker-compose

請注意 Docker Compose 的版本。

> 參考網址
>
> 1. <https://docs.docker.com/compose/install/>

```bash
curl -L https://github.com/docker/compose/releases/download/1.6.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version
```

## 安裝 git

```bash
sudo apt-get install git
```

## 下載 git-it-course-docker

```bash
git clone https://github.com/taichunmin/git-it-course-docker.git
cd ~/git-it-course-docker/
```

## 幫腳本增加執行權限

```bash
chmod +x port-reporter.sh
```

## 使用 `docker-compose` 開啟機器

```bash
docker-compose up -d
```

> `-d` 是代表以 daemon 模式執行。

## 開啟多台 client 機器

```bash
docker-compose scale client=5
./port-reporter.sh
```

> `client` 的數量自由增減

## 查看 client 的 22 port 對應

* 直接在 host 執行以下兩種指令的其中一個

```bash
docker-compose ps
docker ps --filter "label=role=git-it-client" --format "{{.ID}} = {{.Ports}}" | sort
```

* 在 scoreboard 上面查看

需要先執行 `./port-reporter.sh` 將最新的 port 對應傳送給計分板，即可在計分板上面直接看到 ssh 的 port 對應。

```
./port-reporter.sh
```

## 查看資源使用量

```bash
docker stats
```

# 查看 git-it 計分板

* <http://localhost/>
