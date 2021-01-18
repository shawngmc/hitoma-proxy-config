#!/bin/bash

if [ $# -ne 4 ]
then
  echo Usage: ./addSite.sh mysubdomain protocol host.ip port
  exit 1
fi

cp site.template ./temp.site
sed -i "s/SUBDOMAIN/$1/g" temp.site
sed -i "s/PROTOCOL/$2/g" temp.site
sed -i "s/HOST/$3/g" temp.site
sed -i "s/PORT/$4/g" temp.site
mv temp.site ./sites/$1
