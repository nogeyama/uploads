#!/bin/sh

MDIR=/var/lib/motion

cd $MDIR

touch $MDIR/start.log
touch $MDIR/old.ls
touch $MDIR/new.ls
cp /dev/null $MDIR/old.ls
rm $MDIR/*.jpg


set -x 

while :
do
  ls $MDIR/*.jpg > $MDIR/new.ls
  diff $MDIR/old.ls $MDIR/new.ls | grep '> ' | sed 's:^> /var/lib/motion/::1' > $MDIR/diff.ls
  cat $MDIR/diff.ls | xargs -IXXXX bash -c "echo === XXXX; $MDIR/myUploadJpg1.sh XXXX; $MDIR/myWpPostContent1.sh XXXX"
  cat $MDIR/diff.ls | xargs -IXXXX echo "==================" XXXX | tee -a $MDIR/start.log
  cat $MDIR/diff.ls | xargs -IXXXX rm  $MDIR/XXXX
  cp $MDIR/new.ls $MDIR/old.ls
  sleep 2
done
