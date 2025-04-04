---
title: Etau
parent: "The τ family"
nav_order: 2
---
![pub version](https://img.shields.io/pub/v/etau.svg?style=flat-square)
![Etau](https://etau.canardoux.xyz/images/EtauBanner.png)

## Documentation

- ## Etau user : your doc [is here](https://etau.canardoux.xyz/)
- ## The CHANGELOG [is here](https://etau.canardoux.xyz/tau/CHANGELOG.html)

## Etau stands for Ukraine!

![PeaceForUkraine](https://etau.canardoux.xyz/images/2-year-old-irish-girl-ukrainian.jpg)
Peace for Ukraine

![PrayForUkraine](https://etau.canardoux.xyz/images/banner.png)
Pray for Ukraine

## Overview

This is (will be) a port on flutter of the [W3C Web Audio API](https://www.w3.org/TR/webaudio-1.1).
`Etau` is actually in a developement state. It is an Alpha version. Even not yet a Beta version. 

There are many things to do before you can use it. Specially:

- A documentation (TODO)
- A support of the three main platforms:
   - Web
   - iOS (TODO)
   - Android (TODO)

The Web Audio API is terrific:

- It is a [W3C recommandation](https://www.w3.org/TR/webaudio-1.1)
- It has a great [documentation from Moziilla](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API)
- It is really powerful
- It is simple to use

## The W3C Web Audio API recommandation

Because the Web Audio API is a W3C recommandation, you can find very good documentations on the Web. Of course, the [Mozilla documentation](https://developer.mozilla.org/en-US/docs/Web/API/Web_Audio_API) but also from other sources.

In a few words, the Web Audio API let you assembly "nodes" as a chain of nodes in order to process a stream of audio data, from a Source Node (perhaps the mic), to a Destination Node (perhaps the speaker), threw several nodes able to process the sound (echo, analyzer, panner, distorder, ...). But you really should look to the Mozilla documentation which is very good (and better than my poor english ;-) ).

You will have to ask yourself if you must use [Taudio](https://pub.dev/packages/taudio) (which is just a wrapper around `Etau`), or directly `Etau`.
The W3C recommandation is powerful but simple to use. There are probably no many reasons to use `Taudio` any longer.

## `Etau` Structure

`Etau` is a Flutter API allowing the App to use the W3C Web Audio API.
This is an interface: this is what the App see and access.
Because this is an interface, the App must import an implementation.
Several implementations are possible. Actually we are developping two implementations:

- [Tauweb](https://pub.dev/packages/tau_web), which is an implementation for Flutter Web
- [Tauwar](https://pub.dev/packages/tau_war), which is an implementation for mobiles

The app must import one (or several) implementations. But except for this import, the App does not access them.
It alway access `Etau` which is the interface. This allows the App to have a unic code for various platforms.

## Examples \(Demo Apps\)

`Etau` comes with several [Demo/Examples]:
- [Simple basic examples](https://github.com/Canardoux/etau/tree/main/example/lib/BasicEx) showing how to use `Etau`
- A port of all the [Mozilla examples](https://github.com/Canardoux/etau/tree/main/example/lib/MozillaEx), using Dart instead of JS ofcourse. These Mozilla examples are also very simple, and can be looked at instead of our basic examples.

You can run a live view of these examples [here](https://etau.canardoux.xyz/live/index.html).

## License

`Etau` is (will be) released under the Gnu Public Licence v3 (GPL v3).

## The Tau family

The `Tau` family is composed with:

- `Etau` (which is a port on Flutter of the W3C Web Audio API)
- [Flutter Sound](https://pub.dev/packages/flutter_sound) (the legacy plugin developed for many years)
- [Tauweb](https://pub.dev/packages/tau_web) (which is the `Etau` implementation for Flutter Web)
- [Tauwar](https://pub.dev/packages/tau_war) (which is the `Etau` implementation for mobiles)
- [Taudio](https://pub.dev/packages/taudio) (which is something like Flutter Sound 10.0)

The `Etau` project is actually being developed.

Actually this is only a place holder.


## We need help

We greatly appreciate any contributions to the project which can be as simple as providing feedback on the API or documentation.

Actually, I am almost alone to maintain and develop three important projects :
- Flutter Sound 9.x
- Taudio (flutter Sound 10.0)
- Etau

This is too much work on my shoulders. We desesperatly need at least one other developer.

## Thanks

### If you like my work, you can click on the `Thumb up` button of the top of the [pub.dev page](https://pub.dev/packages/etau) This is free and this will reassure me that **I do not spend most of my life for nobody**.
