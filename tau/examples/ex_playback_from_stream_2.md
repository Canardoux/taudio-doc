---
title:  "Play Stream with flow control"
summary: "Play from a dart stream, with flow control."
parent: Examples
nav_order: 6
---
# Play stream with flow control example

The example source [is there](https://github.com/canardoux/taudio/blob/master/example/lib/livePlaybackWithBackPressure/live_playback_with_back_pressure.dart). You can have a live run of the examples [here](/live/index.html).

An example showing how to play Live Data with back pressure. It feeds a live stream, waiting that the futures are completed for each block.

This example get the data from an asset file, which is completely stupid : if an App wants to play an asset file he must use [startPlayer(fromDataBuffer:)](/api/public_fs_flutter_sound_player/FlutterSoundPlayer/startPlayer.html).
Then it calls [startPlayerFromStream()](/api/public_fs_flutter_sound_player/FlutterSoundPlayer/startPlayerFromStream.html) to play the buffer

If you do not need any back pressure, you can see another simple example : [LivePlaybackWithoutBackPressure.dart](ex_playback_from_stream_1.html).
This other example is a little bit simpler because the App does not need to await the playback for each block before playing another one.

## You can see also those examples:
- [Streams](ex_streams)
- [Record To Stream](ex_record_to_stream)
- [Live Playback Without Backpressure](ex_playback_from_stream_1)

![screen shot](ScreenShots/PlaybackWithBackPressure.png)