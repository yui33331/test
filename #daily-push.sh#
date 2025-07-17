#!/bin/bash
# Daily automatic git push script

# 現在の日付を取得
DATE=$(date +"%Y-%m-%d %H:%M:%S")
echo $DATE >> update-time.log

# Gitステータスを確認
if [ -z "$(git status --porcelain)" ]; then
    echo "No changes to commit"
    exit 0
fi

# 全ての変更をステージ
git add .

# コミット
git commit -m "Daily automatic update: $DATE"

# git-push.shを使用してプッシュ
"./git-push.sh"
