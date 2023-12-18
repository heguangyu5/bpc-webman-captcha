#!/bin/bash

[[ "$1" == "" ]] && {
    echo "Usage: ./bpc-prepare.sh src.list"
    exit
}

rm -rf ./Webman/Captcha
rsync -a                        \
      --exclude=".*"            \
      -f"- Webman/"                \
      -f"+ */"                  \
      -f"- *"                   \
      ./                        \
      ./Webman/Captcha

echo "placeholder-captcha.php" > ./Webman/src.list

for i in `cat $1`
do
    if [[ "$i" == \#* ]]
    then
        echo $i
    else
        echo "Captcha/$i" >> ./Webman/src.list
        filename=`basename -- $i`
        if [ "${filename##*.}" == "php" ]
        then
            echo "phptobpc $i"
            phptobpc $i > ./Webman/Captcha/$i
        else
            echo "cp       $i"
            cp $i ./Webman/Captcha/$i
        fi
    fi
done
cp bpc.conf Makefile ./Webman/
