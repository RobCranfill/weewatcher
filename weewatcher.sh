#!/bin/bash
# check how old the Crandard file is, and copy the "down" file if it's too old.

CHECK_FILE='/var/www/html/weather/Crandard/index.html'
DOWN_FILE=index-down.html

TOO_MANY_SECONDS=$((600))

echo Checking file $CHECK_FILE...

MOD_SECONDS=`stat -c %Y $CHECK_FILE`
NOW_SECONDS=`date +%s`
DELTA=$((NOW_SECONDS - MOD_SECONDS))

echo "Current time:  $NOW_SECONDS"
echo "File modified: $MOD_SECONDS"
echo "Delta: $DELTA seconds"

if [ "$DELTA" -gt "$TOO_MANY_SECONDS" ]; then
    echo "Copying 'down' file!"
    cp $DOWN_FILE $CHECK_FILE
fi
