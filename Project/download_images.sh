#!/bin/bash
# ============================================================
# TZ ARCHI — 项目图片下载脚本
# 用法：在终端 cd 到本脚本所在目录，然后运行：
#   chmod +x download_images.sh
#   ./download_images.sh
# ============================================================

BASE="$(cd "$(dirname "$0")" && pwd)"
UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36"
REF="https://www.tzarchi.com.au/"

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

dl() {
  local url="$1"
  local dest="$2"
  mkdir -p "$(dirname "$dest")"
  curl -sL --max-time 30 \
    -H "User-Agent: $UA" \
    -H "Referer: $REF" \
    "$url" -o "$dest"
  local size
  size=$(wc -c < "$dest" 2>/dev/null || echo 0)
  if [ "$size" -gt 10000 ]; then
    echo -e "  ${GREEN}✓${NC} $(basename "$dest")  ($(( size / 1024 )) KB)"
  else
    echo -e "  ${RED}✗${NC} $(basename "$dest")  — 下载失败，请手动保存"
    rm -f "$dest"
  fi
}

echo ""
echo "================================================"
echo "  TZ ARCHI — 项目图片下载"
echo "  保存路径: $BASE"
echo "================================================"
echo ""

# ── Stott St_Preston ────────────────────────────
echo "📁 Stott St_Preston"
dl "https://images.squarespace-cdn.com/content/v1/5f26780bade9983a003077b1/1624865744666-6KB01D5BDBESY7TNMB3Z/Entry4_Char_1+-+Photo.jpg" \
   "$BASE/Stott St_Preston/images/Stott St_Preston_Pic 1.jpg"
dl "https://images.squarespace-cdn.com/content/v1/5f26780bade9983a003077b1/1624865465695-15HNXYXRH4WJ1YYEFMYA/Entry4_Char_1+-+Photo.jpg" \
   "$BASE/Stott St_Preston/images/Stott St_Preston_Pic 2.jpg"
dl "https://images.squarespace-cdn.com/content/v1/5f26780bade9983a003077b1/1624865641105-F0G9HOQLXWKXNNAJ5NJ1/Entry4_Char_2+-+Photo.jpg" \
   "$BASE/Stott St_Preston/images/Stott St_Preston_Pic 3.jpg"

echo ""

# ── Orchard House_Eltham ────────────────────────
echo "📁 Orchard House_Eltham"
dl "https://images.squarespace-cdn.com/content/v1/5f26780bade9983a003077b1/1596544334764-XIW6ZQIYRJAQIH75A3RY/20200301.jpg" \
   "$BASE/Orchard House_Eltham/images/Orchard House_Eltham_Pic 1.jpg"
dl "https://images.squarespace-cdn.com/content/v1/5f26780bade9983a003077b1/1596544562040-7MWM1MP4EQT2CCKVU7KK/20200220_3+-+Photo.jpg" \
   "$BASE/Orchard House_Eltham/images/Orchard House_Eltham_Pic 2.jpg"

echo ""

# ── Bona Vista_Bayswater ────────────────────────
echo "📁 Bona Vista_Bayswater"
dl "https://images.squarespace-cdn.com/content/v1/5f26780bade9983a003077b1/1596544214673-1UYCVAHKQJPMGIX2C5SE/6+Bona+Vista_Marketing+Set_Page_4.jpg" \
   "$BASE/Bona Vista_Bayswater/images/Bona Vista_Bayswater_Pic 1.jpg"
dl "https://images.squarespace-cdn.com/content/v1/5f26780bade9983a003077b1/1596464303383-1O7I55VBQM03GV1OCJZ4/6+Bona+Vista_Marketing+Set_Page_5.jpg" \
   "$BASE/Bona Vista_Bayswater/images/Bona Vista_Bayswater_Pic 2.jpg"
dl "https://images.squarespace-cdn.com/content/v1/5f26780bade9983a003077b1/1596464194868-FODFP8O726UD64OS1SON/6+Bona+Vista_Marketing+Set_Page_7.jpg" \
   "$BASE/Bona Vista_Bayswater/images/Bona Vista_Bayswater_Pic 3.jpg"
dl "https://images.squarespace-cdn.com/content/v1/5f26780bade9983a003077b1/1596464193790-XX22KA7UQ93KLC7T8WQA/6+Bona+Vista_Marketing+Set_Page_8.jpg" \
   "$BASE/Bona Vista_Bayswater/images/Bona Vista_Bayswater_Pic 4.jpg"
dl "https://images.squarespace-cdn.com/content/v1/5f26780bade9983a003077b1/1596464191375-VTPPZ54X8UUNDKQNWOCU/6+Bona+Vista_Marketing+Set_Page_9.jpg" \
   "$BASE/Bona Vista_Bayswater/images/Bona Vista_Bayswater_Pic 5.jpg"

echo ""

# ── Ellingworth_Boxhill ─────────────────────────
echo "📁 Ellingworth_Boxhill"
dl "https://images.squarespace-cdn.com/content/v1/5f26780bade9983a003077b1/1596544381540-003XPW6680M3IVWAHXDM/CW19010_Photo+-+2.jpg" \
   "$BASE/Ellingworth_Boxhill/images/Ellingworth_Boxhill_Pic 1.jpg"
dl "https://images.squarespace-cdn.com/content/v1/5f26780bade9983a003077b1/1596544428274-PRKVYZE3Z59BTZHEVM29/CW19010_Photo+-+3.jpg" \
   "$BASE/Ellingworth_Boxhill/images/Ellingworth_Boxhill_Pic 2.jpg"

echo ""
echo "================================================"
echo "  完成！图片已保存到各项目 images/ 文件夹"
echo "================================================"
echo ""
