#!/bin/bash
set -euo pipefail
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export GIT_TERMINAL_PROMPT=0

# スクリプトのディレクトリを基準に .env を読む
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$SCRIPT_DIR/.env"

# 必須変数チェック
: "${TEST_REPO_ROOT:?TEST_REPO_ROOT not set}"
: "${GITHUB_TOKEN:?GITHUB_TOKEN not set}"

cd "$TEST_REPO_ROOT"

PUSH_URL="https://x-access-token:${GITHUB_TOKEN}@github.com/${GITHUB_USER}/${GITHUB_REPO}.gi">

git push "$PUSH_URL" HEAD:main --force
echo "Push completed successfully!"
