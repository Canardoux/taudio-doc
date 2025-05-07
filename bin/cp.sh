#!/bin/bash


#cp index.md README
#gsed -i '1,6d' README


cp ../taudio/README.md index.md
cp ../taudio/README.md README.md
ed index.md  >/dev/null << END
1i
---
title: Taudio - 10.3.1
summary: The Taudio Project README.
layout: home
nav_order: 1
---
.
w
q
END


cp ../taudio/CHANGELOG.md tau/CHANGELOG.md
ed tau/CHANGELOG.md  >/dev/null << END
1i
---
title: "CHANGELOG"
summary: The Changelog of the Taudio Project.
nav_order: 8
toc: false
---
.
w
q
END


cp -v ../etau/README.md  tau/family/etau.md
ed tau/family/etau.md  >/dev/null << END
1i
---
title: Etau
parent: "The τ family"
nav_order: 2
---
.
w
q
END


cp -v ../flutter_sound/README.md  tau/family/FlutterSound.md
ed tau/family/FlutterSound.md  >/dev/null << END
1i
---
title: Flutter Sound
parent: "The τ family"
nav_order: 1
---
.
w
q
END


cp -v ../tau_web/README.md  tau/family/tau_web.md
ed tau/family/tau_web.md  >/dev/null << END
1i
---
title: Tau_web
parent: "The τ family"
nav_order: 3
---
.
w
q
END


cp -v ../tau_war/README.md  tau/family/tau_war.md
ed tau/family/tau_war.md  >/dev/null << END
1i
---
title: Tau_war
parent: "The τ family"
nav_order: 4
---
.
w
q
END



exit 0
