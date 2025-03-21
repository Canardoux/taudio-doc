---
title: "Upgrade to Taudio"
summary: "How to upgrade from Flutter_soud 9.x to Taudio 10.0"
nav_order: 3
---
# Upgrade from Flutter Sound 9.x to Taudio 10.0

It is really simple to upgrade from Flutter Sound 9.x to Taudio 10.0.
Taudio is 100% compatible with Flutter Sound because Taudio is actually just a port of Flutter Sound 9.26.0

But if you do that, please pay a special attention to the License :
Taudio is released under GPL-3 (The GNU Public License) and this license has
a very strong copyleft clause.

To upgrade to Taudio just do those two little things:

## Modify your pubspec.yaml

```yaml
dependencies:
  taudio: ^1.0.0
  ```

## Modify your Dart import statement

  ```dart
  import 'package:taudio/taudio.dart';
```

## That's it !

Hopefully, your App continue to work as before.
