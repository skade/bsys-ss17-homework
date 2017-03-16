#!/usr/bin/env bash

# Checks
# - rustfmt

# config
FOLDER="hw*"
FILES='.+\.(rs)'


# Exit script on the first error
set -o errexit -o nounset

ERROR=0


### rustfmt ===================================
echo ""
echo "=== Searching for files with rustfmt warnings ========================"
FOUND=0
while IFS= read -r -d '' f; do
if  [ "$(rustfmt --write-mode=diff "$f")" != $'' ]  ; then
    echo "rustfmt warnings found in $f"
    FOUND=1
fi
done < <(find -E . -path "./$FOLDER" -iregex $FILES -print0)

if [ $FOUND -eq 0 ] ; then
echo "=== None found! :-)"
else
echo ""
echo "!!! Some files with rust format warninge were found."
echo "!!! Please correct format in these files by running rustfmt!"
ERROR=1
fi



test $ERROR == 0
