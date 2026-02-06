#!/usr/bin/env bash
set -euo pipefail

echo "[+] EcoFlux Beta Sync"

VERSION="${VLC_VERSION:?missing}"
BASE_URL="${BASE_URL:?missing}"

TMP_DIR="tmp"
rm -rf "$TMP_DIR"
mkdir -p "$TMP_DIR"

APK_PAGE="${BASE_URL}${VERSION}/"

echo "Version : $VERSION"
echo "Page    : $APK_PAGE"

# Get ONLY first matching arm64 apk filename (single line)
APK_NAME=$(curl -s "$APK_PAGE" \
  | grep -o 'VLC-Android-[^"]*arm64-v8a\.apk' \
  | head -n1 \
  | tr -d '\r\n')

if [ -z "$APK_NAME" ]; then
  echo "arm64-v8a APK not found"
  exit 1
fi

APK_URL="${APK_PAGE}${APK_NAME}"

echo "APK     : $APK_NAME"
echo "URL     : $APK_URL"

curl -L --fail "$APK_URL" -o "$TMP_DIR/$APK_NAME"

echo "[✓] Download complete"
