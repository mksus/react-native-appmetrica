[![Build Status](https://travis-ci.org/doochik/react-native-appmetrica.svg?branch=master)](https://travis-ci.org/doochik/react-native-appmetrica)
[![NPM version](https://badge.fury.io/js/react-native-appmetrica.svg)](https://www.npmjs.com/package/react-native-appmetrica)


# react-native-appmetrica
This is fork for [React Native AppMetrica](https://github.com/yandexmobile/react-native-appmetrica).
Since RN linking has changed in 0.60 and 0.61 versions, original appmetrica causes build fails.
This fork with installation notes below works for RN 0.61.5

## Installation notes

#### yarn
1. Add "react-native-appmetrica": "https://github.com/mksus/react-native-appmetrica#master to your package.json dependencies
2. yarn install (if you already had appmetrica installed, remove node_modules and yarn.lock to update package contents)
#### iOS
3. Add following line to ios/Podfile dependencies. Make sure you have ```use_frameworks!``` line in your Podfile 
[official instructions](https://tech.yandex.com/appmetrica/doc/mobile-sdk-dg/tasks/ios-quickstart-docpage/)
```
pod 'YandexMobileMetrica/Dynamic', '3.9.2'
``` 
4. 
``` 
cd ios; pod install
```
#### Android
5. Add following line to your android/app/build.gradle dependencies 
[official instruction](https://tech.yandex.com/appmetrica/doc/mobile-sdk-dg/concepts/android-initialize-docpage/) 
(react-native-appmetrica is initialized from you JS code, so you only need Step 1)
```
    implementation 'com.yandex.android:mobmetricalib:3.8.0'
```
6. ```react-native run-android``` to run debug version or ```cd android && ./gradlew clean && ./gradlew assembleRelease``` to build apk

## Example

```js
import AppMetrica from 'react-native-appmetrica';

AppMetrica.activateWithApiKey('2dee16d2-1143-4cd3-a904-39ce10ac2755');

AppMetrica.reportEvent('Hello world');
```

## Usage

```js
import AppMetrica from 'react-native-appmetrica';

// Starts the statistics collection process.
AppMetrica.activateWithApiKey('...KEY...');
// OR
AppMetrica.activateWithConfig({
  apiKey: '...KEY...',
  sessionTimeout: 120,
  firstActivationAsUpdate: true,
});

// Sends a custom event message and additional parameters (optional).
AppMetrica.reportEvent('My event');
AppMetrica.reportEvent('My event', { foo: 'bar' });

// Send a custom error event.
AppMetrica.reportError('My error');
```
