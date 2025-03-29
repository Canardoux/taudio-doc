---
title:  "PCM Dart Streams"
summary: "Recording PCM-16 to a Dart Stream and Playback from a Dart Stream are two **VERY**, **VERY** important Flutter Sound features that must not be overlooked."
parent: Guides
nav_order: 3
---
# PCM Dart Streams

## Overview

Streams support on Flutter Sound is a very exciting feature. You can do two things :
- Record to a Stream, listen to it and then do what you want with the live audio data. You can process them in dart or send them to a remote server.
- Play from Stream allows you to play on your device things that are computed in dart (generator, sequencer, distorder, ...)
or things that come from a remote server,

{: .note }
> Dart Streams support is actually being developped. Some Features are not completely supported:
> - On Android non interleaved mode and Float32 are not fully implemented


### Interleaving

Flutter Sound API supports the two main modes: interleaved, or not interleaved (planar mode).
You can look to [this guide](/tau/guides/guides-pcm-wave.html) for a discussion about PCM formats.

#### Interleaved

The data are sent or received as UInt8list.
This are the Raw Data where each sample are coded with 2 or 4 unsigned bytes for each sample. This is convenient when you want to handle globally the data as raw buffers without accessing to the samples. For example when you want to send the raw data to a remote server.

#### Non interleaved (or Planar)

Non interleaved data are coded as `<List<Float32List>>` or `<List<Int16List>>` depending of the codec selected. The number of the element of the List is equal to the number of channels (1 for monophony, 2 for stereophony). This is convenient when you want to access the real audio data as Float32 or Int16. 

{: .hint}
You can specify `toStreamFloat32` or `toStreamInt16:` even when you have just one channel. In this case the length of the list is 1.

### Coding

Flutter Sound supports two codings: Float32 and Int16

- Float32: the samples are coded as Floating Point numbers
- Int16: the samples are coded as 16 bits Integers.

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Record to a Stream

To record data to a live Stream, you use the regular verb [startRecorder()](/api/public_fs_flutter_sound_recorder/FlutterSoundRecorder/startRecorder.html), with specific paramaters.
Then you listen to your stream. 
To record to a live PCM Stream, when calling the verb [startRecorder()](/api/public_fs_flutter_sound_recorder/FlutterSoundRecorder/startRecorder.html), you specify the parameter `toStream:`, `toStreamFloat32:` or `toStreamInt16:` with your Stream sink, instead of the parameter `toFile:`. This parameter is a Dart StreamSink that you can listen to, for processing the audio data. 

- The parameter `toStream:` is used when you want to record interleaved data to a `<Uint8List>` Stream Sink
- The parameter `toStreamFloat32:` is used when you want to record non interleaved data (Planar mode) to a `<List<Float32List>>` Stream Sink as Float32 samples.
- The parameter `toStreamInt16:` is used when you want to record non interleaved data (Planar mode) to a `<List<Int16List>>` Stream Sink as Int16 samples.


### Parameters for `startRecorder()`:


The parameters used for the verb [startRecorder()](/api/public_fs_flutter_sound_recorder/FlutterSoundRecorder/startRecorder.html) when you want to record to a Stream are : 

- **codec:** is mandatory. It can be either :
    - `Codec.pcm16` if you want to get your PCM samples with an Int16 coding.
    - `Codec.pcmFloat32` if you want to get your PCM samples with a Float32 coding.

- **sampleRate:** specifies your Sample Rate. It can be anything.  The default value is 16000. For example :
    - 8000 is a very low Sample rate
    - 44100 is the Sample Rate used by CD Audio
    - 48000 is a very high quality sample rate

- **numChannels:** specifies the number of channels you want. 1 for monophony, 2 for stereophony, ... The default value is 1,

- **audioSource:** specifies the source of your recording. The default value is `defaultSource` which is probably the mic and is probably what you want.

- One (and only one) of the three following parameters to specify the Stream that you will listen to:
    - **toStream:** is the StreamSink of your dart Stream when you want to get your data with the channels samples interleaved. You will receive the data as `UInt8List`, with the samples coded inside the unsigned bytes. This is convenient if you do not want to process the data in dart, and if you just want to send them to a remote server.

    -  **toStreamInt16:** is the StreamSink of your dart Stream when you want to get your data with the channel samples not interleaved not coded. You will receive the data as a `List<Int16List>`. The List corresponds to the data for each channels. The length of the list is 1 if you record monophony, 2 for stereo, ... Each Int16 will be for each sample. Note : this parameter is convenient when you want to access the audio data in dart as integers

    - **toStreamFloat32:** is the StreamSink of your dart Stream when you want to get your data with the channel samples not interleaved not coded. You will receive the data as a `List<Float32List>`. The List corresponds to the data for each channels. The length of the list is 1 if you record monophony, 2 for stereo, ... Each Float32 will be for each sample. Note : this parameter is convenient when you want to access the audio data in dart as Float32 numbers.

- **bufferSize:** is a not very interesting parameter and is for expert only. With this parameter you can specify the size of the internal buffers used by flutter Sound. I sugggest that you do not play with this parameter and keep its default value which is actually 8192. (This default value is probably too high, and I will try to downgrade it in the future),

- **enableNoiseSuppression:** is a boolean that you can set if you want to enable the _noise suppression_ feature

- **enableEchoCancellation:** is a boolean that you can set if you want to enable the _echo cancellation_ feature

- **enableVoiceProcessing:** I cannot say anything about this parameter because I don't know what it is for.

{: .note}
_enableNoiseSuppression_ and _enableEchoCancellation_ are actually only implemented on Android

{: .note}
It is really important that you specify correctly the _Codec_ parameter, the _sampleRate_, the _numChannels_ parameter and your stream.
If you don't, you will get bad results.

### Listen to your Stream

There is nothing special to listen to your stream. You will get the data in the Stream you specified in [startRecorder()](/api/public_fs_flutter_sound_recorder/FlutterSoundRecorder/startRecorder.html), coded either as an interleaved stream in `toStream:`, or as a list of not interleaved stream in `toStreamFloat32:` or `toStreamInt16:`.

### Examples

You can look to 
* This [simple example](/tau/examples/ex_record_to_stream.html) provided with Flutter Sound.
* Or this [other example](/tau/examples/ex_streams.html)

#### Example with interleaved data coded in UInt8List:

```dart
const int kSAMPLERATE = 16000;
const int kNUMBEROFCHANNELS = 2;

final FlutterSoundRecorder _mRecorder = FlutterSoundRecorder();
var recordingDataControllerUint8 = StreamController<Uint8List>();

      await _mRecorder.startRecorder(
        codec: Codec.pcmFloat32,
        sampleRate: kSAMPLERATE,
        numChannels: kNUMBEROFCHANNELS,
        audioSource: AudioSource.defaultSource,
        toStream: recordingDataControllerUint8.sink,
      );

      recordingDataControllerUint8.stream.listen((UInt8List data) {
          // Process my frame in data
          sendToMyServer(data);
      });


```

#### Example with data not interleaved (planar mode) given as Float32:

```dart
const int kSAMPLERATE = 16000;
const int kNUMBEROFCHANNELS = 2;

final FlutterSoundRecorder _mRecorder = FlutterSoundRecorder();
var recordingDataControllerF32 = StreamController<List<Float32List>>();

      await _mRecorder.startRecorder(
        codec: Codec.pcmFloat32,
        sampleRate: kSAMPLERATE,
        numChannels: kNUMBEROFCHANNELS,
        audioSource: AudioSource.defaultSource,
        toStream: recordingDataControllerF32.sink,
      );

      recordingDataControllerF32.stream.listen((data) {
        for (Float32List frame in data) {
          // Process my frame
          for (double sample in frame) {
            // process my sample
            // ...
          }
        }
      });
```

-----------------------------------------------------------------------------------------------------------------------------------
# Play from Stream

To play live stream, you start playing with the verb [startPlayerFromStream()](/api/public_fs_flutter_sound_player/FlutterSoundPlayer/startPlayerFromStream.html) instead of the regular [startPlayer()](/api/public_fs_flutter_sound_player/FlutterSoundPlayer/startPlayer.html) verb.

The main parameters for the verb [startPlayerFromStream()](/api/plpublic_fs_flutter_sound_playerayer/FlutterSoundPlayer/startPlayerFromStream.html) are : 

- `codec:` : The codec (Codec.pcm16 or Codec.pcmFloat32)
- `sampleRate:` : The sample rate
- `numChannels:` : The number of channels (1 for monophony, 2 for stereophony, or more ...)
- `interleaved:` : A boolean for specifying if the data played are interleaved. 
This parameter specifies if the data to be played are interleaved or not. When the data are interleaved, you will use the [_mPlayer.uint8ListSink](/api/public_fs_flutter_sound_player/FlutterSoundPlayer/uint8ListSink.html) to play data. When the data are not interleaved, you will use [_mPlayer.float32Sink](/api/public_fs_flutter_sound_player/FlutterSoundPlayer/float32Sink.html) or [_mPlayer.int16Sink](/api/public_fs_flutter_sound_player/FlutterSoundPlayer/int16Sink.html) depending on the codec used. When the data are interleaved, the data provided by the app must be coded as UInt8List. This is convenient when you have raw data to be played from a remote server. When the data are not interleaved, they are provided as `List<Int16List>` or `List<Float32List>`, with an array of length equal to the number of channels. 

- [_mPlayer.float32Sink](/api/public_fs_flutter_sound_player/FlutterSoundPlayer/float32Sink.html) is a Stream Sink used when the data are interleaved and when you have UInt8List buffers to be played
- [_mPlayer.int16Sink](/api/public_fs_flutter_sound_player/FlutterSoundPlayer/int16Sink.html) is a Stream Sink used when the data are not interleaved and when you have Float32 data to be played
- [_mPlayer.uint8ListSink](/api/public_fs_flutter_sound_player/FlutterSoundPlayer/uint8ListSink.html) is a Stream Sink used when the data are interleaved and when you have UInt8 data to be played

Example:
```dart
await myPlayer.startPlayerFromStream
(
    codec: Codec.pcmFloat32 
    numChannels: 2
    sampleRate: 48100
    interleaved: true,
);


await myPlayer.feedF32FromStream(aBuffer);

```


### Parameters for `startPlayerFromStream()`:

- **_codec:_** is mandatory. It can be either :
    - `Codec.pcm16` if you want to get your PCM samples with an Int16 coding
    - `Codec.pcmFloat32` if you want to get your PCM samples with a Float32 coding.

- **_sampleRate:_** specifies your Sample Rate. It can be anything. For example :
    - 8000 is a very low Sample rate
    - 44100 is the Sample Rate used by CD Audio
    - 48000 is a very high quality sample rate

- **_numChannels:_** specifies the number of channels you want. 1 for monophony, 2 for stereophony, ... 

- **_interleaved:_** is a boolean which specifies if you will provide the data to be played as an interleaved stream of Int16, or if you will provide these data as Lists of Float32List (or Lists of Int16List).

- **_bufferSize:_** is the size of the internal and external buffers. It can be anything, but results are better with a power of two (or at least a multiple of 128) and greater than 512. 1024 is a good number.

- **_onBufferUnderlow:_** is a callback to be fired when the internal buffers become low. This parameter is optional.

{: .important}
It is really important that you specify correctly the Codec parameter, the sampleRate, the numChannels parameter and the interleaved boolean.
If you don't, you will get bad results.

### whenFinished:

This parameter cannot be used. After [startPlayerFromStream()](/api/public_fs_flutter_sound_player/FlutterSoundPlayer/startPlayerFromStream.html) the player is always available until [stopPlayer()](/api/public_fs_flutter_sound_player/FlutterSoundPlayer/stopPlayer.html). The app can provide audio data when it wants. Even after an elapsed time without any audio data.

### onBufferUnderlow:

The app can specify a callback function to be called when the internal buffers are becoming low.
This can happen at the beginning of the playback, when the internal buffers are not fully loaded, or when the app stop feeding the stream.

### Play your live data

After having starting your player, you can begin to play your live data to the output device.

You have two possibilities:

- Play them without any flow control
- Play them with flow control

{: .note}
Actually, tests have been extensively done with a **constant** buffer size mutiple of 1024. It is possible that bugs are encounter with non constant buffers or not a power of two. But hopefully, everything wil be OK without this constrain.

#### Play data without flow control



The App does `myPlayer.uint8ListSink.add(d)` or `_mPlayer.float32Sink(d)` or `mPlayer.int16Sink(d)` each time it wants to play some data. No need to await, no need to verify if the previous buffers have finished to be played. All the data added to the Stream Sink are buffered, and are played sequentially. The App continues to work without knowing when the buffers are really played.

This means three things :

* If the App is very fast adding buffers to the `foodSink` it can consume a lot of memory for the waiting buffers.
* When the App has finished feeding the sink, it cannot just do `myPlayer.stopPlayer()`, because there are perhaps many buffers not yet played.
If it does a `stopPlayer()`, all the waiting buffers will be flushed which is probably not what it wants.
* The App cannot know when the audio data are really played.

_Example:_

```dart
UInt8List myBuffer;

await myPlayer.startPlayerFromStream(codec: Codec.pcm16, numChannels: 1, sampleRate: 48000, interleaved: true, bufferSize = 1024);
...
await myPlayer.uint8ListSink.add(myBuffer);
...
await myPlayer.stopPlayer();
```

#### Play data with flow control


Playing live data without flow control is very simple, because you don't have to wait//handle Futures. But sometimes it can be interesting to manage a flow control :
- When you have huge data generated and you cannot loop feeding your Stream Sink.
- When you want to know when the data has been played for generating data on demand.
- When you just want to know when your previous packet has been played


If the App wants to keep synchronization with what is played, it uses the verb feedUint8FromStream(), feedInt16FromStream() or feedF32FromStream() to play data. 
- await [feedUint8FromStream()](/api/public_fs_flutter_sound_player/FlutterSoundPlayer/feedUint8FromStream.html)
- await [feedInt16FromStream()](/api/public_fs_flutter_sound_player/FlutterSoundPlayer/feedInt16FromStream.html)
- await [feedF32FromStream()](/api/public_fs_flutter_sound_player/FlutterSoundPlayer/feedF32FromStream.html)

It is really very important not to call another `feedFromStream()` before the completion of the previous future. When each Future is completed, the App can be sure that the provided data are correctely either played, or at least put in low level internal buffers, and it knows that it is safe to do another one.

_Example:_

```dart
UInt8List myBuffer;

await myPlayer.startPlayerFromStream(codec: Codec.pcm16, numChannels: 1, sampleRate: 48000, interleaved: true);
...
await myPlayer.feedUint8FromStream(myBuffer);
...
await myPlayer.stopPlayer();
```

You will `await` or use `then()` for each call to `feedFromStream()`.


{: .warning}
It is really important that you feed the correct stream, depending on the `interleaved` parameter and the Codec parameter.
If you data are interleaved, you must feed your stream with `myPlayer.uint8ListSink.add(d)` or `feedUint8FromStream()`.
If your data are not interleaved, use `_mPlayer.float32Sink(d)`/`mPlayer.int16Sink(d);` or `feedInt16FromStream()`/`feedF32FromStream()`.

{: .warning}
If your data are not interleaved, it is really important that all the lists with which you feed your stream have exactly the length of your number of channels.
It is also very important that the data for each channels have exactly the same length.

### _Examples_

You can look to the provided examples :

* [This example](/tau/examples/ex_playback_from_stream_2.html) shows how to play live data, with Back Pressure.
* [This example](/tau/examples/ex_playback_from_stream_1.html) shows how to play live data, without Back Pressure.
* [This example](/tau/examples/ex_streams.html) shows how to play Float32, or Int16, Interleaved or Planar.


