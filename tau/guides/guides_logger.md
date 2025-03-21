---
title:  "Logger"
summary: "Debugging logs."
parent: Guides
nav_order: 7
---
# Managing the &tau; logs

The Flutter Sound project uses now the [logger](https://pub.dev/packages/logger) plugin.

There are three loggers : 

- One in the FlutterSoundPlayer module.
- One in the FlutterSoundRecorder module.
- One in the FlutterSoundHelper module.

The FlutterSoundPlayer logger and the FlutterSoundRecorder logger are instanciated when you create those modules.
By default, the Logger has a Log Level set to `Level.info`.

The possible values for the Log Level are :

```dart
enum Level 
{
        verbose,
        debug,
        info,
        warning,
        error,
        wtf,
        nothing,
}
```

If you don't want to see all the log messages in your console, or if you want to debugg or develop The Flutter Sound Project 
tosepecify another Log Level during the instanciation of your modules : 

```dart
FlutterSoundPlayer myPlayer = FlutterSoundPlayer(logLevel: Level.debug);
FlutterSoundRecorder myRecorder = FlutterSoundRecorder(logLevel: Level.debug);
```

Note : it is verry, very important to post your log messages when you fill an issue in github. I cannot do anything for you without the logs.

You probably do not need, but if exceptionaly you want to dynamicaly change the Log Level after the module instanciation, 
you can use the [setLogLevel()](/api/public_flutter_sound_player/FlutterSoundPlayer/setLogLevel.html) verb :

```dart
        myPlayer.setLogLevel(Level.debug);
        myRecorder.setLogLevel(Level.debug);
```

`setLogLeve()` is also used with the Helper module, because the App does not instanciate this module, but uses a singleton :

```dart
        flutterSoundHelper.setLogLevel(Level.debug);
```

