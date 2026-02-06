#!/usr/bin/env bash
set -euo pipefail

echo "[+] EcoFlux Nightly Sync"

APK_NAME="${APK_NAME:?missing}"
BASE_URL="${BASE_URL:?missing}"

TMP_DIR="tmp"
rm -rf "$TMP_DIR"
mkdir -p "$TMP_DIR"

APK_PAGE="${BASE_URL}"

echo "APK     : $APK_NAME"
echo "Page    : $APK_PAGE"

APK_URL="${APK_PAGE}${APK_NAME}"

echo "URL     : $APK_URL"

curl -L --fail "$APK_URL" -o "$TMP_DIR/$APK_NAME"

echo "[✓] Download complete"
