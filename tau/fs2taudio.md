---
title: "Upgrade to Taudio"
summary: "How to upgrade from Flutter_soud 9.x to Taudio 10.0"
nav_order: 3
---
# Upgrade from Flutter Sound 9.x to Taudio 10.0

It is really simple to upgrade from Flutter Sound 9.x to [Taudio](https://taudio.canardoux.xyz/) 10.0. It will only takes you five minutes,
[Taudio](https://taudio.canardoux.xyz/) is 100% compatible with Flutter Sound because Taudio is actually just a fork of Flutter Sound 9.27.0.

But if you do that, please pay a special attention to the License :
[Taudio](https://taudio.canardoux.xyz/) is released under GPL-3 (The GNU Public License) and this license has
a very strong copyleft clause. If your App depends on [Taudio](https://taudio.canardoux.xyz/) it must be released under the GPL License too.

To upgrade to [Taudio](https://taudio.canardoux.xyz/) just do those four little things:

## 1. Approve the GPL license

This is the first step. Your software must be GPL compliant. You must approve it.

### But what is this famous GPL License ?

You can read all the legally lines if you want. But there are two main things that is important to understand :

- If your App is dependant of `Taudio`, you must publish the sources of your software somewhere. Probably on internet.

- If your App is dependant of `Taudio`, your App must be published under the GPL License too.

### Why is this License so good ?

Because you are perhaps a professional developer. I am a professional developer. If someone like me works freely for some companies it would not be fair for you. Why will your boss pay you, if other people works for free for them? Companies may use GPL software. But they have to give something in exchange.

## 2. Modify your pubspec.yaml

```yaml
dependencies:
  taudio: ^1.0.0
  ```

## 3. Modify your Dart import statement

  ```dart
  import 'package:taudio/taudio.dart';
```

## 4. Reload your dependencies

```
flutter clean
flutter pub get
```

## The Github repo

The [Taudio](https://taudio.canardoux.xyz/) repo is now [Github Taudio](https://github.com/canardoux/taudio/) and not anymore [Github Flutter Sound](https://github.com/canardoux/flutter_sound/).
Please fill your [Taudio](https://taudio.canardoux.xyz/) issues there.
## That's it !

Hopefully, your App continue to work as before.
