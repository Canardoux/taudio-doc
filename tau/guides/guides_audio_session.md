---
title:  "AudioSession"
summary: "Managing the audio sessions"
parent: Guides
nav_order: 4
---
# Audio Sessions

Several years ago, Flutter Sound tried to manage itself the audio sessions.
It was very convenient for most users.

But the problem is iOS : iOS has just one audio session for all the App.
This means that users wanting to use other Sound plugins, side to side with Flutter Sound, had problems.
If Flutter Sound modified the audio session, other plugins fell.

Because of that, it was decided that Flutter Sound will not manage the audio sessions anymore.
If the App wants to manage the audio session (and it probably has to), it must use another plugin
federating the audio session management for all the App.

[audio_session](https://pub.dev/packages/audio_session) for example is a very good example of such a plugin federating the audio session management.
We are fan of this plugin which is developed by nice guys and girls. We encourage you to use it.

The only case where flutter Sound modify the audio session is when the App does a [startRecorder()](/api/public_flutter_sound_recorder/FlutterSoundRecorder/startRecorder.html)
on iOS with an [AVAudioSessionCategory](https://developer.apple.com/documentation/avfaudio/avaudiosession/category-swift.struct) incompatible with recording.
We had many, many users forgetting to set a valid `AVAudioSessionCategory` and filling issues.
So, if the `AVAudioSessionCategory` is inconsistent, Flutter Sound set itself the `AVAudioSessionCategory` to [AVAudioSessionCategoryPlayAndRecord](https://developer.apple.com/documentation/avfaudio/avaudiosession/category-swift.struct/playandrecord)
instead of recording silents.

{: .hint}
Actually, the default output device is the speaker on Android, and the hearphone on iOS. If you want to play something on the speaker, you can set the [CategoryOption](https://developer.apple.com/documentation/avfaudio/avaudiosession/categoryoptions-swift.struct)
to [DefaultToSpeaker](https://developer.apple.com/documentation/avfaudio/avaudiosession/categoryoptions-swift.struct/defaulttospeaker)