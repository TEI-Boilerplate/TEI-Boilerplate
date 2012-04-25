#!/bin/sh
cp -r trunk teibp 
rm -rf `find teibp -type d -name .svn`
zip -r teibp_$1.zip teibp
rm -rf teibp
