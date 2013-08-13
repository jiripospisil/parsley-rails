#!/bin/sh

set -e

if [ $# -eq 0 ]; then
  echo "No tag supplied. Usage: ./update.sh 1.1.10"
  exit 1
fi

TAG=$1
EXTRACT_DIRECTORY="$$$(date "+%Y%m%d%H%M%S")"
FILE_NAME="$EXTRACT_DIRECTORY.tar.gz"
RELEASE_URL="https://github.com/guillaumepotier/Parsley.js/archive/$TAG.tar.gz"
RELEASE_PATH="$EXTRACT_DIRECTORY/Parsley.js-$TAG"

VENDOR_PATH="vendor/assets/javascripts"

wget -O $FILE_NAME $RELEASE_URL 
mkdir $EXTRACT_DIRECTORY
tar xfz $FILE_NAME -C $EXTRACT_DIRECTORY

cp "$RELEASE_PATH/parsley.js" $VENDOR_PATH
cp "$RELEASE_PATH/parsley.extend.js" $VENDOR_PATH

for file in "$RELEASE_PATH/i18n/"*; do 
  base_name=${file##*/}
  final_name="parsley.i18n.$(echo $base_name | cut -d "." -f2).js"
  cp $file "$VENDOR_PATH/$final_name"
done

for file in "$RELEASE_PATH/l10n/"*; do 
  base_name=${file##*/}
  final_name="parsley.l10n.$(echo $base_name | cut -d "." -f2).js"
  cp $file "$VENDOR_PATH/$final_name"
done

rm -rf $FILE_NAME $EXTRACT_DIRECTORY
