#!/bin/bash


#cp -a ../flutter_sound/doc/api tau/fs
#cp -a ../taudio/doc/api tau/taudio
#cp -a ../etau/doc/api tau/etau

rm -rf api
cp -a ../flutter_sound/doc/api .

echo "Add Front matter on top of dartdoc pages"
#----------------------------------------------
for f in $(find api -name '*.html' )
do
        #sed -i  "1i ---" $f
        #gsed -i  "1i toc: false" $f

        #sed -i  "1i ---" $f
        #sed -i  "/^<script src=\"https:\/\/ajax\.googleapis\.com\/ajax\/libs\/jquery\/3\.2\.1\/jquery\.min\.js\"><\/script>$/d" $f

        ed $f >/dev/null << END
1i
---
---
.
w
q
END
done

echo "We don't want a Front Matter in those pages"
#-------------------------------------------------
for f in $(find api -name '*-sidebar.html' )
do
        gsed -i '1,3d' $f
done

echo "Put the API pages in the left menu"
#----------------------------------------
#ed api/index.html << END
#2i
#title: "API ref."
#nav_order: 4
#.
#w
#q
#END

ed api/player/player-library.html  >/dev/null << END
2i
title: "Player lib"
parent: "API ref."
nav_order: 1
.
w
q
END


ed api/player/FlutterSoundPlayer-class.html  >/dev/null << END
2i
title: "Player class"
parent: "Player lib"
nav_order: 1
.
w
q
END


ed api/recorder/recorder-library.html  >/dev/null << END
2i
title: "Recorder lib"
parent: "API ref."
nav_order: 2
.
w
q
END


ed api/recorder/FlutterSoundRecorder-class.html  >/dev/null << END
2i
title: "Recorder class"
parent: "Recorder lib"
nav_order: 1
.
w
q
END



ed api/helper/helper-library.html  >/dev/null << END
2i
title: "Helper lib"
parent: "API ref."
nav_order: 3
.
w
q
END


ed api/helper/FlutterSoundHelper-class.html  >/dev/null << END
2i
title: "Helper class"
parent: "Helper lib"
nav_order: 1
.
w
q
END



exit 0
