---
title: Tau_war
parent: "The τ family"
nav_order: 4
---
![pub version](https://img.shields.io/pub/v/tauwar.svg?style=flat-square)
![Tauweb](https://tauwar.canardoux.xyz/images/TauwarBanner.png)

## Documentation

- ## Etau user : your doc [is here](https://etau.canardoux.xyz/)
- ## The CHANGELOG [is here](https://etau.canardoux.xyz/tau/CHANGELOG.html)

## Tauwar stands with Ukraine!

![PeaceForUkraine](https://etau.canardoux.xyz/images/2-year-old-irish-girl-ukrainian.jpg)
Peace for Ukraine

![PrayForUkraine](https://etau.canardoux.xyz/images/banner.png)
Pray for Ukraine


# Tauwar

`Tauwar` is an [Etau](https://pub.dev/packages/etau) implementation for Flutter on mobiles.

[Etau](https://pub.dev/packages/etau) is the interface and this is what see the App.
So, there are not many things to say about `Tauwar` because this is just an implementation.
The only verb used by the App is `tau()`, which gives the implementation.

You can see all the [Etau project documentation](https://etau.canardoux.xyz/) here.

Example
```dart
import 'package:etau/etau.dart';
import 'package:tau_war/tau_war.dart';

  @override
  void initState() 
  {
        super.initState();
        tau().init().then 
        ((e){
                audioCtx = tau().newAudioContext();
        });
  }

  ...
        // Then all the code depends only on the interface (`etau`)
        dest = audioCtx.destination;
        source = audioCtx.createBufferSource();
        source!.buffer = audioBuffer;
        pannerNode = audioCtx.createStereoPanner();
        pannerNode!.pan.value = pannerValue;
        source!.connect(pannerNode!).connect(dest!);

```

if your App needs to support at the same time Flutter Web And Flutter on mobiles:
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
