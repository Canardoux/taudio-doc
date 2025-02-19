#!/bin/bash




rm -rf live
cp -r ../flutter_sound/example/build/web live
if [ $? -ne 0 ]; then
    echo "Error"
    exit -1
fi


exit 0
