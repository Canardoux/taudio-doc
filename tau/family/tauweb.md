---
title: Tauweb
parent: "The τ family"
nav_order: 3
---
        source!.buffer = audioBuffer;
        pannerNode = audioCtx.createStereoPanner();
        pannerNode!.pan.value = pannerValue;
        source!.connect(pannerNode!).connect(dest!);

```

if your App needs to support at the same time Fliutter Web And Flutter on mobiles:
```dart
import 'package:etau/etau.dart';
import 'package:etau/dummy.dart'
  if (dart.library.js_interop) 'package:tau_web/tau_web.dart'
  if (dart.library.io) 'package:tau_war/tau_war.dart';

  @override
  void initState() 
  {
        super.initState();
        tau().init().then 
        ((e){
                audioCtx = tau().newAudioContext();
        });
  }
```
