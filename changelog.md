# 變更記錄 Change Log

## v2

* client
  - 繼承自 `node:latest`
  - 移除 cron，改在 `docker-entrypoint.sh` 內使用迴圈執行
  - 新增 current 追蹤
  - /etc/motd 顯示登入公告
* dashboard
  - 繼承自 `node:latest`
  - 移除 scoreboard，使用 nodejs 改寫 dashboard
  - 使用 socket.io 來即時更新資料
  - 新增 current 追蹤
  - 使用 vue.js 改寫
  - 移除 ssh，請講師改用 `docker exec dashboard bash`
  - 收到不存在的 mid 時自動更新 ssh ports
  - /etc/motd 顯示登入公告
  - 程式碼改用 git submodule，取代之前的 Dockerfile
* scoreboard
  - 已移除
* install
  - 新增 Ubuntu 16.04 專用安裝腳本
* Doc
  - 改寫 student.md
  - 改寫 install.md
  - 新增 teacher.md
  - 新增 changelog.md

## v1

* client
  - 繼承自 `ubuntu:14.04`
  - 使用 cron 每分鐘回報解題進度
  - 開啟 ssh 以供學員連線
  - 預設密碼 `git-it`，登入後強制改密碼
  - 已預先裝好 git 和 git-it
* scoreboard
  - 繼承自 `ubuntu:14.04`
  - 顯示解題進度
  - 顯示 ssh port
  - 使用 Laravel 開發
  - 開啟 ssh 以供講師連線
* port-reporter.sh
  - 回報 port
* Doc
  - 新增 student.md
  - 新增 install.md
