# 講師說明文件

## 查看 client 的 22 port 對應

* 在 dashboard 上面查看（直接使用瀏覽器連線至該機器的 IP 或是網址）
* 若網頁無法查看可用以下指令來查看

```shell
yarn clients
```

## 查看資源使用量

```shell
yarn status
```

## 管理員直接進入指定的 client (忘記密碼)

若學員發生忘記密碼的狀況，管理員可從主機內強制進入該容器：

```shell
# 先透過以下指令確認要進去哪一個容器
$ yarn ps
NAME                            COMMAND                  SERVICE             STATUS              PORTS
git-it-course-docker_client_1   "docker-entrypoint.s…"   client              running             0.0.0.0:57788->22/tcp
# 假設我想要進入 client_4
$ yarn clientbash 4
# 使用 passwd 更改密碼
$ passwd
```

## 修改學員登入後的說明

* 請直接修改 `./client/motd`，可使用 linux 的色碼。
* 不需重啟機器，因為是透過 docker volume 掛進去的

![Imgur](https://i.imgur.com/rPGuIwL.png)
