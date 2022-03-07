import 'package:json_data/json_data.dart';

class Example {
  testToJsonString() {
    print(JsonData.toJsonString({
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
    }));
  }

  testToJsonArrayString() {
    print(JsonData.toJsonArrayString([
      {
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
      }
    ]));
  }

  testFromJsonString() {
    print(JsonData.fromJsonString(
        '{"hello": "world", "list": [1, null, true, "flutter", false, [456, 654], {"deep-level": null, "deeper-level": {"hello": "world"}}]}'));
  }

  testFromJsonArrayString() {
    print(JsonData.fromJsonArrayString(
        '[{"hello": "world", "list": [1, null, true, "flutter", false, [456, 654], {"deep-level": null, "deeper-level": {"hello": "world"}}]}]'));
  }
}
