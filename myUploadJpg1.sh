#!/bin/sh
# --anyauth : for digest

MDIR=/var/lib/motion

cd $MDIR

WebDAV_URL='http://ec2-52-196-174-84.ap-northeast-1.compute.amazonaws.com/raspi01/'

if [ $# -ne 1 ]; then
  echo "none" 
  exit 1
fi

set -x 

curl --anyauth --user raspi01user:raspi01user-password01 --upload-file "$MDIR/$1" ${WebDAV_URL}

