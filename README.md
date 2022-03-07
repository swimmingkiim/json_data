<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

# json_data
Helper package for converting nested json

## Features
* string -> json array (List)
* string -> json object (Map)
* List -> stringified json
* Map -> stringified json

## Getting started

* No prerequisites required

## Usage

```dart
// return : stringified json
JsonData.toJsonString({
      'hello': 'world',
      'list': [
        1,
        null,
        true,
        'flutter',
        false,
        [456, 654],
        {
          'deep-level': null,
          'deeper-level': {'hello': 'world'}
        }
      ]
    });
```
```dart
// return : Map<String, dynamic>
JsonData.fromJsonString(
        '{"hello": "world", "list": [1, null, true, "flutter", false, [456, 654], {"deep-level": null, "deeper-level": {"hello": "world"}}]}')
```

## Additional information
* If you have any issue or suggestion contact me via github.
[github repository](https://github.com/swimmingkiim/json_data)
