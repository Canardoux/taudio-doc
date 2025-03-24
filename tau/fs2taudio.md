---
title: "Upgrade to Taudio"
summary: "How to upgrade from Flutter_soud 9.x to Taudio 10.0"
nav_order: 3
---
# Upgrade from Flutter Sound 9.x to Taudio 10.0

It is really simple to upgrade from Flutter Sound 9.x to [Taudio](https://taudio.canardoux.xyz/) 10.0.
[Taudio](https://taudio.canardoux.xyz/) is 100% compatible with Flutter Sound because Taudio is actually just a fork of Flutter Sound 9.26.0.

But if you do that, please pay a special attention to the License :
[Taudio](https://taudio.canardoux.xyz/) is released under GPL-3 (The GNU Public License) and this license has
a very strong copyleft clause.

To upgrade to [Taudio](https://taudio.canardoux.xyz/) just do those two little things:

## Modify your pubspec.yaml

```yaml
dependencies:
  taudio: ^1.0.0
  ```

## Modify your Dart import statement

  ```dart
  import 'package:taudio/taudio.dart';
```

## The Github repo

The [Taudio](https://taudio.canardoux.xyz/) repo is now [Github Taudio](https://github.com/canardoux/taudio/) and not anymore [Github Flutter Sound](https://github.com/canardoux/flutter_sound/).
Please fill your [Taudio](https://taudio.canardoux.xyz/) issues there.
## That's it !

Hopefully, your App continue to work as before.
