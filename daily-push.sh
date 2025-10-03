#!/bin/bash
set -euo pipefail
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$SCRIPT_DIR/.env"

: "${TEST_REPO_ROOT:?TEST_REPO_ROOT not set}"
cd "$TEST_REPO_ROOT/"

# 現在の日付を取得
DATE=$(date +"%Y-%m-%d %H:%M:%S")
echo $DATE >> update-time.log

# Gitステータスを確認
if [ -z "$(git status --porcelain)" ]; then
    echo "No changes to commit" >> update-time.log
    exit 0
fi

# 全ての変更をステージ
git add -A
git commit -m "Daily automatic update: $DATE"

"$SCRIPT_DIR/git-push.sh"
echo "$DATE - finished" >> update-time.log
