---
title:  "Installation"
summary: "Taudio installation."
parent: Guides
nav_order: 2
---
# Installation

## Install

Taudio is a regular Flutter plugin. For help on adding a Flutter plugin as a dependency, view the Flutter [documentation](https://flutter.io/using-packages/).

## SDK requirements

* Taudio requires an iOS 10.0 SDK \(or later\)
* Taudio requires an Android 21 \(or later\)

## Linking your App directly from `pub.dev`

Add `Taudio` as a dependency in pubspec.yaml.

```text
dependencies:
  flutter:
    sdk: flutter
  Taudio: ^10.0
```

## Linking your App with Taudio sources \(optional\)

The Taudio sources [are here](https://github.com/canardoux/taudio).
It is a subproject of [tau](https://github.com/canardoux/tau)

You probably want to look to [the Dev notice](/tau/dev.html)

```bash
cd /some/where
git clone --recursive https://github.com/canardoux/tau
cd /some/where/tau
bin/reldev.sh DEV
```

and add your dependency in your pubspec.yaml :

```text
dependencies:
  flutter:
    sdk: flutter
  taudio:
    path: /some/where/tau/taudio
```


## Post Installation

* On _iOS_ you may need to add usage descriptions to `info.plist`:

  ```markup
        <key>UIBackgroundModes</key>
        <array>
                <string>audio</string>
        </array>
        <key>NSMicrophoneUsageDescription</key>
        <string>MyApp uses the microphone to record your speech and convert it to text.</string>
  ```

If your App needs to play remote files you possibly must add :

```markup
       <key>NSAppTransportSecurity</key>
       <dict>
               <key>NSAllowsArbitraryLoads</key>
               <true/>
       </dict>
```

* On _Android_ you need to add a permission to `AndroidManifest.xml`:

  ```markup
  <uses-permission android:name="android.permission.RECORD_AUDIO" />
  <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
  ```

## Flutter Web

From version 9.x, the app does not need anymore to include the Flutter Sound library in its 'index.html'.

### WASM support

`Taudio` is fully supported by WASM. 

To run under WASM :
```sh
flutter run -d chrome --wasm
```

to build for WASM:
```sh
 flutter build web --wasm
 ```


## Troubles shooting

### Problem with Cocoapods

If you get those errors during Pod install:
```text
The following Swift pods cannot yet be integrated as static libraries: flutter_sound_core
You may set `use_modular_headers!` globally in your Podfile, or specify `:modular_headers => true` for particular dependencies.
```
I had to add the following line at the bottom of my Podfile:

```text
# The following line was added by LARPOUX because iOS complained. Not good!
use_modular_headers!
```

Actually I don't understand why this line is necessary in my Taudio example, but was not in the Flutter Sound example

### Other problem with Cocoapods

If you get this message \(specially after the release of a new Flutter Version\) :

```text
Cocoapods could not find compatible versions for pod ...
```

you can try the following instructions sequence \(and ignore if some commands gives errors\) :

```bash
cd ios
pod cache clean --all
rm Podfile.lock
rm -rf .symlinks/
cd ..
flutter clean
flutter pub get
cd ios
pod update
pod repo update
pod install --repo-update
pod update
pod install
cd ..
```

If everything good, the last `pod install` must not give any error.

### Problem with the linker during iOS link-edit

If you get this weird message from the Xcode linker : 
```
Undefined symbols for architecture arm64:
"___gxx_personality_v0",
```

Just add this flag in XCode > Build Settings > Other Linker Flags :

```
-lc++
```
