---
title:  "On Progress"
summary: "Getting a Stream of events during playback or recording."
parent: Guides
nav_order: 10
---
# OnProgress
## A Stream of callbacks

Having a callback from Flutter Sound during a playback or a recording is convenient and very simple.
This guide is only because too many Flutter Sound users
get problems with this very simple feature.

## The Player API

- Declare a subscription and listen to it
```dart
StreamSubscription? _mPlayerSubscription;
  ...
    await _mPlayer.openPlayer();
    _mPlayerSubscription = _mPlayer.onProgress!.listen((e) {
      setState(() {
        pos = e.position.inMilliseconds;
      });
    });
```

- Call [setSubscripionDuration](/api/public_fs_flutter_sound_player/FlutterSoundPlayer/setSubscriptionDuration.html). This step is very important. By default, the duration is `Duration.zero` which means that the feature is desactivated. Many, many Flutter Sound users forget to call this verb.
```dart
    await _mPlayer.setSubscriptionDuration(
      Duration(milliseconds: 100), // 100 ms
    );
```

- When finished you can cancel your subscription
```dart
    if (_mPlayerSubscription != null) {
      _mPlayerSubscription!.cancel();
      _mPlayerSubscription = null;
    }
```

### Example

A runnable example [is here](/tau/examples/ex_player_onProgress.html).


## The Recorder API

- Declare a subscription and listen to it
```dart
StreamSubscription? _recorderSubscription;
...
    await await _mRecorder.openRecorder();;
    _recorderSubscription = _mRecorder.onProgress!.listen((e) {
      setState(() {
        pos = e.duration.inMilliseconds;
        if (e.decibels != null) {
          dbLevel = e.decibels as double;
        }
      });
    });
```

- Call [setSubscripionDuration](/api/public_fs_flutter_sound_recorder/FlutterSoundRecorder/setSubscriptionDuration.html). This step is very important. By default, the duration is `Duration.zero` which means that the feature is desactivated. Many, many Flutter Sound users forget to call this verb.
```dart
    setState(() {});
    await _mRecorder.setSubscriptionDuration(
      Duration(milliseconds: 100), // 100 ms
    );
```

- When finished you can cancel your subscription
```dart
    if (_recorderSubscription != null) {
      _recorderSubscription!.cancel();
      _recorderSubscription = null;
    }
```

### Example
A runnable example [is here](/tau/examples/ex_recorder_onProgress.html).

## Trouble shooting

### I don't receive any event in my stream subscription
{% include warning.html content="
If you don't receive any callback in your stream, this is certainly because you forgot to call `setSubscripionDuration`.
"%}


### On Android, the Player position restarts sometimes to 0

There is a bug inside Android. I am not sure that we can do anything for that.