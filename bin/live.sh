#!/bin/bash



cd ../taudio/example
flutter build web --release
cd ../../taudio-doc


rm -rf live
cp -r ../taudio/example/build/web live
if [ $? -ne 0 ]; then
    echo "Error"
    exit -1
fi


exit 0
