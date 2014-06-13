#!/bin/sh

set -e

if [ $# -eq 0 ]; then
  echo "No tag supplied. Usage: ./update.sh 2.0.0-rc5"
  exit 1
fi

TAG=$1
EXTRACT_DIRECTORY="$$$(date "+%Y%m%d%H%M%S")"
FILE_NAME="$EXTRACT_DIRECTORY.tar.gz"
RELEASE_URL="https://github.com/guillaumepotier/Parsley.js/archive/$TAG.tar.gz"
RELEASE_PATH="$EXTRACT_DIRECTORY/Parsley.js-$TAG"

VENDOR_JS_PATH="vendor/assets/javascripts"
VENDOR_CSS_PATH="vendor/assets/stylesheets"

wget -O $FILE_NAME $RELEASE_URL 
mkdir $EXTRACT_DIRECTORY
tar xfz $FILE_NAME -C $EXTRACT_DIRECTORY

cp "$RELEASE_PATH/dist/parsley.js" $VENDOR_JS_PATH
cp "$RELEASE_PATH/dist/parsley.remote.js" $VENDOR_JS_PATH
cp "$RELEASE_PATH/src/parsley.css" $VENDOR_CSS_PATH

for file in "$RELEASE_PATH/src/i18n/"*; do
  base_name=$(basename "$file")
  final_name="parsley.i18n.$(echo $base_name)"
  cp $file "$VENDOR_JS_PATH/$final_name"
done


rm -rf $FILE_NAME $EXTRACT_DIRECTORY
