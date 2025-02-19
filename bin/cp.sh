#!/bin/bash


cp index.md README
gsed -i '1,6d' README


cp -v ../etau-doc/index.md  tau/family/etau.md
gsed -i '1,6d'  tau/family/etau.md

ed tau/family/etau.md  >/dev/null << END
1i
---
title: Etau
parent: ""The τ family""
nav_order: 1
---
.
w
q
END

exit 0
