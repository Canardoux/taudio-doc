---
title:  "Dev"
description: "We need you!"
summary: "We need you!"
nav_order: 7
---

# We really need your contributions

Flutter Sound is a free and Open Source project. Several contributors have already contributed to Flutter Sound.

**We really need your contributions.**
We greatly appreciate any contributions to the project which can be as simple as providing feedback on the API or documentation.
Pull Requests are welcome and will be considered very carefully.

Or even better, you could be one of the main Flutter Sound developers.
We are hiring ;-)

{% include important.html content="
"%}
## Setup a development environment

Clone the Flutter Sound project and the flutter_sound_core module

```sh
cd some_where
git clone --recursive https://github.com/Canardoux/tau
```
Tau is a set of submodules. It will be easier for you to
develop if you get all of them

## setup a development environment

cd to the &tau; root dir and run the script `bin/reldev.sh DEV`

```sh
cd tau
bin/reldev.sh DEV
```
This script is convenient to set everything so that you can use a debugger.
This script uses `gsed` which is the GNU flavor of `sed`.
If using a macintosh, you probably want to get this shell command (Home brew!)

## iOS signing

Open tau/flutter_sound/example/ios/Runner.xcworkspace in XCode, and set your `Team` in the `Signing & Capabilities` tab.

## Clean your space

Probably good to clean the space :

```sh
cd flutter_sound/example
rm -r build ios/.symlinks ios/Podfile.lock
flutter clean
flutter pub get
cd ios
pod install
cd ..
```

## Architecture of Flutter Sound

![Architecture](architecture.png)
## Debug the example

If everything good, you are now ready to run the example in debug mode using either Visual Studio Code, Android Studio or XCode

- To debug/develop the Dart side, you open the project /tau/flutter_sound/example/ in Visual Studio Code or Android Studio.
- To debug/develop the iOS side you open /tau/flutter_sound/example/ios/Runner.xcworkspace in XCode.
- To debug/develop the Android side, you open the project /tau/flutter_sound/example/android in Android Studio
- To debug/develop the Javascript side you use the Developer Tool inside Google Chrome

## Debug your own App

You must change the dependencies in your pubspec.yaml file and do a `flutter pub get`:

```yaml
# ============================================================================
# The following instructions are just for developing/debugging Flutter Sound
# Do not put them in a real App
  flutter_sound_platform_interface:
    path: ../tau/flutter_sound_platform_interface # flutter_sound_platform_interface Dir
  flutter_sound_web:
    path: ../tau/flutter_sound_web # flutter_sound_web Dir
  flutter_sound: 
    path: ../tau/flutter_sound
# ============================================================================
```

## Update the documentation

&tau; uses the Jekyll tool with a "Documentation Theme" to generate the documentation.
[Here](https://just-the-docs.com/) is the `Just the Docs` documentation.
Please refer to this documentation to install ruby and jekyll on your dev machine.

All the &tau; documentation is in markdown files under /tau/fs-doc/tau.
You can see your modifications in live doing:

```sh
cd /tau/fs-doc
jekyll serve
```
or
```sh
cd /tau/fs-doc
bundle exec jekyll serve
```

## Publish the docs

Then, if you have the necessary credentials (but you certainly do not have them), you can do:

```sh
cd /tau/fs-doc
bin/pub.sh
```

## Build a new release

if you have the necessary credentials (but you certainly do not have them), you can do:

```sh
cd /tau/flutter_sound
pub.sh 9.2.0
```

(In this example, 9.2.0 is the version number that you want to build).

------------------

When you have finished your contribution, you commit and push your files, and do a Pull Request in the [Github flutter_sound](https://github.com/canardoux/flutter_sound/) Project.

# THANK YOU FOR YOUR CONTRIBUTION
