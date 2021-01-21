#!/bin/bash

if [ $# -ne 4 ]
then
  echo Usage: ./addSite.sh mysubdomain protocol host.ip port
  exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
BASE_DIR=$(dirname "$DIR")

cp $BASE_DIR/site.template ./temp.site
sed -i "s/SUBDOMAIN/$1/g" temp.site
sed -i "s/PROTOCOL/$2/g" temp.site
sed -i "s/HOST/$3/g" temp.site
sed -i "s/PORT/$4/g" temp.site
mv temp.site $BASE_DIR/config/sites/$1
