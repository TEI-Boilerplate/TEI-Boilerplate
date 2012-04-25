#!/bin/sh
USAGE="Usage: `basename $0` version"
if test $# -lt 1
then
  echo "$USAGE"
  exit 1
fi
  
svn cp trunk tags/$1
cp -r trunk teibp 
rm -rf `find teibp -type d -name .svn`
zip -r teibp_$1.zip teibp
rm -rf teibp
echo "teibp_$1.zip package and tags/$1 created.\nDon't forget to check in your working copy."

