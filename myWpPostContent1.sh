#!/bin/sh


if [ $# -ne 1 ]; then
  echo "none"
  exit 1
fi

# $1:"pic-20160925T011939-pic.jpg"


FN01=$1
FN02=`./myModFilename.py $1`

# echo "###" $FN02 "###"


IIDD='RaspberryU1'
PPWW='yfpI hli6 YyAP Aaxx'

PMES_TITLE='投稿'"[$1]"
POST_URL='http://ec2-52-196-174-84.ap-northeast-1.compute.amazonaws.com/blog/wp-json/wp/v2/posts'

TGTIMGURL="http://ec2-52-196-174-84.ap-northeast-1.compute.amazonaws.com/blog/wp-content/uploads/${FN02}"

PMES_CONTENT_LN001="内容<br />"
PMES_CONTENT_LN002="サンプル"

PMES_CONTENT_JPG01="<img class=\\\"alignnone size-medium wp-image-40\\\" src=\\\"${TGTIMGURL}\\\" alt=\\\"${FN01}\\\" >"

PMES_CONTENT_BODY="${PMES_CONTENT_LN001}${PMES_CONTENT_JPG01}${PMES_CONTENT_LN002}"


echo ${PMES_CONTENT_BODY}

curl -X POST \
  -u "${IIDD}:${PPWW}" \
  -H "Content-Type: Application/json" \
  -d "{\"title\":\"${PMES_TITLE}\",  \"content\":\"${PMES_CONTENT_BODY}\",  \"status\":\"publish\"}" \
  ${POST_URL}


echo ""

#EOL
